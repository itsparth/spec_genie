// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mode_state.dart';

class ModeStateMapper extends ClassMapperBase<ModeState> {
  ModeStateMapper._();

  static ModeStateMapper? _instance;
  static ModeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ModeStateMapper._());
      ModeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ModeState';

  static IList<Mode> _$modes(ModeState v) => v.modes;
  static const Field<ModeState, IList<Mode>> _f$modes = Field('modes', _$modes);
  static bool _$isSaving(ModeState v) => v.isSaving;
  static const Field<ModeState, bool> _f$isSaving = Field(
    'isSaving',
    _$isSaving,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<ModeState> fields = const {
    #modes: _f$modes,
    #isSaving: _f$isSaving,
  };

  static ModeState _instantiate(DecodingData data) {
    return ModeState(
      modes: data.dec(_f$modes),
      isSaving: data.dec(_f$isSaving),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ModeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ModeState>(map);
  }

  static ModeState fromJson(String json) {
    return ensureInitialized().decodeJson<ModeState>(json);
  }
}

mixin ModeStateMappable {
  String toJson() {
    return ModeStateMapper.ensureInitialized().encodeJson<ModeState>(
      this as ModeState,
    );
  }

  Map<String, dynamic> toMap() {
    return ModeStateMapper.ensureInitialized().encodeMap<ModeState>(
      this as ModeState,
    );
  }

  ModeStateCopyWith<ModeState, ModeState, ModeState> get copyWith =>
      _ModeStateCopyWithImpl<ModeState, ModeState>(
        this as ModeState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ModeStateMapper.ensureInitialized().stringifyValue(
      this as ModeState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ModeStateMapper.ensureInitialized().equalsValue(
      this as ModeState,
      other,
    );
  }

  @override
  int get hashCode {
    return ModeStateMapper.ensureInitialized().hashValue(this as ModeState);
  }
}

extension ModeStateValueCopy<$R, $Out> on ObjectCopyWith<$R, ModeState, $Out> {
  ModeStateCopyWith<$R, ModeState, $Out> get $asModeState =>
      $base.as((v, t, t2) => _ModeStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ModeStateCopyWith<$R, $In extends ModeState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({IList<Mode>? modes, bool? isSaving});
  ModeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ModeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ModeState, $Out>
    implements ModeStateCopyWith<$R, ModeState, $Out> {
  _ModeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ModeState> $mapper =
      ModeStateMapper.ensureInitialized();
  @override
  $R call({IList<Mode>? modes, bool? isSaving}) => $apply(
        FieldCopyWithData({
          if (modes != null) #modes: modes,
          if (isSaving != null) #isSaving: isSaving,
        }),
      );
  @override
  ModeState $make(CopyWithData data) => ModeState(
        modes: data.get(#modes, or: $value.modes),
        isSaving: data.get(#isSaving, or: $value.isSaving),
      );

  @override
  ModeStateCopyWith<$R2, ModeState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _ModeStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
