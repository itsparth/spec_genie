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

  static ModeOutput? _$output(ModeOutputState v) => v.output;
  static const Field<ModeOutputState, ModeOutput> _f$output = Field(
    'output',
    _$output,
    opt: true,
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
  static bool _$hasOutput(ModeOutputState v) => v.hasOutput;
  static const Field<ModeOutputState, bool> _f$hasOutput = Field(
    'hasOutput',
    _$hasOutput,
    mode: FieldMode.member,
  );
  static bool _$isReady(ModeOutputState v) => v.isReady;
  static const Field<ModeOutputState, bool> _f$isReady = Field(
    'isReady',
    _$isReady,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ModeOutputState> fields = const {
    #output: _f$output,
    #isGenerating: _f$isGenerating,
    #error: _f$error,
    #hasOutput: _f$hasOutput,
    #isReady: _f$isReady,
  };

  static ModeOutputState _instantiate(DecodingData data) {
    return ModeOutputState(
      output: data.dec(_f$output),
      isGenerating: data.dec(_f$isGenerating),
      error: data.dec(_f$error),
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
  ModeOutputCopyWith<$R, ModeOutput, ModeOutput>? get output;
  $R call({ModeOutput? output, bool? isGenerating, String? error});
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
  ModeOutputCopyWith<$R, ModeOutput, ModeOutput>? get output =>
      $value.output?.copyWith.$chain((v) => call(output: v));
  @override
  $R call({
    Object? output = $none,
    bool? isGenerating,
    Object? error = $none,
  }) =>
      $apply(
        FieldCopyWithData({
          if (output != $none) #output: output,
          if (isGenerating != null) #isGenerating: isGenerating,
          if (error != $none) #error: error,
        }),
      );
  @override
  ModeOutputState $make(CopyWithData data) => ModeOutputState(
        output: data.get(#output, or: $value.output),
        isGenerating: data.get(#isGenerating, or: $value.isGenerating),
        error: data.get(#error, or: $value.error),
      );

  @override
  ModeOutputStateCopyWith<$R2, ModeOutputState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _ModeOutputStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
