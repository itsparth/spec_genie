// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mode_outputs_state.dart';

class ModeOutputsStateMapper extends ClassMapperBase<ModeOutputsState> {
  ModeOutputsStateMapper._();

  static ModeOutputsStateMapper? _instance;
  static ModeOutputsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ModeOutputsStateMapper._());
      ModeOutputMapper.ensureInitialized();
      ModeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ModeOutputsState';

  static IList<ModeOutput> _$outputs(ModeOutputsState v) => v.outputs;
  static const Field<ModeOutputsState, IList<ModeOutput>> _f$outputs = Field(
    'outputs',
    _$outputs,
    opt: true,
    def: const IListConst([]),
  );
  static bool _$isLoading(ModeOutputsState v) => v.isLoading;
  static const Field<ModeOutputsState, bool> _f$isLoading = Field(
    'isLoading',
    _$isLoading,
    opt: true,
    def: false,
  );
  static int _$currentIndex(ModeOutputsState v) => v.currentIndex;
  static const Field<ModeOutputsState, int> _f$currentIndex = Field(
    'currentIndex',
    _$currentIndex,
    opt: true,
    def: 0,
  );
  static bool _$isGenerating(ModeOutputsState v) => v.isGenerating;
  static const Field<ModeOutputsState, bool> _f$isGenerating = Field(
    'isGenerating',
    _$isGenerating,
    opt: true,
    def: false,
  );
  static String? _$streamingContent(ModeOutputsState v) => v.streamingContent;
  static const Field<ModeOutputsState, String> _f$streamingContent = Field(
    'streamingContent',
    _$streamingContent,
    opt: true,
  );
  static int? _$streamingIndex(ModeOutputsState v) => v.streamingIndex;
  static const Field<ModeOutputsState, int> _f$streamingIndex = Field(
    'streamingIndex',
    _$streamingIndex,
    opt: true,
  );
  static Mode? _$currentMode(ModeOutputsState v) => v.currentMode;
  static const Field<ModeOutputsState, Mode> _f$currentMode = Field(
    'currentMode',
    _$currentMode,
    opt: true,
  );
  static ModeOutput? _$currentOutput(ModeOutputsState v) => v.currentOutput;
  static const Field<ModeOutputsState, ModeOutput> _f$currentOutput = Field(
    'currentOutput',
    _$currentOutput,
    mode: FieldMode.member,
  );
  static String? _$currentContent(ModeOutputsState v) => v.currentContent;
  static const Field<ModeOutputsState, String> _f$currentContent = Field(
    'currentContent',
    _$currentContent,
    mode: FieldMode.member,
  );
  static bool _$canGoBack(ModeOutputsState v) => v.canGoBack;
  static const Field<ModeOutputsState, bool> _f$canGoBack = Field(
    'canGoBack',
    _$canGoBack,
    mode: FieldMode.member,
  );
  static bool _$canGoForward(ModeOutputsState v) => v.canGoForward;
  static const Field<ModeOutputsState, bool> _f$canGoForward = Field(
    'canGoForward',
    _$canGoForward,
    mode: FieldMode.member,
  );
  static int _$totalOutputs(ModeOutputsState v) => v.totalOutputs;
  static const Field<ModeOutputsState, int> _f$totalOutputs = Field(
    'totalOutputs',
    _$totalOutputs,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ModeOutputsState> fields = const {
    #outputs: _f$outputs,
    #isLoading: _f$isLoading,
    #currentIndex: _f$currentIndex,
    #isGenerating: _f$isGenerating,
    #streamingContent: _f$streamingContent,
    #streamingIndex: _f$streamingIndex,
    #currentMode: _f$currentMode,
    #currentOutput: _f$currentOutput,
    #currentContent: _f$currentContent,
    #canGoBack: _f$canGoBack,
    #canGoForward: _f$canGoForward,
    #totalOutputs: _f$totalOutputs,
  };

  static ModeOutputsState _instantiate(DecodingData data) {
    return ModeOutputsState(
      outputs: data.dec(_f$outputs),
      isLoading: data.dec(_f$isLoading),
      currentIndex: data.dec(_f$currentIndex),
      isGenerating: data.dec(_f$isGenerating),
      streamingContent: data.dec(_f$streamingContent),
      streamingIndex: data.dec(_f$streamingIndex),
      currentMode: data.dec(_f$currentMode),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ModeOutputsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ModeOutputsState>(map);
  }

  static ModeOutputsState fromJson(String json) {
    return ensureInitialized().decodeJson<ModeOutputsState>(json);
  }
}

mixin ModeOutputsStateMappable {
  String toJson() {
    return ModeOutputsStateMapper.ensureInitialized()
        .encodeJson<ModeOutputsState>(this as ModeOutputsState);
  }

  Map<String, dynamic> toMap() {
    return ModeOutputsStateMapper.ensureInitialized()
        .encodeMap<ModeOutputsState>(this as ModeOutputsState);
  }

  ModeOutputsStateCopyWith<ModeOutputsState, ModeOutputsState, ModeOutputsState>
  get copyWith =>
      _ModeOutputsStateCopyWithImpl<ModeOutputsState, ModeOutputsState>(
        this as ModeOutputsState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ModeOutputsStateMapper.ensureInitialized().stringifyValue(
      this as ModeOutputsState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ModeOutputsStateMapper.ensureInitialized().equalsValue(
      this as ModeOutputsState,
      other,
    );
  }

  @override
  int get hashCode {
    return ModeOutputsStateMapper.ensureInitialized().hashValue(
      this as ModeOutputsState,
    );
  }
}

extension ModeOutputsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ModeOutputsState, $Out> {
  ModeOutputsStateCopyWith<$R, ModeOutputsState, $Out>
  get $asModeOutputsState =>
      $base.as((v, t, t2) => _ModeOutputsStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ModeOutputsStateCopyWith<$R, $In extends ModeOutputsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ModeCopyWith<$R, Mode, Mode>? get currentMode;
  $R call({
    IList<ModeOutput>? outputs,
    bool? isLoading,
    int? currentIndex,
    bool? isGenerating,
    String? streamingContent,
    int? streamingIndex,
    Mode? currentMode,
  });
  ModeOutputsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ModeOutputsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ModeOutputsState, $Out>
    implements ModeOutputsStateCopyWith<$R, ModeOutputsState, $Out> {
  _ModeOutputsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ModeOutputsState> $mapper =
      ModeOutputsStateMapper.ensureInitialized();
  @override
  ModeCopyWith<$R, Mode, Mode>? get currentMode =>
      $value.currentMode?.copyWith.$chain((v) => call(currentMode: v));
  @override
  $R call({
    IList<ModeOutput>? outputs,
    bool? isLoading,
    int? currentIndex,
    bool? isGenerating,
    Object? streamingContent = $none,
    Object? streamingIndex = $none,
    Object? currentMode = $none,
  }) => $apply(
    FieldCopyWithData({
      if (outputs != null) #outputs: outputs,
      if (isLoading != null) #isLoading: isLoading,
      if (currentIndex != null) #currentIndex: currentIndex,
      if (isGenerating != null) #isGenerating: isGenerating,
      if (streamingContent != $none) #streamingContent: streamingContent,
      if (streamingIndex != $none) #streamingIndex: streamingIndex,
      if (currentMode != $none) #currentMode: currentMode,
    }),
  );
  @override
  ModeOutputsState $make(CopyWithData data) => ModeOutputsState(
    outputs: data.get(#outputs, or: $value.outputs),
    isLoading: data.get(#isLoading, or: $value.isLoading),
    currentIndex: data.get(#currentIndex, or: $value.currentIndex),
    isGenerating: data.get(#isGenerating, or: $value.isGenerating),
    streamingContent: data.get(#streamingContent, or: $value.streamingContent),
    streamingIndex: data.get(#streamingIndex, or: $value.streamingIndex),
    currentMode: data.get(#currentMode, or: $value.currentMode),
  );

  @override
  ModeOutputsStateCopyWith<$R2, ModeOutputsState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ModeOutputsStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

