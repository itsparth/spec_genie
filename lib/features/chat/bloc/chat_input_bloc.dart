import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:record/record.dart';
import 'package:image_picker/image_picker.dart' as picker;
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../tags/models/tag.dart';
import '../models/chat_input.dart';
import '../utils/input_utils.dart';
import '../utils/chat_input_converter.dart';
import '../models/chat_input_state.dart';
import 'chat_bloc.dart';

part 'chat_input_bloc.g.dart';

/// Manages chat input state for a specific thread
@riverpod
class ChatInputBloc extends _$ChatInputBloc {
  static const _uuid = Uuid();
  late final AudioRecorder _audioRecorder;
  late final picker.ImagePicker _imagePicker;
  late final TextEditingController _textController;
  Timer? _recordingTimer;
  Timer? _amplitudeTimer;
  Timer? _pulseTimer;

  @override
  ChatInputState build() {
    _audioRecorder = AudioRecorder();
    _imagePicker = picker.ImagePicker();
    _textController = TextEditingController();

    // Listen to text changes from the controller
    _textController.addListener(() {
      if (state.textInput != _textController.text) {
        state = state.copyWith(textInput: _textController.text);
      }
    });

    // Clean up resources when the provider is disposed
    ref.onDispose(() {
      _audioRecorder.dispose();
      _textController.dispose();
      _recordingTimer?.cancel();
      _amplitudeTimer?.cancel();
      _pulseTimer?.cancel();
    });

    return const ChatInputState();
  }

  // Getter for text controller
  TextEditingController get textController => _textController;

  // Text input methods
  void updateTextInput(String text) {
    state = state.copyWith(textInput: text);
    if (_textController.text != text) {
      _textController.text = text;
    }
  }

  void clearTextInput() {
    state = state.copyWith(textInput: '');
    _textController.clear();
  }

  // Content management (single content only)
  void setCurrentContent(ChatInput content) {
    // Clear any existing content and set new one
    state = state.copyWith(currentContent: content);

    // Switch mode based on content type
    switch (content.type) {
      case ChatInputType.text:
        state = state.copyWith(currentMode: ChatInputMode.text);
        break;
      case ChatInputType.audio:
        state = state.copyWith(currentMode: ChatInputMode.audio);
        break;
      case ChatInputType.image:
        state = state.copyWith(currentMode: ChatInputMode.image);
        break;
      case ChatInputType.file:
        state = state.copyWith(currentMode: ChatInputMode.file);
        break;
    }
  }

  void clearCurrentContent() {
    state = state.copyWith(
      currentContent: null,
      currentMode: ChatInputMode.text,
    );
  }

  // Tag management methods
  void addTag(Tag tag) {
    if (state.selectedTags.any((t) => t.id == tag.id)) return;
    state = state.copyWith(selectedTags: state.selectedTags.add(tag));
  }

  void removeTag(Tag tag) {
    state = state.copyWith(
        selectedTags: state.selectedTags.removeWhere((t) => t.id == tag.id));
  }

  void setTags(List<Tag> tags) {
    state = state.copyWith(selectedTags: tags.toIList());
  }

  void clearTags() {
    state = state.copyWith(selectedTags: const IListConst([]));
  }

  // Mode switching
  void switchMode(ChatInputMode mode) {
    state = state.copyWith(currentMode: mode);
  }

  // Audio recording methods
  void _startRecordingVisuals() {
    _startRecordingTimer();
    _startAmplitudeMonitoring();
    _startPulseTimer();
  }

  void _stopRecordingVisuals() {
    _stopRecordingTimer();
    _stopAmplitudeMonitoring();
    _stopPulseTimer();
  }

  Future<void> startRecording({AudioRecordingConfig? config}) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      // Check and request microphone permission
      final hasPermission = await _checkMicrophonePermission();
      if (!hasPermission) {
        state = state.copyWith(
          isLoading: false,
          error: 'Microphone permission is required for recording',
          audioState: state.audioState.copyWith(hasPermission: false),
        );
        return;
      }

      // Configure recording
      final recordingConfig = config ?? state.recordingConfig;
      const recordConfig = RecordConfig();

      // Generate unique filename
      final directory = await getApplicationCacheDirectory();
      final fileName = 'audio_${_uuid.v4()}.mp3';
      final filePath = path.join(directory.path, 'recordings', fileName);

      // Ensure recordings directory exists
      await Directory(path.dirname(filePath)).create(recursive: true);

      // Start recording
      await _audioRecorder.start(recordConfig, path: filePath);

      state = state.copyWith(
        isLoading: false,
        recordingConfig: recordingConfig,
        audioState: state.audioState.copyWith(
          status: RecordingStatus.recording,
          filePath: filePath,
          duration: Duration.zero,
          hasPermission: true,
          error: null,
          triggerStartFeedback: true,
          triggerStopFeedback: false,
        ),
      );

      _startRecordingVisuals();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to start recording: $e',
        audioState: state.audioState.copyWith(
          status: RecordingStatus.error,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> stopRecording() async {
    try {
      state = state.copyWith(isLoading: true);

      final filePath = await _audioRecorder.stop();
      _stopRecordingVisuals();

      if (filePath != null) {
        // Just stop recording and update state, don't add to pending inputs yet
        state = state.copyWith(
          isLoading: false,
          audioState: state.audioState.copyWith(
            status: RecordingStatus.stopped,
            filePath: filePath,
            triggerStartFeedback: false,
            triggerStopFeedback: true,
          ),
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          audioState: state.audioState.copyWith(
            status: RecordingStatus.error,
            error: 'Recording failed - no file path returned',
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to stop recording: $e',
        audioState: state.audioState.copyWith(
          status: RecordingStatus.error,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> saveRecording() async {
    if (state.audioState.status != RecordingStatus.stopped ||
        state.audioState.filePath == null) {
      return;
    }

    try {
      // Create audio chat input from the stopped recording
      final audioInput = AudioChatInput(
        id: _uuid.v4(),
        createdAt: DateTime.now(),
        filePath: state.audioState.filePath!,
        fileName: path.basename(state.audioState.filePath!),
        duration: state.audioState.duration,
        source: AudioInputSource.recording,
      );

      // Set as current content instead of adding to pending inputs
      setCurrentContent(audioInput);

      // Reset audio state after saving
      state = state.copyWith(
        audioState: const AudioRecordingState(),
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to save recording: $e',
        audioState: state.audioState.copyWith(
          status: RecordingStatus.error,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> pauseRecording() async {
    try {
      await _audioRecorder.pause();
      _stopRecordingVisuals();

      state = state.copyWith(
        audioState: state.audioState.copyWith(
          status: RecordingStatus.paused,
          triggerStartFeedback: false,
          triggerStopFeedback: false,
        ),
      );
      _startPulseTimer();
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to pause recording: $e',
        audioState: state.audioState.copyWith(
          status: RecordingStatus.error,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> resumeRecording() async {
    try {
      await _audioRecorder.resume();
      _startRecordingVisuals();

      state = state.copyWith(
        audioState: state.audioState.copyWith(
          status: RecordingStatus.recording,
          triggerStartFeedback: true,
          triggerStopFeedback: false,
        ),
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to resume recording: $e',
        audioState: state.audioState.copyWith(
          status: RecordingStatus.error,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> cancelRecording() async {
    try {
      state = state.copyWith(isLoading: true);

      // Stop recording without saving
      await _audioRecorder.stop();
      _stopRecordingVisuals();

      // Delete the recording file if it exists
      final filePath = state.audioState.filePath;
      if (filePath != null) {
        try {
          final file = File(filePath);
          if (await file.exists()) {
            await file.delete();
          }
        } catch (e) {
          // Ignore file deletion errors
        }
      }

      // Reset audio state without adding to pending inputs
      state = state.copyWith(
        isLoading: false,
        audioState: const AudioRecordingState(), // Reset to initial state
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to cancel recording: $e',
        audioState: state.audioState.copyWith(
          status: RecordingStatus.error,
          error: e.toString(),
        ),
      );
    }
  }

  // Image selection methods
  Future<void> captureImage() async {
    await _selectImage(picker.ImageSource.camera);
  }

  Future<void> selectImageFromGallery() async {
    await _selectImage(picker.ImageSource.gallery);
  }

  Future<void> selectMultipleImages() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final List<picker.XFile> images = await _imagePicker.pickMultiImage();

      // For single content mode, just take the first image
      if (images.isNotEmpty) {
        final image = images.first;
        final imageInput = ImageChatInput(
          id: _uuid.v4(),
          createdAt: DateTime.now(),
          filePath: image.path,
          fileName: image.name,
          mimeType: image.mimeType,
        );

        setCurrentContent(imageInput);
      }

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to select images: $e',
      );
    }
  }

  // File selection methods
  Future<void> selectFiles({
    FileInputType? filterType,
    bool allowMultiple = false,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      FilePickerResult? result;

      if (filterType == FileInputType.audio) {
        result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: InputUtils.audioExtensions,
          allowMultiple: false, // Single content only
        );
      } else if (filterType == FileInputType.image) {
        result = await FilePicker.platform.pickFiles(
          type: FileType.image,
          allowMultiple: false, // Single content only
        );
      } else {
        // Allow both audio and image files
        result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: InputUtils.allSupportedExtensions,
          allowMultiple: false, // Single content only
        );
      }

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first; // Only take the first file
        if (file.path != null) {
          final fileType = InputUtils.getFileInputType(file.extension);
          final fileInput = FileChatInput(
            id: _uuid.v4(),
            createdAt: DateTime.now(),
            filePath: file.path!,
            fileName: file.name,
            fileSize: file.size,
            mimeType: InputUtils.getMimeType(file.extension),
            fileType: fileType,
          );

          setCurrentContent(fileInput);
        }
      }

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to select files: $e',
      );
    }
  }

  // Content management methods (replacing pending inputs management)
  void removeCurrentContent() {
    clearCurrentContent();
  }

  void clearAllContent() {
    clearCurrentContent();
  }

  // Send methods
  List<ChatInput> prepareInputsForSending() {
    final inputs = <ChatInput>[];

    // Add text input if present
    if (state.textInput.trim().isNotEmpty) {
      inputs.add(TextChatInput(
        id: _uuid.v4(),
        createdAt: DateTime.now(),
        text: state.textInput.trim(),
      ));
    }

    // Add current content if present
    if (state.currentContent != null) {
      inputs.add(state.currentContent!);
    }

    return inputs;
  }

  void clearAllInputs() {
    state = state.copyWith(
      textInput: '',
      currentContent: null,
      currentMode: ChatInputMode.text,
      audioState: const AudioRecordingState(),
    );
  }

  void clearAllInputsIncludingTags() {
    state = state.copyWith(
      textInput: '',
      currentContent: null,
      currentMode: ChatInputMode.text,
      audioState: const AudioRecordingState(),
      selectedTags: const IListConst([]),
    );
  }

  /// Send all prepared inputs as messages, creating a thread if none exists
  Future<void> sendMessage(int? threadId) async {
    // Get the prepared inputs
    final inputs = prepareInputsForSending();
    final selectedTags = state.selectedTags;

    if (inputs.isEmpty) return;

    // Clear inputs immediately to provide responsive UI
    clearAllInputs();

    try {
      // Get the chat bloc
      final chatBloc = ref.read(chatBlocProvider(threadId).notifier);

      // Get or create tags if any are selected
      List<Tag> tagsToAttach = [];
      if (selectedTags.isNotEmpty) {
        // Tags are already Tag objects, so we can use them directly
        tagsToAttach = selectedTags.toList();
      }

      // Convert each input to a message and let ChatBloc handle thread creation & naming.
      // (Thread name generation moved entirely to ChatBloc.)
      for (final input in inputs) {
        final message = ChatInputConverter.convertChatInputToMessage(input);
        if (tagsToAttach.isNotEmpty) {
          message.tags.addAll(tagsToAttach);
        }
        await chatBloc.addMessage(message); // no threadName passed anymore
      }
    } catch (e) {
      // Record error so UI can react (snackbar, banner, etc.).
      state = state.copyWith(error: 'Failed to send message: $e');
    }
  }

  // Private helper methods
  Future<bool> _checkMicrophonePermission() async {
    // On Linux desktop, always return true as permissions are handled at OS level
    if (Platform.isLinux) {
      return true;
    }

    final status = await Permission.microphone.status;
    if (status.isDenied) {
      final result = await Permission.microphone.request();
      return result.isGranted;
    }
    return status.isGranted;
  }

  Future<void> _selectImage(picker.ImageSource source) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final picker.XFile? image = await _imagePicker.pickImage(source: source);

      if (image != null) {
        final imageInput = ImageChatInput(
          id: _uuid.v4(),
          createdAt: DateTime.now(),
          filePath: image.path,
          fileName: image.name,
          mimeType: image.mimeType,
        );

        setCurrentContent(imageInput);
      }

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to capture/select image: $e',
      );
    }
  }

  void _startRecordingTimer() {
    _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentDuration =
          state.audioState.duration + const Duration(seconds: 1);
      state = state.copyWith(
        audioState: state.audioState.copyWith(duration: currentDuration),
      );
    });
  }

  void _stopRecordingTimer() {
    _recordingTimer?.cancel();
    _recordingTimer = null;
  }

  void _startAmplitudeMonitoring() {
    _amplitudeTimer =
        Timer.periodic(const Duration(milliseconds: 50), (timer) async {
      try {
        final amplitude = await _audioRecorder.getAmplitude();
        // Normalize amplitude to 0-1 range and apply some smoothing
        final normalizedAmplitude =
            (amplitude.current + 160) / 160; // -160dB to 0dB range
        final clampedAmplitude = normalizedAmplitude.clamp(0.0, 1.0);

        state = state.copyWith(
          audioState: state.audioState.copyWith(
            amplitude: clampedAmplitude,
          ),
        );
      } catch (e) {
        // Ignore amplitude monitoring errors
      }
    });
  }

  void _stopAmplitudeMonitoring() {
    _amplitudeTimer?.cancel();
    _amplitudeTimer = null;
  }

  void _startPulseTimer() {
    // 60fps approx -> every ~16ms
    _pulseTimer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      final current = state.audioState.pulsePhase;
      // Advance phase and wrap
      final next = (current + 0.04) % 1.0; // adjustable speed
      state = state.copyWith(
        audioState: state.audioState.copyWith(
          pulsePhase: next,
        ),
      );
    });
  }

  void _stopPulseTimer() {
    _pulseTimer?.cancel();
    _pulseTimer = null;
  }

  // Acknowledge feedback triggers so UI won't re-fire.
  void ackRecordingFeedback() {
    final audio = state.audioState;
    if (!audio.triggerStartFeedback && !audio.triggerStopFeedback) return;
    state = state.copyWith(
      audioState: audio.copyWith(
        triggerStartFeedback: false,
        triggerStopFeedback: false,
      ),
    );
  }
}
