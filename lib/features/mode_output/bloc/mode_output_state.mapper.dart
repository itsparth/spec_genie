// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mode_output_state.dart';

class ModeOutputStateMapper extends ClassMapperBase<ModeOutputState> {
  ModeOutputStateMapper._();

  static ModeOutputStateMapper? _instance;
  static ModeOutputStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ModeOutputStateMapper._());
      ModeOutputMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ModeOutputState';

  static IList<ModeOutput> _$outputs(ModeOutputState v) => v.outputs;
  static const Field<ModeOutputState, IList<ModeOutput>> _f$outputs = Field(
    'outputs',
    _$outputs,
    opt: true,
    def: const IListConst([]),
  );
  static bool _$isLoading(ModeOutputState v) => v.isLoading;
  static const Field<ModeOutputState, bool> _f$isLoading = Field(
    'isLoading',
    _$isLoading,
    opt: true,
    def: false,
  );
  static bool _$isGenerating(ModeOutputState v) => v.isGenerating;
  static const Field<ModeOutputState, bool> _f$isGenerating = Field(
    'isGenerating',
    _$isGenerating,
    opt: true,
    def: false,
  );
  static String? _$error(ModeOutputState v) => v.error;
  static const Field<ModeOutputState, String> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static int _$currentIndex(ModeOutputState v) => v.currentIndex;
  static const Field<ModeOutputState, int> _f$currentIndex = Field(
    'currentIndex',
    _$currentIndex,
    opt: true,
    def: 0,
  );
  static ModeOutput? _$currentOutput(ModeOutputState v) => v.currentOutput;
  static const Field<ModeOutputState, ModeOutput> _f$currentOutput = Field(
    'currentOutput',
    _$currentOutput,
    mode: FieldMode.member,
  );
  static bool _$canGoBack(ModeOutputState v) => v.canGoBack;
  static const Field<ModeOutputState, bool> _f$canGoBack = Field(
    'canGoBack',
    _$canGoBack,
    mode: FieldMode.member,
  );
  static bool _$canGoForward(ModeOutputState v) => v.canGoForward;
  static const Field<ModeOutputState, bool> _f$canGoForward = Field(
    'canGoForward',
    _$canGoForward,
    mode: FieldMode.member,
  );
  static int _$totalOutputs(ModeOutputState v) => v.totalOutputs;
  static const Field<ModeOutputState, int> _f$totalOutputs = Field(
    'totalOutputs',
    _$totalOutputs,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ModeOutputState> fields = const {
    #outputs: _f$outputs,
    #isLoading: _f$isLoading,
    #isGenerating: _f$isGenerating,
    #error: _f$error,
    #currentIndex: _f$currentIndex,
    #currentOutput: _f$currentOutput,
    #canGoBack: _f$canGoBack,
    #canGoForward: _f$canGoForward,
    #totalOutputs: _f$totalOutputs,
  };

  static ModeOutputState _instantiate(DecodingData data) {
    return ModeOutputState(
      outputs: data.dec(_f$outputs),
      isLoading: data.dec(_f$isLoading),
      isGenerating: data.dec(_f$isGenerating),
      error: data.dec(_f$error),
      currentIndex: data.dec(_f$currentIndex),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ModeOutputState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ModeOutputState>(map);
  }

  static ModeOutputState fromJson(String json) {
    return ensureInitialized().decodeJson<ModeOutputState>(json);
  }
}

mixin ModeOutputStateMappable {
  String toJson() {
    return ModeOutputStateMapper.ensureInitialized()
        .encodeJson<ModeOutputState>(this as ModeOutputState);
  }

  Map<String, dynamic> toMap() {
    return ModeOutputStateMapper.ensureInitialized().encodeMap<ModeOutputState>(
      this as ModeOutputState,
    );
  }

  ModeOutputStateCopyWith<ModeOutputState, ModeOutputState, ModeOutputState>
  get copyWith =>
      _ModeOutputStateCopyWithImpl<ModeOutputState, ModeOutputState>(
        this as ModeOutputState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ModeOutputStateMapper.ensureInitialized().stringifyValue(
      this as ModeOutputState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ModeOutputStateMapper.ensureInitialized().equalsValue(
      this as ModeOutputState,
      other,
    );
  }

  @override
  int get hashCode {
    return ModeOutputStateMapper.ensureInitialized().hashValue(
      this as ModeOutputState,
    );
  }
}

extension ModeOutputStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ModeOutputState, $Out> {
  ModeOutputStateCopyWith<$R, ModeOutputState, $Out> get $asModeOutputState =>
      $base.as((v, t, t2) => _ModeOutputStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ModeOutputStateCopyWith<$R, $In extends ModeOutputState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    IList<ModeOutput>? outputs,
    bool? isLoading,
    bool? isGenerating,
    String? error,
    int? currentIndex,
  });
  ModeOutputStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ModeOutputStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ModeOutputState, $Out>
    implements ModeOutputStateCopyWith<$R, ModeOutputState, $Out> {
  _ModeOutputStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ModeOutputState> $mapper =
      ModeOutputStateMapper.ensureInitialized();
  @override
  $R call({
    IList<ModeOutput>? outputs,
    bool? isLoading,
    bool? isGenerating,
    Object? error = $none,
    int? currentIndex,
  }) => $apply(
    FieldCopyWithData({
      if (outputs != null) #outputs: outputs,
      if (isLoading != null) #isLoading: isLoading,
      if (isGenerating != null) #isGenerating: isGenerating,
      if (error != $none) #error: error,
      if (currentIndex != null) #currentIndex: currentIndex,
    }),
  );
  @override
  ModeOutputState $make(CopyWithData data) => ModeOutputState(
    outputs: data.get(#outputs, or: $value.outputs),
    isLoading: data.get(#isLoading, or: $value.isLoading),
    isGenerating: data.get(#isGenerating, or: $value.isGenerating),
    error: data.get(#error, or: $value.error),
    currentIndex: data.get(#currentIndex, or: $value.currentIndex),
  );

  @override
  ModeOutputStateCopyWith<$R2, ModeOutputState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ModeOutputStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

