import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../models/chat_input.dart';
import '../../tags/models/tag.dart';

part 'chat_input_state.mapper.dart';

@MappableClass()
class ChatInputState with ChatInputStateMappable {
  final ChatInputMode currentMode;
  final String textInput;
  final IList<ChatInput> pendingInputs;
  final bool isLoading;
  final String? error;

  // Audio recording state
  final AudioRecordingState audioState;
  final Duration recordingDuration;
  final AudioRecordingConfig recordingConfig;

  // File selection state
  final bool isSelectingFile;
  final IList<String> selectedFilePaths;

  // Image capture/selection state
  final bool isCapturingImage;
  final IList<String> selectedImagePaths;

  // Tags state
  final IList<Tag> selectedTags;

  const ChatInputState({
    this.currentMode = ChatInputMode.text,
    this.textInput = '',
    this.pendingInputs = const IListConst([]),
    this.isLoading = false,
    this.error,
    this.audioState = const AudioRecordingState(),
    this.recordingDuration = Duration.zero,
    this.recordingConfig = const AudioRecordingConfig(),
    this.isSelectingFile = false,
    this.selectedFilePaths = const IListConst([]),
    this.isCapturingImage = false,
    this.selectedImagePaths = const IListConst([]),
    this.selectedTags = const IListConst([]),
  });

  /// Check if we can send the current inputs
  bool get canSend {
    if (isLoading || error != null) return false;

    // Allow sending if there's text, pending inputs (audio/images/files), or completed audio recording
    return textInput.trim().isNotEmpty ||
        pendingInputs.isNotEmpty ||
        (audioState.status == RecordingStatus.stopped &&
            audioState.filePath != null);
  }

  /// Check if recording is in progress
  bool get isRecording => audioState.status == RecordingStatus.recording;

  /// Check if recording is paused
  bool get isRecordingPaused => audioState.status == RecordingStatus.paused;

  /// Get the total number of pending inputs
  int get pendingInputCount => pendingInputs.length;

  /// Check if there are any pending inputs
  bool get hasPendingInputs => pendingInputs.isNotEmpty;
}

@MappableClass()
class AudioRecordingState with AudioRecordingStateMappable {
  final RecordingStatus status;
  final String? filePath;
  final Duration duration;
  final double amplitude;
  final String? error;
  final bool hasPermission;

  const AudioRecordingState({
    this.status = RecordingStatus.idle,
    this.filePath,
    this.duration = Duration.zero,
    this.amplitude = 0.0,
    this.error,
    this.hasPermission = false,
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
  mixed, // Combination of multiple input types
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
