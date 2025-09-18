import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/database/repositories/tags_repository.dart';
import 'package:spec_genie/database/database.dart';
import 'package:drift/drift.dart' show Value;
import 'tag_state.dart';

part 'tags_bloc.g.dart';

/// Bloc responsible for managing tags list & persistence.
/// Capabilities:
///  - Load existing tags from Isar on build.
///  - Insert default (non-editable) tags if database empty.
///  - CRUD operations for editable tags only.
@riverpod
class TagsBloc extends _$TagsBloc {
  static const _defaultTags = [
    ('Feature', 'Feature specifications and functionality'),
    ('Requirement', 'System requirements and constraints'),
  ];

  @override
  TagState build() {
    // Start listening to tag stream
    final repo = ref.read(tagsRepositoryProvider);
    repo.watchAll().listen((rows) {
      state = state.copyWith(tags: rows.toIList());
    });
    _seedDefaultsIfEmpty();
    return TagState.empty;
  }

  Future<void> _seedDefaultsIfEmpty() async {
    final repo = ref.read(tagsRepositoryProvider);
    final adb = repo.db as AppDatabase;
    final existing = await (adb.select(adb.tags)).get();
    if (existing.isEmpty) {
      for (final (name, description) in _defaultTags) {
        await adb.into(adb.tags).insert(TagsCompanion.insert(
              name: name,
              description: description,
              isEditable: const Value(false),
            ));
      }
    }
  }

  Future<void> create(
      {required String name, required String description}) async {
    state = state.copyWith(isSaving: true);
    try {
      final adb = (ref.read(tagsRepositoryProvider).db as AppDatabase);
      await adb.into(adb.tags).insert(TagsCompanion.insert(
            name: name,
            description: description,
            isEditable: const Value(true),
          ));
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }

  Future<bool> update(int id, {String? name, String? description}) async {
    state = state.copyWith(isSaving: true);
    try {
      final adb = (ref.read(tagsRepositoryProvider).db as AppDatabase);
      await (adb.update(adb.tags)..where((t) => t.id.equals(id))).write(
        TagsCompanion(
          name: name != null ? Value(name) : const Value.absent(),
          description:
              description != null ? Value(description) : const Value.absent(),
        ),
      );
      return true;
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }

  Future<bool> remove(int id) async {
    state = state.copyWith(isSaving: true);
    try {
      final adb = (ref.read(tagsRepositoryProvider).db as AppDatabase);
      await (adb.delete(adb.tags)..where((t) => t.id.equals(id))).go();
      return true;
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }

  Future<void> reload() async {/* stream handles updates */}
}
