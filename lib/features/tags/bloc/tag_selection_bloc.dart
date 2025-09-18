import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/tags/models/tag.dart';
import 'tag_selection_state.dart';

part 'tag_selection_bloc.g.dart';

/// Static storage for initial tags configuration
class TagSelectionInitializer {
  static final Map<String, List<Tag>> _initialTagsMap = {};

  static void setInitialTags(String key, List<Tag>? tags) {
    if (tags != null && tags.isNotEmpty) {
      _initialTagsMap[key] = tags;
    } else {
      _initialTagsMap.remove(key);
    }
  }

  static List<Tag>? getInitialTags(String key) {
    return _initialTagsMap[key];
  }

  static void clearInitialTags(String key) {
    _initialTagsMap.remove(key);
  }
}

/// Bloc for managing selected tags in a specific context (identified by key)
/// Supports adding/removing tags with deduplication
/// Watches tags bloc to sync when tags are deleted or modified
@riverpod
class TagSelectionBloc extends _$TagSelectionBloc {
  @override
  TagSelectionState build(String key) {
    // Watch the tags bloc to sync when tags change
    // ref.listen(tagsBlocProvider, (previous, next) {
    //   // Remove any selected tags that no longer exist in the tags bloc
    //   state = state.copyWith(
    //       selectedTags: state.selectedTags
    //           .where((tag) => next.tags.any((t) => t.id == tag.id))
    //           .toIList());
    // });

    // Check for initial tags and initialize if present
    final initialTags = TagSelectionInitializer.getInitialTags(key);
    if (initialTags != null && initialTags.isNotEmpty) {
      // Clear the initial tags to prevent re-initialization
      TagSelectionInitializer.clearInitialTags(key);
      return TagSelectionState(
        selectedTags: initialTags.toIList(),
      );
    }

    return TagSelectionState.empty;
  }

  /// Add a tag to the selected list (with deduplication)
  void addTag(Tag tag) {
    if (state.selectedTags.any((t) => t.id == tag.id)) {
      return;
    }
    state = state.copyWith(
      selectedTags: state.selectedTags.add(tag),
    );
  }

  /// Remove a tag from the selected list
  void removeTag(Tag tag) {
    state = state.copyWith(
      selectedTags: state.selectedTags.where((t) => t.id != tag.id).toIList(),
    );
  }

  /// Clear all selected tags
  void clearTags() {
    state = state.copyWith(
      selectedTags: const IListConst([]),
    );
  }

  /// Set the selected tags to the provided list (replaces current selection)
  void setTags(List<Tag> tags) {
    state = state.copyWith(
      selectedTags: tags.toIList(),
    );
  }
}
