import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import '../models/mode.dart';
import '../../shared/isar_provider.dart';
import 'mode_state.dart';

part 'modes_bloc.g.dart';

/// Bloc responsible for managing modes list & persistence.
/// Capabilities:
///  - Load existing modes from Isar on build.
///  - Insert a default (non-editable) mode if database empty.
///  - CRUD operations for editable modes only.
///  - Track selected mode id.
@riverpod
class ModesBloc extends _$ModesBloc {
  static const _defaultModes = [
    Mode(id: Isar.autoIncrement, name: 'Default Mode', prompt: 'You are a helpful assistant.', isEditable: false),
  ];

  @override
  ModeState build() {
    final isar = ref.read(isarProvider);
    // Load existing modes.
    final existing = isar.modes.where().findAllSync();
    if (existing.isNotEmpty) {
      return ModeState(
        modes: List<Mode>.unmodifiable(existing),
        selectedId: existing.first.id,
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
            modes: List<Mode>.unmodifiable(inserted),
            selectedId: inserted.first.id,
          );
        }
      }
    });
    return ModeState.empty;
  }

  /// Select a mode by id.
  void select(int id) {
    if (state.selectedId == id) return; // no-op
    if (state.modes.any((m) => m.id == id)) {
      state = state.copyWith(selectedId: id);
    }
  }

  /// Create a new editable mode and persist it.
  Future<void> create({required String name, required String prompt}) async {
    final isar = ref.read(isarProvider);
    final mode = Mode(name: name, prompt: prompt, isEditable: true);
    await isar.writeTxn(() async {
      final id = await isar.modes.put(mode);
      final stored = await isar.modes.get(id);
      if (stored != null) {
        final updated = <Mode>[...state.modes, stored];
        state = state.copyWith(
          modes: List<Mode>.unmodifiable(updated),
          selectedId: stored.id,
        );
      }
    });
  }

  /// Update an existing editable mode.
  Future<bool> update(int id, {String? name, String? prompt}) async {
    final isar = ref.read(isarProvider);
  final idx = state.modes.indexWhere((m) => m.id == id);
  if (idx == -1) return false;
  final original = state.modes[idx];
    if (!original.isEditable) return false;
    final updated = original.copyWith(
      name: name ?? original.name,
      prompt: prompt ?? original.prompt,
    );
    return await isar.writeTxn(() async {
      await isar.modes.put(updated);
      final list = <Mode>[...state.modes];
      list[idx] = updated;
      state = state.copyWith(modes: List<Mode>.unmodifiable(list));
      return true;
    });
  }

  /// Delete a mode (only if editable). Adjust selection if needed.
  Future<bool> remove(int id) async {
    final isar = ref.read(isarProvider);
    final idx = state.modes.indexWhere((m) => m.id == id);
    if (idx == -1) return false;
    final mode = state.modes[idx];
    if (!mode.isEditable) return false;
    return await isar.writeTxn(() async {
      final deleted = await isar.modes.delete(id);
      if (deleted) {
        final remaining = state.modes.where((m) => m.id != id).toList(growable: false);
        int? newSelected = state.selectedId;
        if (newSelected == id) {
          newSelected = remaining.isEmpty ? null : remaining.first.id;
        }
        state = state.copyWith(
          modes: List<Mode>.unmodifiable(remaining),
          selectedId: newSelected,
        );
      }
      return deleted;
    });
  }

  /// Force reload list from persistence.
  Future<void> reload() async {
    final isar = ref.read(isarProvider);
    final list = await isar.modes.where().findAll();
    if (list.isNotEmpty) {
      state = state.copyWith(modes: List<Mode>.unmodifiable(list));
    }
  }
}
