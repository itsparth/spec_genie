import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/shared/isar/isar_provider.dart';
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
        id: Isar.autoIncrement,
        name: 'Feature',
        description: 'Feature specifications and functionality',
        isEditable: false),
    Tag(
        id: Isar.autoIncrement,
        name: 'Requirement',
        description: 'System requirements and constraints',
        isEditable: false),
  ];

  @override
  TagState build() {
    final isar = ref.read(isarProvider);
    // Load existing tags.
    final existing = isar.tags.where().findAllSync();
    if (existing.isNotEmpty) {
      return TagState(
        tags: existing.toIList(),
      );
    }
    // Seed defaults asynchronously so build stays synchronous.
    Future(() async {
      final db = ref.read(isarProvider);
      final inserted = <Tag>[];
      await db.writeTxn(() async {
        for (final t in _defaultTags) {
          final id = await db.tags.put(t);
          final stored = await db.tags.get(id);
          if (stored != null) inserted.add(stored);
        }
      });
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
      final isar = ref.read(isarProvider);
      final tag = Tag(name: name, description: description, isEditable: true);
      await isar.writeTxn(() async {
        final id = await isar.tags.put(tag);
        stored = await isar.tags.get(id);
        if (stored != null) {
          final updated = state.tags.add(stored!);
          state = state.copyWith(
            tags: updated,
            isSaving: false,
          );
        }
      });
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
      final isar = ref.read(isarProvider);
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
      return await isar.writeTxn(() async {
        await isar.tags.put(updated);
        final updatedTags = state.tags.replace(idx, updated);
        state = state.copyWith(tags: updatedTags, isSaving: false);
        return true;
      });
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
      final isar = ref.read(isarProvider);
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
      return await isar.writeTxn(() async {
        final deleted = await isar.tags.delete(id);
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
      });
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
  }

  /// Force reload list from persistence.
  Future<void> reload() async {
    final isar = ref.read(isarProvider);
    final list = await isar.tags.where().findAll();
    if (list.isNotEmpty) {
      state = state.copyWith(tags: list.toIList());
    }
  }
}
