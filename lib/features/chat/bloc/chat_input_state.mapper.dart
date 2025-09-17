// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_input_state.dart';

class ChatInputModeMapper extends EnumMapper<ChatInputMode> {
  ChatInputModeMapper._();

  static ChatInputModeMapper? _instance;
  static ChatInputModeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatInputModeMapper._());
    }
    return _instance!;
  }

  static ChatInputMode fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ChatInputMode decode(dynamic value) {
    switch (value) {
      case r'text':
        return ChatInputMode.text;
      case r'audio':
        return ChatInputMode.audio;
      case r'image':
        return ChatInputMode.image;
      case r'file':
        return ChatInputMode.file;
      case r'mixed':
        return ChatInputMode.mixed;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ChatInputMode self) {
    switch (self) {
      case ChatInputMode.text:
        return r'text';
      case ChatInputMode.audio:
        return r'audio';
      case ChatInputMode.image:
        return r'image';
      case ChatInputMode.file:
        return r'file';
      case ChatInputMode.mixed:
        return r'mixed';
    }
  }
}

extension ChatInputModeMapperExtension on ChatInputMode {
  String toValue() {
    ChatInputModeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ChatInputMode>(this) as String;
  }
}

class RecordingStatusMapper extends EnumMapper<RecordingStatus> {
  RecordingStatusMapper._();

  static RecordingStatusMapper? _instance;
  static RecordingStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecordingStatusMapper._());
    }
    return _instance!;
  }

  static RecordingStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RecordingStatus decode(dynamic value) {
    switch (value) {
      case r'idle':
        return RecordingStatus.idle;
      case r'recording':
        return RecordingStatus.recording;
      case r'paused':
        return RecordingStatus.paused;
      case r'stopped':
        return RecordingStatus.stopped;
      case r'error':
        return RecordingStatus.error;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RecordingStatus self) {
    switch (self) {
      case RecordingStatus.idle:
        return r'idle';
      case RecordingStatus.recording:
        return r'recording';
      case RecordingStatus.paused:
        return r'paused';
      case RecordingStatus.stopped:
        return r'stopped';
      case RecordingStatus.error:
        return r'error';
    }
  }
}

extension RecordingStatusMapperExtension on RecordingStatus {
  String toValue() {
    RecordingStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RecordingStatus>(this) as String;
  }
}

class ChatInputActionMapper extends EnumMapper<ChatInputAction> {
  ChatInputActionMapper._();

  static ChatInputActionMapper? _instance;
  static ChatInputActionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatInputActionMapper._());
    }
    return _instance!;
  }

  static ChatInputAction fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ChatInputAction decode(dynamic value) {
    switch (value) {
      case r'send':
        return ChatInputAction.send;
      case r'clear':
        return ChatInputAction.clear;
      case r'addInput':
        return ChatInputAction.addInput;
      case r'removeInput':
        return ChatInputAction.removeInput;
      case r'startRecording':
        return ChatInputAction.startRecording;
      case r'stopRecording':
        return ChatInputAction.stopRecording;
      case r'pauseRecording':
        return ChatInputAction.pauseRecording;
      case r'resumeRecording':
        return ChatInputAction.resumeRecording;
      case r'selectFiles':
        return ChatInputAction.selectFiles;
      case r'selectImages':
        return ChatInputAction.selectImages;
      case r'captureImage':
        return ChatInputAction.captureImage;
      case r'switchMode':
        return ChatInputAction.switchMode;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ChatInputAction self) {
    switch (self) {
      case ChatInputAction.send:
        return r'send';
      case ChatInputAction.clear:
        return r'clear';
      case ChatInputAction.addInput:
        return r'addInput';
      case ChatInputAction.removeInput:
        return r'removeInput';
      case ChatInputAction.startRecording:
        return r'startRecording';
      case ChatInputAction.stopRecording:
        return r'stopRecording';
      case ChatInputAction.pauseRecording:
        return r'pauseRecording';
      case ChatInputAction.resumeRecording:
        return r'resumeRecording';
      case ChatInputAction.selectFiles:
        return r'selectFiles';
      case ChatInputAction.selectImages:
        return r'selectImages';
      case ChatInputAction.captureImage:
        return r'captureImage';
      case ChatInputAction.switchMode:
        return r'switchMode';
    }
  }
}

extension ChatInputActionMapperExtension on ChatInputAction {
  String toValue() {
    ChatInputActionMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ChatInputAction>(this) as String;
  }
}

class ChatInputStateMapper extends ClassMapperBase<ChatInputState> {
  ChatInputStateMapper._();

  static ChatInputStateMapper? _instance;
  static ChatInputStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatInputStateMapper._());
      ChatInputModeMapper.ensureInitialized();
      ChatInputMapper.ensureInitialized();
      AudioRecordingStateMapper.ensureInitialized();
      AudioRecordingConfigMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChatInputState';

  static ChatInputMode _$currentMode(ChatInputState v) => v.currentMode;
  static const Field<ChatInputState, ChatInputMode> _f$currentMode = Field(
    'currentMode',
    _$currentMode,
    opt: true,
    def: ChatInputMode.text,
  );
  static String _$textInput(ChatInputState v) => v.textInput;
  static const Field<ChatInputState, String> _f$textInput = Field(
    'textInput',
    _$textInput,
    opt: true,
    def: '',
  );
  static IList<ChatInput> _$pendingInputs(ChatInputState v) => v.pendingInputs;
  static const Field<ChatInputState, IList<ChatInput>> _f$pendingInputs = Field(
    'pendingInputs',
    _$pendingInputs,
    opt: true,
    def: const IListConst([]),
  );
  static bool _$isLoading(ChatInputState v) => v.isLoading;
  static const Field<ChatInputState, bool> _f$isLoading = Field(
    'isLoading',
    _$isLoading,
    opt: true,
    def: false,
  );
  static String? _$error(ChatInputState v) => v.error;
  static const Field<ChatInputState, String> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static AudioRecordingState _$audioState(ChatInputState v) => v.audioState;
  static const Field<ChatInputState, AudioRecordingState> _f$audioState = Field(
    'audioState',
    _$audioState,
    opt: true,
    def: const AudioRecordingState(),
  );
  static Duration _$recordingDuration(ChatInputState v) => v.recordingDuration;
  static const Field<ChatInputState, Duration> _f$recordingDuration = Field(
    'recordingDuration',
    _$recordingDuration,
    opt: true,
    def: Duration.zero,
  );
  static AudioRecordingConfig _$recordingConfig(ChatInputState v) =>
      v.recordingConfig;
  static const Field<ChatInputState, AudioRecordingConfig> _f$recordingConfig =
      Field(
        'recordingConfig',
        _$recordingConfig,
        opt: true,
        def: const AudioRecordingConfig(),
      );
  static bool _$isSelectingFile(ChatInputState v) => v.isSelectingFile;
  static const Field<ChatInputState, bool> _f$isSelectingFile = Field(
    'isSelectingFile',
    _$isSelectingFile,
    opt: true,
    def: false,
  );
  static IList<String> _$selectedFilePaths(ChatInputState v) =>
      v.selectedFilePaths;
  static const Field<ChatInputState, IList<String>> _f$selectedFilePaths =
      Field(
        'selectedFilePaths',
        _$selectedFilePaths,
        opt: true,
        def: const IListConst([]),
      );
  static bool _$isCapturingImage(ChatInputState v) => v.isCapturingImage;
  static const Field<ChatInputState, bool> _f$isCapturingImage = Field(
    'isCapturingImage',
    _$isCapturingImage,
    opt: true,
    def: false,
  );
  static IList<String> _$selectedImagePaths(ChatInputState v) =>
      v.selectedImagePaths;
  static const Field<ChatInputState, IList<String>> _f$selectedImagePaths =
      Field(
        'selectedImagePaths',
        _$selectedImagePaths,
        opt: true,
        def: const IListConst([]),
      );
  static bool _$canSend(ChatInputState v) => v.canSend;
  static const Field<ChatInputState, bool> _f$canSend = Field(
    'canSend',
    _$canSend,
    mode: FieldMode.member,
  );
  static bool _$isRecording(ChatInputState v) => v.isRecording;
  static const Field<ChatInputState, bool> _f$isRecording = Field(
    'isRecording',
    _$isRecording,
    mode: FieldMode.member,
  );
  static bool _$isRecordingPaused(ChatInputState v) => v.isRecordingPaused;
  static const Field<ChatInputState, bool> _f$isRecordingPaused = Field(
    'isRecordingPaused',
    _$isRecordingPaused,
    mode: FieldMode.member,
  );
  static int _$pendingInputCount(ChatInputState v) => v.pendingInputCount;
  static const Field<ChatInputState, int> _f$pendingInputCount = Field(
    'pendingInputCount',
    _$pendingInputCount,
    mode: FieldMode.member,
  );
  static bool _$hasPendingInputs(ChatInputState v) => v.hasPendingInputs;
  static const Field<ChatInputState, bool> _f$hasPendingInputs = Field(
    'hasPendingInputs',
    _$hasPendingInputs,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ChatInputState> fields = const {
    #currentMode: _f$currentMode,
    #textInput: _f$textInput,
    #pendingInputs: _f$pendingInputs,
    #isLoading: _f$isLoading,
    #error: _f$error,
    #audioState: _f$audioState,
    #recordingDuration: _f$recordingDuration,
    #recordingConfig: _f$recordingConfig,
    #isSelectingFile: _f$isSelectingFile,
    #selectedFilePaths: _f$selectedFilePaths,
    #isCapturingImage: _f$isCapturingImage,
    #selectedImagePaths: _f$selectedImagePaths,
    #canSend: _f$canSend,
    #isRecording: _f$isRecording,
    #isRecordingPaused: _f$isRecordingPaused,
    #pendingInputCount: _f$pendingInputCount,
    #hasPendingInputs: _f$hasPendingInputs,
  };

  static ChatInputState _instantiate(DecodingData data) {
    return ChatInputState(
      currentMode: data.dec(_f$currentMode),
      textInput: data.dec(_f$textInput),
      pendingInputs: data.dec(_f$pendingInputs),
      isLoading: data.dec(_f$isLoading),
      error: data.dec(_f$error),
      audioState: data.dec(_f$audioState),
      recordingDuration: data.dec(_f$recordingDuration),
      recordingConfig: data.dec(_f$recordingConfig),
      isSelectingFile: data.dec(_f$isSelectingFile),
      selectedFilePaths: data.dec(_f$selectedFilePaths),
      isCapturingImage: data.dec(_f$isCapturingImage),
      selectedImagePaths: data.dec(_f$selectedImagePaths),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatInputState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatInputState>(map);
  }

  static ChatInputState fromJson(String json) {
    return ensureInitialized().decodeJson<ChatInputState>(json);
  }
}

mixin ChatInputStateMappable {
  String toJson() {
    return ChatInputStateMapper.ensureInitialized().encodeJson<ChatInputState>(
      this as ChatInputState,
    );
  }

  Map<String, dynamic> toMap() {
    return ChatInputStateMapper.ensureInitialized().encodeMap<ChatInputState>(
      this as ChatInputState,
    );
  }

  ChatInputStateCopyWith<ChatInputState, ChatInputState, ChatInputState>
  get copyWith => _ChatInputStateCopyWithImpl<ChatInputState, ChatInputState>(
    this as ChatInputState,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ChatInputStateMapper.ensureInitialized().stringifyValue(
      this as ChatInputState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatInputStateMapper.ensureInitialized().equalsValue(
      this as ChatInputState,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatInputStateMapper.ensureInitialized().hashValue(
      this as ChatInputState,
    );
  }
}

extension ChatInputStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatInputState, $Out> {
  ChatInputStateCopyWith<$R, ChatInputState, $Out> get $asChatInputState =>
      $base.as((v, t, t2) => _ChatInputStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatInputStateCopyWith<$R, $In extends ChatInputState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AudioRecordingStateCopyWith<$R, AudioRecordingState, AudioRecordingState>
  get audioState;
  AudioRecordingConfigCopyWith<$R, AudioRecordingConfig, AudioRecordingConfig>
  get recordingConfig;
  $R call({
    ChatInputMode? currentMode,
    String? textInput,
    IList<ChatInput>? pendingInputs,
    bool? isLoading,
    String? error,
    AudioRecordingState? audioState,
    Duration? recordingDuration,
    AudioRecordingConfig? recordingConfig,
    bool? isSelectingFile,
    IList<String>? selectedFilePaths,
    bool? isCapturingImage,
    IList<String>? selectedImagePaths,
  });
  ChatInputStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ChatInputStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatInputState, $Out>
    implements ChatInputStateCopyWith<$R, ChatInputState, $Out> {
  _ChatInputStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatInputState> $mapper =
      ChatInputStateMapper.ensureInitialized();
  @override
  AudioRecordingStateCopyWith<$R, AudioRecordingState, AudioRecordingState>
  get audioState =>
      $value.audioState.copyWith.$chain((v) => call(audioState: v));
  @override
  AudioRecordingConfigCopyWith<$R, AudioRecordingConfig, AudioRecordingConfig>
  get recordingConfig =>
      $value.recordingConfig.copyWith.$chain((v) => call(recordingConfig: v));
  @override
  $R call({
    ChatInputMode? currentMode,
    String? textInput,
    IList<ChatInput>? pendingInputs,
    bool? isLoading,
    Object? error = $none,
    AudioRecordingState? audioState,
    Duration? recordingDuration,
    AudioRecordingConfig? recordingConfig,
    bool? isSelectingFile,
    IList<String>? selectedFilePaths,
    bool? isCapturingImage,
    IList<String>? selectedImagePaths,
  }) => $apply(
    FieldCopyWithData({
      if (currentMode != null) #currentMode: currentMode,
      if (textInput != null) #textInput: textInput,
      if (pendingInputs != null) #pendingInputs: pendingInputs,
      if (isLoading != null) #isLoading: isLoading,
      if (error != $none) #error: error,
      if (audioState != null) #audioState: audioState,
      if (recordingDuration != null) #recordingDuration: recordingDuration,
      if (recordingConfig != null) #recordingConfig: recordingConfig,
      if (isSelectingFile != null) #isSelectingFile: isSelectingFile,
      if (selectedFilePaths != null) #selectedFilePaths: selectedFilePaths,
      if (isCapturingImage != null) #isCapturingImage: isCapturingImage,
      if (selectedImagePaths != null) #selectedImagePaths: selectedImagePaths,
    }),
  );
  @override
  ChatInputState $make(CopyWithData data) => ChatInputState(
    currentMode: data.get(#currentMode, or: $value.currentMode),
    textInput: data.get(#textInput, or: $value.textInput),
    pendingInputs: data.get(#pendingInputs, or: $value.pendingInputs),
    isLoading: data.get(#isLoading, or: $value.isLoading),
    error: data.get(#error, or: $value.error),
    audioState: data.get(#audioState, or: $value.audioState),
    recordingDuration: data.get(
      #recordingDuration,
      or: $value.recordingDuration,
    ),
    recordingConfig: data.get(#recordingConfig, or: $value.recordingConfig),
    isSelectingFile: data.get(#isSelectingFile, or: $value.isSelectingFile),
    selectedFilePaths: data.get(
      #selectedFilePaths,
      or: $value.selectedFilePaths,
    ),
    isCapturingImage: data.get(#isCapturingImage, or: $value.isCapturingImage),
    selectedImagePaths: data.get(
      #selectedImagePaths,
      or: $value.selectedImagePaths,
    ),
  );

  @override
  ChatInputStateCopyWith<$R2, ChatInputState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatInputStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AudioRecordingStateMapper extends ClassMapperBase<AudioRecordingState> {
  AudioRecordingStateMapper._();

  static AudioRecordingStateMapper? _instance;
  static AudioRecordingStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AudioRecordingStateMapper._());
      RecordingStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AudioRecordingState';

  static RecordingStatus _$status(AudioRecordingState v) => v.status;
  static const Field<AudioRecordingState, RecordingStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: RecordingStatus.idle,
  );
  static String? _$filePath(AudioRecordingState v) => v.filePath;
  static const Field<AudioRecordingState, String> _f$filePath = Field(
    'filePath',
    _$filePath,
    opt: true,
  );
  static Duration _$duration(AudioRecordingState v) => v.duration;
  static const Field<AudioRecordingState, Duration> _f$duration = Field(
    'duration',
    _$duration,
    opt: true,
    def: Duration.zero,
  );
  static double _$amplitude(AudioRecordingState v) => v.amplitude;
  static const Field<AudioRecordingState, double> _f$amplitude = Field(
    'amplitude',
    _$amplitude,
    opt: true,
    def: 0.0,
  );
  static String? _$error(AudioRecordingState v) => v.error;
  static const Field<AudioRecordingState, String> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static bool _$hasPermission(AudioRecordingState v) => v.hasPermission;
  static const Field<AudioRecordingState, bool> _f$hasPermission = Field(
    'hasPermission',
    _$hasPermission,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<AudioRecordingState> fields = const {
    #status: _f$status,
    #filePath: _f$filePath,
    #duration: _f$duration,
    #amplitude: _f$amplitude,
    #error: _f$error,
    #hasPermission: _f$hasPermission,
  };

  static AudioRecordingState _instantiate(DecodingData data) {
    return AudioRecordingState(
      status: data.dec(_f$status),
      filePath: data.dec(_f$filePath),
      duration: data.dec(_f$duration),
      amplitude: data.dec(_f$amplitude),
      error: data.dec(_f$error),
      hasPermission: data.dec(_f$hasPermission),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AudioRecordingState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AudioRecordingState>(map);
  }

  static AudioRecordingState fromJson(String json) {
    return ensureInitialized().decodeJson<AudioRecordingState>(json);
  }
}

mixin AudioRecordingStateMappable {
  String toJson() {
    return AudioRecordingStateMapper.ensureInitialized()
        .encodeJson<AudioRecordingState>(this as AudioRecordingState);
  }

  Map<String, dynamic> toMap() {
    return AudioRecordingStateMapper.ensureInitialized()
        .encodeMap<AudioRecordingState>(this as AudioRecordingState);
  }

  AudioRecordingStateCopyWith<
    AudioRecordingState,
    AudioRecordingState,
    AudioRecordingState
  >
  get copyWith =>
      _AudioRecordingStateCopyWithImpl<
        AudioRecordingState,
        AudioRecordingState
      >(this as AudioRecordingState, $identity, $identity);
  @override
  String toString() {
    return AudioRecordingStateMapper.ensureInitialized().stringifyValue(
      this as AudioRecordingState,
    );
  }

  @override
  bool operator ==(Object other) {
    return AudioRecordingStateMapper.ensureInitialized().equalsValue(
      this as AudioRecordingState,
      other,
    );
  }

  @override
  int get hashCode {
    return AudioRecordingStateMapper.ensureInitialized().hashValue(
      this as AudioRecordingState,
    );
  }
}

extension AudioRecordingStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AudioRecordingState, $Out> {
  AudioRecordingStateCopyWith<$R, AudioRecordingState, $Out>
  get $asAudioRecordingState => $base.as(
    (v, t, t2) => _AudioRecordingStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AudioRecordingStateCopyWith<
  $R,
  $In extends AudioRecordingState,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    RecordingStatus? status,
    String? filePath,
    Duration? duration,
    double? amplitude,
    String? error,
    bool? hasPermission,
  });
  AudioRecordingStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AudioRecordingStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AudioRecordingState, $Out>
    implements AudioRecordingStateCopyWith<$R, AudioRecordingState, $Out> {
  _AudioRecordingStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AudioRecordingState> $mapper =
      AudioRecordingStateMapper.ensureInitialized();
  @override
  $R call({
    RecordingStatus? status,
    Object? filePath = $none,
    Duration? duration,
    double? amplitude,
    Object? error = $none,
    bool? hasPermission,
  }) => $apply(
    FieldCopyWithData({
      if (status != null) #status: status,
      if (filePath != $none) #filePath: filePath,
      if (duration != null) #duration: duration,
      if (amplitude != null) #amplitude: amplitude,
      if (error != $none) #error: error,
      if (hasPermission != null) #hasPermission: hasPermission,
    }),
  );
  @override
  AudioRecordingState $make(CopyWithData data) => AudioRecordingState(
    status: data.get(#status, or: $value.status),
    filePath: data.get(#filePath, or: $value.filePath),
    duration: data.get(#duration, or: $value.duration),
    amplitude: data.get(#amplitude, or: $value.amplitude),
    error: data.get(#error, or: $value.error),
    hasPermission: data.get(#hasPermission, or: $value.hasPermission),
  );

  @override
  AudioRecordingStateCopyWith<$R2, AudioRecordingState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AudioRecordingStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChatInputValidationMapper extends ClassMapperBase<ChatInputValidation> {
  ChatInputValidationMapper._();

  static ChatInputValidationMapper? _instance;
  static ChatInputValidationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatInputValidationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatInputValidation';

  static bool _$isValid(ChatInputValidation v) => v.isValid;
  static const Field<ChatInputValidation, bool> _f$isValid = Field(
    'isValid',
    _$isValid,
    opt: true,
    def: true,
  );
  static String? _$errorMessage(ChatInputValidation v) => v.errorMessage;
  static const Field<ChatInputValidation, String> _f$errorMessage = Field(
    'errorMessage',
    _$errorMessage,
    opt: true,
  );
  static IList<String> _$warnings(ChatInputValidation v) => v.warnings;
  static const Field<ChatInputValidation, IList<String>> _f$warnings = Field(
    'warnings',
    _$warnings,
    opt: true,
    def: const IListConst([]),
  );
  static bool _$hasWarnings(ChatInputValidation v) => v.hasWarnings;
  static const Field<ChatInputValidation, bool> _f$hasWarnings = Field(
    'hasWarnings',
    _$hasWarnings,
    mode: FieldMode.member,
  );
  static bool _$hasError(ChatInputValidation v) => v.hasError;
  static const Field<ChatInputValidation, bool> _f$hasError = Field(
    'hasError',
    _$hasError,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ChatInputValidation> fields = const {
    #isValid: _f$isValid,
    #errorMessage: _f$errorMessage,
    #warnings: _f$warnings,
    #hasWarnings: _f$hasWarnings,
    #hasError: _f$hasError,
  };

  static ChatInputValidation _instantiate(DecodingData data) {
    return ChatInputValidation(
      isValid: data.dec(_f$isValid),
      errorMessage: data.dec(_f$errorMessage),
      warnings: data.dec(_f$warnings),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatInputValidation fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatInputValidation>(map);
  }

  static ChatInputValidation fromJson(String json) {
    return ensureInitialized().decodeJson<ChatInputValidation>(json);
  }
}

mixin ChatInputValidationMappable {
  String toJson() {
    return ChatInputValidationMapper.ensureInitialized()
        .encodeJson<ChatInputValidation>(this as ChatInputValidation);
  }

  Map<String, dynamic> toMap() {
    return ChatInputValidationMapper.ensureInitialized()
        .encodeMap<ChatInputValidation>(this as ChatInputValidation);
  }

  ChatInputValidationCopyWith<
    ChatInputValidation,
    ChatInputValidation,
    ChatInputValidation
  >
  get copyWith =>
      _ChatInputValidationCopyWithImpl<
        ChatInputValidation,
        ChatInputValidation
      >(this as ChatInputValidation, $identity, $identity);
  @override
  String toString() {
    return ChatInputValidationMapper.ensureInitialized().stringifyValue(
      this as ChatInputValidation,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatInputValidationMapper.ensureInitialized().equalsValue(
      this as ChatInputValidation,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatInputValidationMapper.ensureInitialized().hashValue(
      this as ChatInputValidation,
    );
  }
}

extension ChatInputValidationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatInputValidation, $Out> {
  ChatInputValidationCopyWith<$R, ChatInputValidation, $Out>
  get $asChatInputValidation => $base.as(
    (v, t, t2) => _ChatInputValidationCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ChatInputValidationCopyWith<
  $R,
  $In extends ChatInputValidation,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? isValid, String? errorMessage, IList<String>? warnings});
  ChatInputValidationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ChatInputValidationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatInputValidation, $Out>
    implements ChatInputValidationCopyWith<$R, ChatInputValidation, $Out> {
  _ChatInputValidationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatInputValidation> $mapper =
      ChatInputValidationMapper.ensureInitialized();
  @override
  $R call({
    bool? isValid,
    Object? errorMessage = $none,
    IList<String>? warnings,
  }) => $apply(
    FieldCopyWithData({
      if (isValid != null) #isValid: isValid,
      if (errorMessage != $none) #errorMessage: errorMessage,
      if (warnings != null) #warnings: warnings,
    }),
  );
  @override
  ChatInputValidation $make(CopyWithData data) => ChatInputValidation(
    isValid: data.get(#isValid, or: $value.isValid),
    errorMessage: data.get(#errorMessage, or: $value.errorMessage),
    warnings: data.get(#warnings, or: $value.warnings),
  );

  @override
  ChatInputValidationCopyWith<$R2, ChatInputValidation, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ChatInputValidationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FileSelectionStateMapper extends ClassMapperBase<FileSelectionState> {
  FileSelectionStateMapper._();

  static FileSelectionStateMapper? _instance;
  static FileSelectionStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileSelectionStateMapper._());
      FileInputTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FileSelectionState';

  static bool _$isSelecting(FileSelectionState v) => v.isSelecting;
  static const Field<FileSelectionState, bool> _f$isSelecting = Field(
    'isSelecting',
    _$isSelecting,
    opt: true,
    def: false,
  );
  static IList<String> _$selectedFiles(FileSelectionState v) => v.selectedFiles;
  static const Field<FileSelectionState, IList<String>> _f$selectedFiles =
      Field(
        'selectedFiles',
        _$selectedFiles,
        opt: true,
        def: const IListConst([]),
      );
  static String? _$error(FileSelectionState v) => v.error;
  static const Field<FileSelectionState, String> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static FileInputType? _$filterType(FileSelectionState v) => v.filterType;
  static const Field<FileSelectionState, FileInputType> _f$filterType = Field(
    'filterType',
    _$filterType,
    opt: true,
  );
  static bool _$hasSelectedFiles(FileSelectionState v) => v.hasSelectedFiles;
  static const Field<FileSelectionState, bool> _f$hasSelectedFiles = Field(
    'hasSelectedFiles',
    _$hasSelectedFiles,
    mode: FieldMode.member,
  );
  static int _$selectedFileCount(FileSelectionState v) => v.selectedFileCount;
  static const Field<FileSelectionState, int> _f$selectedFileCount = Field(
    'selectedFileCount',
    _$selectedFileCount,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<FileSelectionState> fields = const {
    #isSelecting: _f$isSelecting,
    #selectedFiles: _f$selectedFiles,
    #error: _f$error,
    #filterType: _f$filterType,
    #hasSelectedFiles: _f$hasSelectedFiles,
    #selectedFileCount: _f$selectedFileCount,
  };

  static FileSelectionState _instantiate(DecodingData data) {
    return FileSelectionState(
      isSelecting: data.dec(_f$isSelecting),
      selectedFiles: data.dec(_f$selectedFiles),
      error: data.dec(_f$error),
      filterType: data.dec(_f$filterType),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FileSelectionState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileSelectionState>(map);
  }

  static FileSelectionState fromJson(String json) {
    return ensureInitialized().decodeJson<FileSelectionState>(json);
  }
}

mixin FileSelectionStateMappable {
  String toJson() {
    return FileSelectionStateMapper.ensureInitialized()
        .encodeJson<FileSelectionState>(this as FileSelectionState);
  }

  Map<String, dynamic> toMap() {
    return FileSelectionStateMapper.ensureInitialized()
        .encodeMap<FileSelectionState>(this as FileSelectionState);
  }

  FileSelectionStateCopyWith<
    FileSelectionState,
    FileSelectionState,
    FileSelectionState
  >
  get copyWith =>
      _FileSelectionStateCopyWithImpl<FileSelectionState, FileSelectionState>(
        this as FileSelectionState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FileSelectionStateMapper.ensureInitialized().stringifyValue(
      this as FileSelectionState,
    );
  }

  @override
  bool operator ==(Object other) {
    return FileSelectionStateMapper.ensureInitialized().equalsValue(
      this as FileSelectionState,
      other,
    );
  }

  @override
  int get hashCode {
    return FileSelectionStateMapper.ensureInitialized().hashValue(
      this as FileSelectionState,
    );
  }
}

extension FileSelectionStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FileSelectionState, $Out> {
  FileSelectionStateCopyWith<$R, FileSelectionState, $Out>
  get $asFileSelectionState => $base.as(
    (v, t, t2) => _FileSelectionStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FileSelectionStateCopyWith<
  $R,
  $In extends FileSelectionState,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    bool? isSelecting,
    IList<String>? selectedFiles,
    String? error,
    FileInputType? filterType,
  });
  FileSelectionStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FileSelectionStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileSelectionState, $Out>
    implements FileSelectionStateCopyWith<$R, FileSelectionState, $Out> {
  _FileSelectionStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileSelectionState> $mapper =
      FileSelectionStateMapper.ensureInitialized();
  @override
  $R call({
    bool? isSelecting,
    IList<String>? selectedFiles,
    Object? error = $none,
    Object? filterType = $none,
  }) => $apply(
    FieldCopyWithData({
      if (isSelecting != null) #isSelecting: isSelecting,
      if (selectedFiles != null) #selectedFiles: selectedFiles,
      if (error != $none) #error: error,
      if (filterType != $none) #filterType: filterType,
    }),
  );
  @override
  FileSelectionState $make(CopyWithData data) => FileSelectionState(
    isSelecting: data.get(#isSelecting, or: $value.isSelecting),
    selectedFiles: data.get(#selectedFiles, or: $value.selectedFiles),
    error: data.get(#error, or: $value.error),
    filterType: data.get(#filterType, or: $value.filterType),
  );

  @override
  FileSelectionStateCopyWith<$R2, FileSelectionState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FileSelectionStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ImageSelectionStateMapper extends ClassMapperBase<ImageSelectionState> {
  ImageSelectionStateMapper._();

  static ImageSelectionStateMapper? _instance;
  static ImageSelectionStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImageSelectionStateMapper._());
      ImageSourceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ImageSelectionState';

  static bool _$isSelecting(ImageSelectionState v) => v.isSelecting;
  static const Field<ImageSelectionState, bool> _f$isSelecting = Field(
    'isSelecting',
    _$isSelecting,
    opt: true,
    def: false,
  );
  static IList<String> _$selectedImages(ImageSelectionState v) =>
      v.selectedImages;
  static const Field<ImageSelectionState, IList<String>> _f$selectedImages =
      Field(
        'selectedImages',
        _$selectedImages,
        opt: true,
        def: const IListConst([]),
      );
  static String? _$error(ImageSelectionState v) => v.error;
  static const Field<ImageSelectionState, String> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static ImageSource? _$preferredSource(ImageSelectionState v) =>
      v.preferredSource;
  static const Field<ImageSelectionState, ImageSource> _f$preferredSource =
      Field('preferredSource', _$preferredSource, opt: true);
  static bool _$hasSelectedImages(ImageSelectionState v) => v.hasSelectedImages;
  static const Field<ImageSelectionState, bool> _f$hasSelectedImages = Field(
    'hasSelectedImages',
    _$hasSelectedImages,
    mode: FieldMode.member,
  );
  static int _$selectedImageCount(ImageSelectionState v) =>
      v.selectedImageCount;
  static const Field<ImageSelectionState, int> _f$selectedImageCount = Field(
    'selectedImageCount',
    _$selectedImageCount,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ImageSelectionState> fields = const {
    #isSelecting: _f$isSelecting,
    #selectedImages: _f$selectedImages,
    #error: _f$error,
    #preferredSource: _f$preferredSource,
    #hasSelectedImages: _f$hasSelectedImages,
    #selectedImageCount: _f$selectedImageCount,
  };

  static ImageSelectionState _instantiate(DecodingData data) {
    return ImageSelectionState(
      isSelecting: data.dec(_f$isSelecting),
      selectedImages: data.dec(_f$selectedImages),
      error: data.dec(_f$error),
      preferredSource: data.dec(_f$preferredSource),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ImageSelectionState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImageSelectionState>(map);
  }

  static ImageSelectionState fromJson(String json) {
    return ensureInitialized().decodeJson<ImageSelectionState>(json);
  }
}

mixin ImageSelectionStateMappable {
  String toJson() {
    return ImageSelectionStateMapper.ensureInitialized()
        .encodeJson<ImageSelectionState>(this as ImageSelectionState);
  }

  Map<String, dynamic> toMap() {
    return ImageSelectionStateMapper.ensureInitialized()
        .encodeMap<ImageSelectionState>(this as ImageSelectionState);
  }

  ImageSelectionStateCopyWith<
    ImageSelectionState,
    ImageSelectionState,
    ImageSelectionState
  >
  get copyWith =>
      _ImageSelectionStateCopyWithImpl<
        ImageSelectionState,
        ImageSelectionState
      >(this as ImageSelectionState, $identity, $identity);
  @override
  String toString() {
    return ImageSelectionStateMapper.ensureInitialized().stringifyValue(
      this as ImageSelectionState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ImageSelectionStateMapper.ensureInitialized().equalsValue(
      this as ImageSelectionState,
      other,
    );
  }

  @override
  int get hashCode {
    return ImageSelectionStateMapper.ensureInitialized().hashValue(
      this as ImageSelectionState,
    );
  }
}

extension ImageSelectionStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImageSelectionState, $Out> {
  ImageSelectionStateCopyWith<$R, ImageSelectionState, $Out>
  get $asImageSelectionState => $base.as(
    (v, t, t2) => _ImageSelectionStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ImageSelectionStateCopyWith<
  $R,
  $In extends ImageSelectionState,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    bool? isSelecting,
    IList<String>? selectedImages,
    String? error,
    ImageSource? preferredSource,
  });
  ImageSelectionStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ImageSelectionStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImageSelectionState, $Out>
    implements ImageSelectionStateCopyWith<$R, ImageSelectionState, $Out> {
  _ImageSelectionStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImageSelectionState> $mapper =
      ImageSelectionStateMapper.ensureInitialized();
  @override
  $R call({
    bool? isSelecting,
    IList<String>? selectedImages,
    Object? error = $none,
    Object? preferredSource = $none,
  }) => $apply(
    FieldCopyWithData({
      if (isSelecting != null) #isSelecting: isSelecting,
      if (selectedImages != null) #selectedImages: selectedImages,
      if (error != $none) #error: error,
      if (preferredSource != $none) #preferredSource: preferredSource,
    }),
  );
  @override
  ImageSelectionState $make(CopyWithData data) => ImageSelectionState(
    isSelecting: data.get(#isSelecting, or: $value.isSelecting),
    selectedImages: data.get(#selectedImages, or: $value.selectedImages),
    error: data.get(#error, or: $value.error),
    preferredSource: data.get(#preferredSource, or: $value.preferredSource),
  );

  @override
  ImageSelectionStateCopyWith<$R2, ImageSelectionState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ImageSelectionStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

