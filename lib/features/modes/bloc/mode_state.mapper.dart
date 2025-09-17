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

  static List<Mode> _$modes(ModeState v) => v.modes;
  static const Field<ModeState, List<Mode>> _f$modes = Field('modes', _$modes);
  static int? _$selectedId(ModeState v) => v.selectedId;
  static const Field<ModeState, int> _f$selectedId = Field(
    'selectedId',
    _$selectedId,
    opt: true,
  );
  static Mode? _$selected(ModeState v) => v.selected;
  static const Field<ModeState, Mode> _f$selected = Field(
    'selected',
    _$selected,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ModeState> fields = const {
    #modes: _f$modes,
    #selectedId: _f$selectedId,
    #selected: _f$selected,
  };

  static ModeState _instantiate(DecodingData data) {
    return ModeState(
      modes: data.dec(_f$modes),
      selectedId: data.dec(_f$selectedId),
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
  ListCopyWith<$R, Mode, ModeCopyWith<$R, Mode, Mode>> get modes;
  $R call({List<Mode>? modes, int? selectedId});
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
  ListCopyWith<$R, Mode, ModeCopyWith<$R, Mode, Mode>> get modes =>
      ListCopyWith(
        $value.modes,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(modes: v),
      );
  @override
  $R call({List<Mode>? modes, Object? selectedId = $none}) => $apply(
    FieldCopyWithData({
      if (modes != null) #modes: modes,
      if (selectedId != $none) #selectedId: selectedId,
    }),
  );
  @override
  ModeState $make(CopyWithData data) => ModeState(
    modes: data.get(#modes, or: $value.modes),
    selectedId: data.get(#selectedId, or: $value.selectedId),
  );

  @override
  ModeStateCopyWith<$R2, ModeState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ModeStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

