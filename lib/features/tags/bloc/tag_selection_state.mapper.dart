// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tag_selection_state.dart';

class TagSelectionStateMapper extends ClassMapperBase<TagSelectionState> {
  TagSelectionStateMapper._();

  static TagSelectionStateMapper? _instance;
  static TagSelectionStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagSelectionStateMapper._());
      TagMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TagSelectionState';

  static IList<Tag> _$selectedTags(TagSelectionState v) => v.selectedTags;
  static const Field<TagSelectionState, IList<Tag>> _f$selectedTags = Field(
    'selectedTags',
    _$selectedTags,
    opt: true,
    def: const IListConst([]),
  );
  static bool _$isLoading(TagSelectionState v) => v.isLoading;
  static const Field<TagSelectionState, bool> _f$isLoading = Field(
    'isLoading',
    _$isLoading,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<TagSelectionState> fields = const {
    #selectedTags: _f$selectedTags,
    #isLoading: _f$isLoading,
  };

  static TagSelectionState _instantiate(DecodingData data) {
    return TagSelectionState(
      selectedTags: data.dec(_f$selectedTags),
      isLoading: data.dec(_f$isLoading),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TagSelectionState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TagSelectionState>(map);
  }

  static TagSelectionState fromJson(String json) {
    return ensureInitialized().decodeJson<TagSelectionState>(json);
  }
}

mixin TagSelectionStateMappable {
  String toJson() {
    return TagSelectionStateMapper.ensureInitialized()
        .encodeJson<TagSelectionState>(this as TagSelectionState);
  }

  Map<String, dynamic> toMap() {
    return TagSelectionStateMapper.ensureInitialized()
        .encodeMap<TagSelectionState>(this as TagSelectionState);
  }

  TagSelectionStateCopyWith<
    TagSelectionState,
    TagSelectionState,
    TagSelectionState
  >
  get copyWith =>
      _TagSelectionStateCopyWithImpl<TagSelectionState, TagSelectionState>(
        this as TagSelectionState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TagSelectionStateMapper.ensureInitialized().stringifyValue(
      this as TagSelectionState,
    );
  }

  @override
  bool operator ==(Object other) {
    return TagSelectionStateMapper.ensureInitialized().equalsValue(
      this as TagSelectionState,
      other,
    );
  }

  @override
  int get hashCode {
    return TagSelectionStateMapper.ensureInitialized().hashValue(
      this as TagSelectionState,
    );
  }
}

extension TagSelectionStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TagSelectionState, $Out> {
  TagSelectionStateCopyWith<$R, TagSelectionState, $Out>
  get $asTagSelectionState => $base.as(
    (v, t, t2) => _TagSelectionStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TagSelectionStateCopyWith<
  $R,
  $In extends TagSelectionState,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({IList<Tag>? selectedTags, bool? isLoading});
  TagSelectionStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TagSelectionStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TagSelectionState, $Out>
    implements TagSelectionStateCopyWith<$R, TagSelectionState, $Out> {
  _TagSelectionStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TagSelectionState> $mapper =
      TagSelectionStateMapper.ensureInitialized();
  @override
  $R call({IList<Tag>? selectedTags, bool? isLoading}) => $apply(
    FieldCopyWithData({
      if (selectedTags != null) #selectedTags: selectedTags,
      if (isLoading != null) #isLoading: isLoading,
    }),
  );
  @override
  TagSelectionState $make(CopyWithData data) => TagSelectionState(
    selectedTags: data.get(#selectedTags, or: $value.selectedTags),
    isLoading: data.get(#isLoading, or: $value.isLoading),
  );

  @override
  TagSelectionStateCopyWith<$R2, TagSelectionState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TagSelectionStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

