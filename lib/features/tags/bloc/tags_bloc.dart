import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/shared/objectbox/objectbox_provider.dart';
import '../models/tag.dart';
import 'tag_state.dart';

part 'tags_bloc.g.dart';

/// Bloc responsible for managing tags list & persistence.
/// Capabilities:
///  - Load existing tags from Isar on build.
///  - Insert default (non-editable) tags if database empty.
///  - CRUD operations for editable tags only.
@riverpod
class TagsBloc extends _$TagsBloc {
  final _defaultTags = [
    Tag(
        id: 0, // Let ObjectBox auto-assign
        name: 'Feature',
        description: 'Feature specifications and functionality',
        isEditable: false),
    Tag(
        id: 0, // Let ObjectBox auto-assign
        name: 'Requirement',
        description: 'System requirements and constraints',
        isEditable: false),
  ];

  @override
  TagState build() {
    final store = ref.read(storeProvider);
    final box = store.box<Tag>();
    // Load existing tags.
    final existing = box.getAll();
    if (existing.isNotEmpty) {
      return TagState(
        tags: existing.toIList(),
      );
    }
    // Seed defaults asynchronously so build stays synchronous.
    Future(() async {
      final store = ref.read(storeProvider);
      final box = store.box<Tag>();
      final inserted = <Tag>[];
      for (final t in _defaultTags) {
        final id = box.put(t);
        final stored = box.get(id);
        if (stored != null) inserted.add(stored);
      }
      if (inserted.isNotEmpty) {
        // Update state only if still empty (avoid overwriting user changes during race conditions).
        if (state.tags.isEmpty) {
          state = state.copyWith(
            tags: inserted.toIList(),
          );
        }
      }
    });
    return TagState.empty;
  }

  /// Create a new editable tag and persist it.
  Future<Tag?> create(
      {required String name, required String description}) async {
    state = state.copyWith(isSaving: true);
    Tag? stored;
    try {
      final store = ref.read(storeProvider);
      final box = store.box<Tag>();
      final tag = Tag(name: name, description: description, isEditable: true);
      final id = box.put(tag);
      stored = box.get(id);
      if (stored != null) {
        final updated = state.tags.add(stored!);
        state = state.copyWith(
          tags: updated,
          isSaving: false,
        );
      }
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
    return stored;
  }

  /// Update an existing editable tag.
  Future<bool> update(int id, {String? name, String? description}) async {
    state = state.copyWith(isSaving: true);
    try {
      final store = ref.read(storeProvider);
      final box = store.box<Tag>();
      final idx = state.tags.indexWhere((t) => t.id == id);
      if (idx == -1) {
        state = state.copyWith(isSaving: false);
        return false;
      }
      final original = state.tags[idx];
      if (!original.isEditable) {
        state = state.copyWith(isSaving: false);
        return false;
      }
      final updated = original.copyWith(
        name: name ?? original.name,
        description: description ?? original.description,
      );
      box.put(updated);
      final updatedTags = state.tags.replace(idx, updated);
      state = state.copyWith(tags: updatedTags, isSaving: false);
      return true;
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
  }

  /// Delete a tag (only if editable).
  Future<bool> remove(int id) async {
    state = state.copyWith(isSaving: true);
    try {
      final store = ref.read(storeProvider);
      final box = store.box<Tag>();
      final idx = state.tags.indexWhere((t) => t.id == id);
      if (idx == -1) {
        state = state.copyWith(isSaving: false);
        return false;
      }
      final tag = state.tags[idx];
      if (!tag.isEditable) {
        state = state.copyWith(isSaving: false);
        return false;
      }
      final deleted = box.remove(id);
      if (deleted) {
        final remaining = state.tags.where((t) => t.id != id).toIList();
        state = state.copyWith(
          tags: remaining,
          isSaving: false,
        );
      } else {
        state = state.copyWith(isSaving: false);
      }
      return deleted;
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
  }

  /// Force reload list from persistence.
  Future<void> reload() async {
    final store = ref.read(storeProvider);
    final box = store.box<Tag>();
    final list = box.getAll();
    if (list.isNotEmpty) {
      state = state.copyWith(tags: list.toIList());
    }
  }
}
