import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../models/mode.dart';
import '../../shared/isar_provider.dart';
import 'mode_state.dart';

part 'modes_bloc.g.dart';

/// Bloc responsible for managing modes list & persistence.
/// Capabilities:
///  - Load existing modes from Isar on build.
///  - Insert a default (non-editable) mode if database empty.
///  - CRUD operations for editable modes only.
///  - (Selection removed per current requirements)
@riverpod
class ModesBloc extends _$ModesBloc {
  final _defaultModes = [
    Mode(
        id: Isar.autoIncrement,
        name: 'Default Mode',
        prompt: 'You are a helpful assistant.',
        isEditable: false),
  ];

  @override
  ModeState build() {
    final isar = ref.read(isarProvider);
    // Load existing modes.
    final existing = isar.modes.where().findAllSync();
    if (existing.isNotEmpty) {
      return ModeState(
        modes: existing.toIList(),
      );
    }
    // Seed defaults asynchronously so build stays synchronous.
    Future(() async {
      final db = ref.read(isarProvider);
      final inserted = <Mode>[];
      await db.writeTxn(() async {
        for (final m in _defaultModes) {
          final id = await db.modes.put(m);
          final stored = await db.modes.get(id);
          if (stored != null) inserted.add(stored);
        }
      });
      if (inserted.isNotEmpty) {
        // Update state only if still empty (avoid overwriting user changes during race conditions).
        if (state.modes.isEmpty) {
          state = state.copyWith(
            modes: inserted.toIList(),
          );
        }
      }
    });
    return ModeState.empty;
  }

  /// Create a new editable mode and persist it.
  Future<void> create({required String name, required String prompt}) async {
    state = state.copyWith(isSaving: true);
    try {
      final isar = ref.read(isarProvider);
      final mode = Mode(name: name, prompt: prompt, isEditable: true);
      await isar.writeTxn(() async {
        final id = await isar.modes.put(mode);
        final stored = await isar.modes.get(id);
        if (stored != null) {
          final updated = state.modes.add(stored);
          state = state.copyWith(
            modes: updated,
            isSaving: false,
          );
        }
      });
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
  }

  /// Update an existing editable mode.
  Future<bool> update(int id, {String? name, String? prompt}) async {
    state = state.copyWith(isSaving: true);
    try {
      final isar = ref.read(isarProvider);
      final idx = state.modes.indexWhere((m) => m.id == id);
      if (idx == -1) {
        state = state.copyWith(isSaving: false);
        return false;
      }
      final original = state.modes[idx];
      if (!original.isEditable) {
        state = state.copyWith(isSaving: false);
        return false;
      }
      final updated = original.copyWith(
        name: name ?? original.name,
        prompt: prompt ?? original.prompt,
      );
      return await isar.writeTxn(() async {
        await isar.modes.put(updated);
        final updatedModes = state.modes.replace(idx, updated);
        state = state.copyWith(modes: updatedModes, isSaving: false);
        return true;
      });
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
  }

  /// Delete a mode (only if editable).
  Future<bool> remove(int id) async {
    state = state.copyWith(isSaving: true);
    try {
      final isar = ref.read(isarProvider);
      final idx = state.modes.indexWhere((m) => m.id == id);
      if (idx == -1) {
        state = state.copyWith(isSaving: false);
        return false;
      }
      final mode = state.modes[idx];
      if (!mode.isEditable) {
        state = state.copyWith(isSaving: false);
        return false;
      }
      return await isar.writeTxn(() async {
        final deleted = await isar.modes.delete(id);
        if (deleted) {
          final remaining = state.modes.where((m) => m.id != id).toIList();
          state = state.copyWith(
            modes: remaining,
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
    final list = await isar.modes.where().findAll();
    if (list.isNotEmpty) {
      state = state.copyWith(modes: list.toIList());
    }
  }
}
