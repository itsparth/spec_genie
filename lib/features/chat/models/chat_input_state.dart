import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'chat_input.dart';
import '../../tags/models/tag.dart';

part 'chat_input_state.mapper.dart';

@MappableClass()
class ChatInputState with ChatInputStateMappable {
  final ChatInputMode currentMode;
  final String textInput;
  final ChatInput? currentContent; // Single content (audio, image, or file)
  final bool isLoading;
  final String? error;

  // Audio recording state
  final AudioRecordingState audioState;
  final AudioRecordingConfig recordingConfig;

  // Tags state
  final IList<Tag> selectedTags;

  const ChatInputState({
    this.currentMode = ChatInputMode.text,
    this.textInput = '',
    this.currentContent,
    this.isLoading = false,
    this.error,
    this.audioState = const AudioRecordingState(),
    this.recordingConfig = const AudioRecordingConfig(),
    this.selectedTags = const IListConst([]),
  });

  /// Check if we can send the current inputs
  bool get canSend {
    if (isLoading || error != null) return false;

    // Don't allow sending while recording is in progress or paused
    if (audioState.status == RecordingStatus.recording ||
        audioState.status == RecordingStatus.paused) {
      return false;
    }

    // Allow sending if there's text input or current content (audio/image/file)
    return textInput.trim().isNotEmpty ||
        currentContent != null ||
        (audioState.status == RecordingStatus.stopped &&
            audioState.filePath != null);
  }

  /// Check if recording is in progress
  bool get isRecording => audioState.status == RecordingStatus.recording;

  /// Check if recording is paused
  bool get isRecordingPaused => audioState.status == RecordingStatus.paused;

  /// Check if there is current content
  bool get hasCurrentContent => currentContent != null;

  /// Get content type of current content
  ChatInputType? get currentContentType => currentContent?.type;
}

@MappableClass()
class AudioRecordingState with AudioRecordingStateMappable {
  final RecordingStatus status;
  final String? filePath;
  final Duration duration;
  final double amplitude;
  final String? error;
  final bool hasPermission;
  // UI animation phase (0-1) for pulsing effect while recording
  final double pulsePhase;
  // Flags to signal one-shot UI feedback (haptics/sound) without side effects.
  final bool triggerStartFeedback;
  final bool triggerStopFeedback;

  const AudioRecordingState({
    this.status = RecordingStatus.idle,
    this.filePath,
    this.duration = Duration.zero,
    this.amplitude = 0.0,
    this.error,
    this.hasPermission = false,
    this.pulsePhase = 0.0,
    this.triggerStartFeedback = false,
    this.triggerStopFeedback = false,
  });
}

/// Validation state for different input types
@MappableClass()
class ChatInputValidation with ChatInputValidationMappable {
  final bool isValid;
  final String? errorMessage;
  final IList<String> warnings;

  const ChatInputValidation({
    this.isValid = true,
    this.errorMessage,
    this.warnings = const IListConst([]),
  });

  bool get hasWarnings => warnings.isNotEmpty;
  bool get hasError => errorMessage != null;
}

/// File selection result state
@MappableClass()
class FileSelectionState with FileSelectionStateMappable {
  final bool isSelecting;
  final IList<String> selectedFiles;
  final String? error;
  final FileInputType? filterType;

  const FileSelectionState({
    this.isSelecting = false,
    this.selectedFiles = const IListConst([]),
    this.error,
    this.filterType,
  });

  bool get hasSelectedFiles => selectedFiles.isNotEmpty;
  int get selectedFileCount => selectedFiles.length;
}

/// Image capture/selection state
@MappableClass()
class ImageSelectionState with ImageSelectionStateMappable {
  final bool isSelecting;
  final IList<String> selectedImages;
  final String? error;
  final ImageSource? preferredSource;

  const ImageSelectionState({
    this.isSelecting = false,
    this.selectedImages = const IListConst([]),
    this.error,
    this.preferredSource,
  });

  bool get hasSelectedImages => selectedImages.isNotEmpty;
  int get selectedImageCount => selectedImages.length;
}

/// Enums for state management
@MappableEnum()
enum ChatInputMode {
  text,
  audio,
  image,
  file,
}

@MappableEnum()
enum RecordingStatus {
  idle,
  recording,
  paused,
  stopped,
  error,
}

@MappableEnum()
enum ChatInputAction {
  send,
  clear,
  addInput,
  removeInput,
  startRecording,
  stopRecording,
  pauseRecording,
  resumeRecording,
  selectFiles,
  selectImages,
  captureImage,
  switchMode,
}
