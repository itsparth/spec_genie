import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/modes/data/modes_repository.dart';
import 'package:spec_genie/features/modes/data/modes_providers.dart';
import '../models/mode.dart';
import 'mode_state.dart';

part 'modes_bloc.g.dart';

/// Bloc responsible for managing modes list & persistence.
/// Capabilities:
///  - Provides CRUD operations for editable modes.
///  - List state derives from watchAllModesProvider stream; no manual seeding here.
@riverpod
class ModesBloc extends _$ModesBloc {
  @override
  ModeState build() {
    // Listen to stream provider; rebuild state when list changes.
    ref.listen<AsyncValue<List<Mode>>>(watchAllModesProvider, (prev, next) {
      next.whenData((list) {
        state = state.copyWith(modes: list.toIList());
      });
    });
    // Initial value from current provider state (avoid wait for listen callback if already loaded)
    final current = ref.read(watchAllModesProvider);
    return current.maybeWhen(
      data: (list) => ModeState(modes: list.toIList()),
      orElse: () => ModeState.empty,
    );
  }

  /// Create a new editable mode and persist it.
  Future<void> create({required String name, required String prompt}) async {
    state = state.copyWith(isSaving: true);
    try {
      final ModesRepository repo = ref.read(modesRepositoryProvider);
      await repo.addEditableMode(name: name, prompt: prompt);
      state = state.copyWith(isSaving: false); // list will update via stream
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
      final ModesRepository repo = ref.read(modesRepositoryProvider);
      final updated = await repo.updateMode(id, name: name, prompt: prompt);
      state = state.copyWith(isSaving: false);
      return updated != null;
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
      final ModesRepository repo = ref.read(modesRepositoryProvider);
      final deleted = await repo.deleteMode(id);
      state = state.copyWith(isSaving: false);
      return deleted;
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
  }
}
