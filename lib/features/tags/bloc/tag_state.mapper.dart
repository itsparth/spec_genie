// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tag_state.dart';

class TagStateMapper extends ClassMapperBase<TagState> {
  TagStateMapper._();

  static TagStateMapper? _instance;
  static TagStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagStateMapper._());
      TagMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TagState';

  static IList<Tag> _$tags(TagState v) => v.tags;
  static const Field<TagState, IList<Tag>> _f$tags = Field('tags', _$tags);
  static bool _$isSaving(TagState v) => v.isSaving;
  static const Field<TagState, bool> _f$isSaving = Field(
    'isSaving',
    _$isSaving,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<TagState> fields = const {
    #tags: _f$tags,
    #isSaving: _f$isSaving,
  };

  static TagState _instantiate(DecodingData data) {
    return TagState(tags: data.dec(_f$tags), isSaving: data.dec(_f$isSaving));
  }

  @override
  final Function instantiate = _instantiate;

  static TagState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TagState>(map);
  }

  static TagState fromJson(String json) {
    return ensureInitialized().decodeJson<TagState>(json);
  }
}

mixin TagStateMappable {
  String toJson() {
    return TagStateMapper.ensureInitialized().encodeJson<TagState>(
      this as TagState,
    );
  }

  Map<String, dynamic> toMap() {
    return TagStateMapper.ensureInitialized().encodeMap<TagState>(
      this as TagState,
    );
  }

  TagStateCopyWith<TagState, TagState, TagState> get copyWith =>
      _TagStateCopyWithImpl<TagState, TagState>(
        this as TagState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TagStateMapper.ensureInitialized().stringifyValue(this as TagState);
  }

  @override
  bool operator ==(Object other) {
    return TagStateMapper.ensureInitialized().equalsValue(
      this as TagState,
      other,
    );
  }

  @override
  int get hashCode {
    return TagStateMapper.ensureInitialized().hashValue(this as TagState);
  }
}

extension TagStateValueCopy<$R, $Out> on ObjectCopyWith<$R, TagState, $Out> {
  TagStateCopyWith<$R, TagState, $Out> get $asTagState =>
      $base.as((v, t, t2) => _TagStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TagStateCopyWith<$R, $In extends TagState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({IList<Tag>? tags, bool? isSaving});
  TagStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TagStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TagState, $Out>
    implements TagStateCopyWith<$R, TagState, $Out> {
  _TagStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TagState> $mapper =
      TagStateMapper.ensureInitialized();
  @override
  $R call({IList<Tag>? tags, bool? isSaving}) => $apply(
        FieldCopyWithData({
          if (tags != null) #tags: tags,
          if (isSaving != null) #isSaving: isSaving,
        }),
      );
  @override
  TagState $make(CopyWithData data) => TagState(
        tags: data.get(#tags, or: $value.tags),
        isSaving: data.get(#isSaving, or: $value.isSaving),
      );

  @override
  TagStateCopyWith<$R2, TagState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _TagStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
