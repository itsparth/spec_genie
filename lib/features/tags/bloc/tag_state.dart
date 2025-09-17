import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../models/tag.dart';

part 'tag_state.mapper.dart';

/// Immutable state for the TagsBloc.
/// Holds the full list of tags.
@MappableClass()
class TagState with TagStateMappable {
  /// All tags (persisted + defaults). Immutable list.
  final IList<Tag> tags;
  
  /// Whether a save operation is currently in progress.
  final bool isSaving;

  const TagState({
    required this.tags,
    this.isSaving = false,
  });

  const TagState.initial() : tags = const IListConst([]), isSaving = false;

  static const empty = TagState.initial();
}