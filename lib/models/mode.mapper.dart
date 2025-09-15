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
  static const Field<Mode, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
    def: Isar.autoIncrement,
  );
  static String _$name(Mode v) => v.name;
  static const Field<Mode, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static String _$systemPrompt(Mode v) => v.systemPrompt;
  static const Field<Mode, String> _f$systemPrompt = Field(
    'systemPrompt',
    _$systemPrompt,
    opt: true,
    def: '',
  );
  static bool _$isBuiltIn(Mode v) => v.isBuiltIn;
  static const Field<Mode, bool> _f$isBuiltIn = Field(
    'isBuiltIn',
    _$isBuiltIn,
    opt: true,
    def: false,
  );
  static bool _$isEnabled(Mode v) => v.isEnabled;
  static const Field<Mode, bool> _f$isEnabled = Field(
    'isEnabled',
    _$isEnabled,
    opt: true,
    def: true,
  );
  static int _$sortOrder(Mode v) => v.sortOrder;
  static const Field<Mode, int> _f$sortOrder = Field(
    'sortOrder',
    _$sortOrder,
    opt: true,
    def: 0,
  );
  static String _$description(Mode v) => v.description;
  static const Field<Mode, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static String _$icon(Mode v) => v.icon;
  static const Field<Mode, String> _f$icon = Field(
    'icon',
    _$icon,
    opt: true,
    def: '',
  );
  static Map<String, dynamic> _$settings(Mode v) => v.settings;
  static const Field<Mode, Map<String, dynamic>> _f$settings = Field(
    'settings',
    _$settings,
    opt: true,
    def: const {},
  );
  static DateTime? _$createdAt(Mode v) => v.createdAt;
  static const Field<Mode, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(Mode v) => v.updatedAt;
  static const Field<Mode, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static String _$displayIcon(Mode v) => v.displayIcon;
  static const Field<Mode, String> _f$displayIcon = Field(
    'displayIcon',
    _$displayIcon,
    mode: FieldMode.member,
  );
  static bool _$isDeletable(Mode v) => v.isDeletable;
  static const Field<Mode, bool> _f$isDeletable = Field(
    'isDeletable',
    _$isDeletable,
    mode: FieldMode.member,
  );
  static bool _$isEditable(Mode v) => v.isEditable;
  static const Field<Mode, bool> _f$isEditable = Field(
    'isEditable',
    _$isEditable,
    mode: FieldMode.member,
  );
  static String _$summary(Mode v) => v.summary;
  static const Field<Mode, String> _f$summary = Field(
    'summary',
    _$summary,
    mode: FieldMode.member,
  );
  static bool _$isValid(Mode v) => v.isValid;
  static const Field<Mode, bool> _f$isValid = Field(
    'isValid',
    _$isValid,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<Mode> fields = const {
    #id: _f$id,
    #name: _f$name,
    #systemPrompt: _f$systemPrompt,
    #isBuiltIn: _f$isBuiltIn,
    #isEnabled: _f$isEnabled,
    #sortOrder: _f$sortOrder,
    #description: _f$description,
    #icon: _f$icon,
    #settings: _f$settings,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #displayIcon: _f$displayIcon,
    #isDeletable: _f$isDeletable,
    #isEditable: _f$isEditable,
    #summary: _f$summary,
    #isValid: _f$isValid,
  };

  static Mode _instantiate(DecodingData data) {
    return Mode(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      systemPrompt: data.dec(_f$systemPrompt),
      isBuiltIn: data.dec(_f$isBuiltIn),
      isEnabled: data.dec(_f$isEnabled),
      sortOrder: data.dec(_f$sortOrder),
      description: data.dec(_f$description),
      icon: data.dec(_f$icon),
      settings: data.dec(_f$settings),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
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
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get settings;
  $R call({
    int? id,
    String? name,
    String? systemPrompt,
    bool? isBuiltIn,
    bool? isEnabled,
    int? sortOrder,
    String? description,
    String? icon,
    Map<String, dynamic>? settings,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  ModeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ModeCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Mode, $Out>
    implements ModeCopyWith<$R, Mode, $Out> {
  _ModeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Mode> $mapper = ModeMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get settings => MapCopyWith(
    $value.settings,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(settings: v),
  );
  @override
  $R call({
    int? id,
    String? name,
    String? systemPrompt,
    bool? isBuiltIn,
    bool? isEnabled,
    int? sortOrder,
    String? description,
    String? icon,
    Map<String, dynamic>? settings,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (systemPrompt != null) #systemPrompt: systemPrompt,
      if (isBuiltIn != null) #isBuiltIn: isBuiltIn,
      if (isEnabled != null) #isEnabled: isEnabled,
      if (sortOrder != null) #sortOrder: sortOrder,
      if (description != null) #description: description,
      if (icon != null) #icon: icon,
      if (settings != null) #settings: settings,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  Mode $make(CopyWithData data) => Mode(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    systemPrompt: data.get(#systemPrompt, or: $value.systemPrompt),
    isBuiltIn: data.get(#isBuiltIn, or: $value.isBuiltIn),
    isEnabled: data.get(#isEnabled, or: $value.isEnabled),
    sortOrder: data.get(#sortOrder, or: $value.sortOrder),
    description: data.get(#description, or: $value.description),
    icon: data.get(#icon, or: $value.icon),
    settings: data.get(#settings, or: $value.settings),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  ModeCopyWith<$R2, Mode, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ModeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

