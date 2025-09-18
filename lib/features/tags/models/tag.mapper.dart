// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tag.dart';

class TagMapper extends ClassMapperBase<Tag> {
  TagMapper._();

  static TagMapper? _instance;
  static TagMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Tag';

  static int _$id(Tag v) => v.id;
  static const Field<Tag, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
    def: Isar.autoIncrement,
  );
  static String _$name(Tag v) => v.name;
  static const Field<Tag, String> _f$name = Field('name', _$name);
  static String _$description(Tag v) => v.description;
  static const Field<Tag, String> _f$description = Field(
    'description',
    _$description,
  );
  static bool _$isEditable(Tag v) => v.isEditable;
  static const Field<Tag, bool> _f$isEditable = Field(
    'isEditable',
    _$isEditable,
    opt: true,
    def: true,
  );
  static IsarLinks<Message> _$messages(Tag v) => v.messages;
  static const Field<Tag, IsarLinks<Message>> _f$messages = Field(
    'messages',
    _$messages,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<Tag> fields = const {
    #id: _f$id,
    #name: _f$name,
    #description: _f$description,
    #isEditable: _f$isEditable,
    #messages: _f$messages,
  };

  static Tag _instantiate(DecodingData data) {
    return Tag(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      description: data.dec(_f$description),
      isEditable: data.dec(_f$isEditable),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Tag fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Tag>(map);
  }

  static Tag fromJson(String json) {
    return ensureInitialized().decodeJson<Tag>(json);
  }
}

mixin TagMappable {
  String toJson() {
    return TagMapper.ensureInitialized().encodeJson<Tag>(this as Tag);
  }

  Map<String, dynamic> toMap() {
    return TagMapper.ensureInitialized().encodeMap<Tag>(this as Tag);
  }

  TagCopyWith<Tag, Tag, Tag> get copyWith =>
      _TagCopyWithImpl<Tag, Tag>(this as Tag, $identity, $identity);
  @override
  String toString() {
    return TagMapper.ensureInitialized().stringifyValue(this as Tag);
  }

  @override
  bool operator ==(Object other) {
    return TagMapper.ensureInitialized().equalsValue(this as Tag, other);
  }

  @override
  int get hashCode {
    return TagMapper.ensureInitialized().hashValue(this as Tag);
  }
}

extension TagValueCopy<$R, $Out> on ObjectCopyWith<$R, Tag, $Out> {
  TagCopyWith<$R, Tag, $Out> get $asTag =>
      $base.as((v, t, t2) => _TagCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TagCopyWith<$R, $In extends Tag, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name, String? description, bool? isEditable});
  TagCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TagCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Tag, $Out>
    implements TagCopyWith<$R, Tag, $Out> {
  _TagCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Tag> $mapper = TagMapper.ensureInitialized();
  @override
  $R call({int? id, String? name, String? description, bool? isEditable}) =>
      $apply(
        FieldCopyWithData({
          if (id != null) #id: id,
          if (name != null) #name: name,
          if (description != null) #description: description,
          if (isEditable != null) #isEditable: isEditable,
        }),
      );
  @override
  Tag $make(CopyWithData data) => Tag(
        id: data.get(#id, or: $value.id),
        name: data.get(#name, or: $value.name),
        description: data.get(#description, or: $value.description),
        isEditable: data.get(#isEditable, or: $value.isEditable),
      );

  @override
  TagCopyWith<$R2, Tag, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TagCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
