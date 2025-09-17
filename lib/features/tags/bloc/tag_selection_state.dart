import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/tags/models/tag.dart';

part 'tag_selection_state.mapper.dart';

@MappableClass()
class TagSelectionState with TagSelectionStateMappable {
  final IList<Tag> selectedTags;
  final bool isLoading;

  const TagSelectionState({
    this.selectedTags = const IListConst([]),
    this.isLoading = false,
  });

  static const empty = TagSelectionState();
}
