import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'tag_selection_state.dart';
import 'tags_bloc.dart';

part 'tag_selection_bloc.g.dart';

/// Bloc for managing selected tags in a specific context (identified by key)
/// Supports adding/removing tags with deduplication
/// Watches tags bloc to sync when tags are deleted or modified
@riverpod
class TagSelectionBloc extends _$TagSelectionBloc {
  @override
  TagSelectionState build(String key) {
    // Watch the tags bloc to sync when tags change
    ref.watch(tagsBlocProvider);

    // The build method should only return the initial state
    // Any state synchronization will be handled in separate methods
    return TagSelectionState.empty;
  }

  /// Synchronize selected tags with available tags (removes deleted tags)
  void syncWithAvailableTags() {
    final tagState = ref.read(tagsBlocProvider);
    final availableTagNames = tagState.tags.map((tag) => tag.name).toSet();

    // Filter out any selected tags that no longer exist in the database
    final validSelectedTags = state.selectedTags
        .where((tagName) => availableTagNames.contains(tagName))
        .toIList();

    // If selected tags changed due to deletion, update state
    if (validSelectedTags.length != state.selectedTags.length) {
      state = state.copyWith(selectedTags: validSelectedTags);
      // Notify about the change
      _notifyTagsChanged();
    }
  }

  // Callback for notifying about tag changes
  void Function(List<String>)? _onTagsChanged;

  /// Set the callback for when tags change
  void setOnTagsChanged(void Function(List<String>)? callback) {
    _onTagsChanged = callback;
  }

  void _notifyTagsChanged() {
    _onTagsChanged?.call(getSelectedTags());
  }

  /// Add a tag to the selected list (with deduplication)
  void addTag(String tag) {
    final trimmedTag = tag.trim();
    if (trimmedTag.isEmpty || state.selectedTags.contains(trimmedTag)) {
      return;
    }

    state = state.copyWith(
      selectedTags: state.selectedTags.add(trimmedTag),
    );
    _notifyTagsChanged();
  }

  /// Remove a tag from the selected list
  void removeTag(String tag) {
    state = state.copyWith(
      selectedTags: state.selectedTags.where((t) => t != tag).toIList(),
    );
    _notifyTagsChanged();
  }

  /// Clear all selected tags
  void clearTags() {
    state = state.copyWith(
      selectedTags: const IListConst([]),
    );
    _notifyTagsChanged();
  }

  /// Set the selected tags (replacing current selection)
  void setTags(List<String> tags) {
    final uniqueTags =
        tags.where((tag) => tag.trim().isNotEmpty).toSet().toIList();
    state = state.copyWith(
      selectedTags: uniqueTags,
    );
    _notifyTagsChanged();
  }

  /// Get current selected tags as a regular list
  List<String> getSelectedTags() {
    return state.selectedTags.toList();
  }
}
