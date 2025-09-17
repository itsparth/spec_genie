import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:record/record.dart';
import 'package:image_picker/image_picker.dart' as picker;
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../models/chat_input.dart';
import 'chat_input_state.dart';

part 'chat_input_bloc.g.dart';

@riverpod
class ChatInputBloc extends _$ChatInputBloc {
  static const _uuid = Uuid();
  late final AudioRecorder _audioRecorder;
  late final picker.ImagePicker _imagePicker;
  Timer? _recordingTimer;
  Timer? _amplitudeTimer;

  @override
  ChatInputState build() {
    _audioRecorder = AudioRecorder();
    _imagePicker = picker.ImagePicker();

    // Clean up resources when the provider is disposed
    ref.onDispose(() {
      _audioRecorder.dispose();
      _recordingTimer?.cancel();
      _amplitudeTimer?.cancel();
    });

    return const ChatInputState();
  }

  // Text input methods
  void updateTextInput(String text) {
    state = state.copyWith(textInput: text);
  }

  void clearTextInput() {
    state = state.copyWith(textInput: '');
  }

  // Mode switching
  void switchMode(ChatInputMode mode) {
    state = state.copyWith(currentMode: mode);
  }

  // Audio recording methods
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
      final recordConfig = RecordConfig(
        encoder: _getAudioEncoder(recordingConfig.encoder),
        sampleRate: recordingConfig.sampleRate,
        bitRate: recordingConfig.bitRate,
        numChannels: recordingConfig.numChannels,
        autoGain: recordingConfig.enableNoiseReduction,
        echoCancel: recordingConfig.enableEchoCancellation,
        noiseSuppress: recordingConfig.enableNoiseReduction,
      );

      // Generate unique filename
      final directory = await getApplicationDocumentsDirectory();
      final fileName = 'audio_${_uuid.v4()}.m4a';
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
        ),
      );

      // Start recording timer
      _startRecordingTimer();

      // Start amplitude monitoring
      _startAmplitudeMonitoring();
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
      _stopRecordingTimer();
      _stopAmplitudeMonitoring();

      if (filePath != null) {
        // Create audio chat input
        final audioInput = AudioChatInput(
          id: _uuid.v4(),
          createdAt: DateTime.now(),
          filePath: filePath,
          fileName: path.basename(filePath),
          duration: state.audioState.duration,
          source: AudioInputSource.recording,
        );

        state = state.copyWith(
          isLoading: false,
          audioState: state.audioState.copyWith(
            status: RecordingStatus.stopped,
            filePath: filePath,
          ),
          pendingInputs: state.pendingInputs.add(audioInput),
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

  Future<void> pauseRecording() async {
    try {
      await _audioRecorder.pause();
      _recordingTimer?.cancel();
      _amplitudeTimer?.cancel();

      state = state.copyWith(
        audioState: state.audioState.copyWith(
          status: RecordingStatus.paused,
        ),
      );
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
      _startRecordingTimer();
      _startAmplitudeMonitoring();

      state = state.copyWith(
        audioState: state.audioState.copyWith(
          status: RecordingStatus.recording,
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

      final imageInputs = <ImageChatInput>[];
      for (final image in images) {
        final imageInput = ImageChatInput(
          id: _uuid.v4(),
          createdAt: DateTime.now(),
          filePath: image.path,
          fileName: image.name,
          mimeType: image.mimeType,
        );
        imageInputs.add(imageInput);
      }

      state = state.copyWith(
        isLoading: false,
        pendingInputs: state.pendingInputs.addAll(imageInputs),
      );
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
          allowedExtensions: ['mp3', 'm4a', 'wav', 'aac', 'ogg', 'flac'],
          allowMultiple: allowMultiple,
        );
      } else if (filterType == FileInputType.image) {
        result = await FilePicker.platform.pickFiles(
          type: FileType.image,
          allowMultiple: allowMultiple,
        );
      } else {
        // Allow both audio and image files
        result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: [
            // Audio
            'mp3', 'm4a', 'wav', 'aac', 'ogg', 'flac',
            // Image
            'jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp',
          ],
          allowMultiple: allowMultiple,
        );
      }

      if (result != null && result.files.isNotEmpty) {
        final fileInputs = <FileChatInput>[];

        for (final file in result.files) {
          if (file.path != null) {
            final fileType = _getFileInputType(file.extension);
            final fileInput = FileChatInput(
              id: _uuid.v4(),
              createdAt: DateTime.now(),
              filePath: file.path!,
              fileName: file.name,
              fileSize: file.size,
              mimeType: _getMimeType(file.extension),
              fileType: fileType,
            );
            fileInputs.add(fileInput);
          }
        }

        state = state.copyWith(
          isLoading: false,
          pendingInputs: state.pendingInputs.addAll(fileInputs),
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to select files: $e',
      );
    }
  }

  // Pending inputs management
  void removePendingInput(String inputId) {
    state = state.copyWith(
      pendingInputs:
          state.pendingInputs.removeWhere((input) => input.id == inputId),
    );
  }

  void clearPendingInputs() {
    state = state.copyWith(
      pendingInputs: const IListConst([]),
    );
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

    // Add all pending inputs
    inputs.addAll(state.pendingInputs);

    return inputs;
  }

  void clearAllInputs() {
    state = state.copyWith(
      textInput: '',
      pendingInputs: const IListConst([]),
      currentMode: ChatInputMode.text,
      audioState: const AudioRecordingState(),
    );
  }

  // Private helper methods
  Future<bool> _checkMicrophonePermission() async {
    final status = await Permission.microphone.status;
    if (status.isDenied) {
      final result = await Permission.microphone.request();
      return result.isGranted;
    }
    return status.isGranted;
  }

  AudioEncoder _getAudioEncoder(String encoder) {
    switch (encoder.toLowerCase()) {
      case 'aacLc':
        return AudioEncoder.aacLc;
      case 'aacEld':
        return AudioEncoder.aacEld;
      case 'aacHe':
        return AudioEncoder.aacHe;
      case 'amrNb':
        return AudioEncoder.amrNb;
      case 'amrWb':
        return AudioEncoder.amrWb;
      case 'opus':
        return AudioEncoder.opus;
      case 'wav':
        return AudioEncoder.wav;
      case 'flac':
        return AudioEncoder.flac;
      case 'pcm16bits':
        return AudioEncoder.pcm16bits;
      default:
        return AudioEncoder.aacLc;
    }
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

        state = state.copyWith(
          isLoading: false,
          pendingInputs: state.pendingInputs.add(imageInput),
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to capture/select image: $e',
      );
    }
  }

  FileInputType _getFileInputType(String? extension) {
    if (extension == null) return FileInputType.image;

    const audioExtensions = ['mp3', 'm4a', 'wav', 'aac', 'ogg', 'flac'];
    const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];

    final ext = extension.toLowerCase();
    if (audioExtensions.contains(ext)) {
      return FileInputType.audio;
    } else if (imageExtensions.contains(ext)) {
      return FileInputType.image;
    }

    return FileInputType.image; // default
  }

  String _getMimeType(String? extension) {
    if (extension == null) return 'application/octet-stream';

    switch (extension.toLowerCase()) {
      // Audio
      case 'mp3':
        return 'audio/mpeg';
      case 'm4a':
        return 'audio/mp4';
      case 'wav':
        return 'audio/wav';
      case 'aac':
        return 'audio/aac';
      case 'ogg':
        return 'audio/ogg';
      case 'flac':
        return 'audio/flac';

      // Image
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      case 'webp':
        return 'image/webp';

      default:
        return 'application/octet-stream';
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
        Timer.periodic(const Duration(milliseconds: 100), (timer) async {
      try {
        final amplitude = await _audioRecorder.getAmplitude();
        state = state.copyWith(
          audioState: state.audioState.copyWith(
            amplitude: amplitude.current,
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
}
