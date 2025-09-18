// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mode.dart';

class ModeMapper extends ClassMapperBase<Mode> {
  ModeMapper._();

  static ModeMapper? _instance;
  static ModeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ModeMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Mode';

  static int _$id(Mode v) => v.id;
  static const Field<Mode, int> _f$id = Field('id', _$id, opt: true, def: 0);
  static String _$name(Mode v) => v.name;
  static const Field<Mode, String> _f$name = Field('name', _$name);
  static String _$prompt(Mode v) => v.prompt;
  static const Field<Mode, String> _f$prompt = Field('prompt', _$prompt);
  static bool _$isEditable(Mode v) => v.isEditable;
  static const Field<Mode, bool> _f$isEditable = Field(
    'isEditable',
    _$isEditable,
    opt: true,
    def: true,
  );
  static ToMany<ModeOutput> _$modeOutputs(Mode v) => v.modeOutputs;
  static const Field<Mode, ToMany<ModeOutput>> _f$modeOutputs = Field(
    'modeOutputs',
    _$modeOutputs,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<Mode> fields = const {
    #id: _f$id,
    #name: _f$name,
    #prompt: _f$prompt,
    #isEditable: _f$isEditable,
    #modeOutputs: _f$modeOutputs,
  };

  static Mode _instantiate(DecodingData data) {
    return Mode(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      prompt: data.dec(_f$prompt),
      isEditable: data.dec(_f$isEditable),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Mode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Mode>(map);
  }

  static Mode fromJson(String json) {
    return ensureInitialized().decodeJson<Mode>(json);
  }
}

mixin ModeMappable {
  String toJson() {
    return ModeMapper.ensureInitialized().encodeJson<Mode>(this as Mode);
  }

  Map<String, dynamic> toMap() {
    return ModeMapper.ensureInitialized().encodeMap<Mode>(this as Mode);
  }

  ModeCopyWith<Mode, Mode, Mode> get copyWith =>
      _ModeCopyWithImpl<Mode, Mode>(this as Mode, $identity, $identity);
  @override
  String toString() {
    return ModeMapper.ensureInitialized().stringifyValue(this as Mode);
  }

  @override
  bool operator ==(Object other) {
    return ModeMapper.ensureInitialized().equalsValue(this as Mode, other);
  }

  @override
  int get hashCode {
    return ModeMapper.ensureInitialized().hashValue(this as Mode);
  }
}

extension ModeValueCopy<$R, $Out> on ObjectCopyWith<$R, Mode, $Out> {
  ModeCopyWith<$R, Mode, $Out> get $asMode =>
      $base.as((v, t, t2) => _ModeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ModeCopyWith<$R, $In extends Mode, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name, String? prompt, bool? isEditable});
  ModeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ModeCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Mode, $Out>
    implements ModeCopyWith<$R, Mode, $Out> {
  _ModeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Mode> $mapper = ModeMapper.ensureInitialized();
  @override
  $R call({int? id, String? name, String? prompt, bool? isEditable}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (prompt != null) #prompt: prompt,
      if (isEditable != null) #isEditable: isEditable,
    }),
  );
  @override
  Mode $make(CopyWithData data) => Mode(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    prompt: data.get(#prompt, or: $value.prompt),
    isEditable: data.get(#isEditable, or: $value.isEditable),
  );

  @override
  ModeCopyWith<$R2, Mode, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ModeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

