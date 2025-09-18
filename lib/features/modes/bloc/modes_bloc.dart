import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/shared/objectbox/objectbox_provider.dart';
import '../models/mode.dart';
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
  static const String _testPrompt = "You are a code testing assistant. Help analyze and create tests for the provided code.";
  static const String _generatePrompt = "You are a code generation assistant. Help generate code based on the provided specifications.";
  static const String _reviewPrompt = "You are a code review assistant. Help analyze code for best practices, potential issues, and improvements.";
  static const String _docPrompt = "You are a technical writing assistant. Help create clear and comprehensive documentation.";

  static final List<Mode> _defaultModes = [
    Mode(
      id: 0, // Let ObjectBox auto-assign
      name: 'Test Code',
      prompt: _testPrompt,
      isEditable: false,
    ),
    Mode(
      id: 0, // Let ObjectBox auto-assign
      name: 'Generate Code',
      prompt: _generatePrompt,
      isEditable: false,
    ),
    Mode(
      id: 0, // Let ObjectBox auto-assign
      name: 'Code Review',
      prompt: _reviewPrompt,
      isEditable: false,
    ),
    Mode(
      id: 0, // Let ObjectBox auto-assign
      name: 'Technical Writing',
      prompt: _docPrompt,
      isEditable: false,
    ),
  ];

  @override
  ModeState build() {
    final store = ref.read(storeProvider);
    final box = store.box<Mode>();
    // Load existing modes.
    final existing = box.getAll();
    if (existing.isNotEmpty) {
      return ModeState(
        modes: existing.toIList(),
      );
    }
    // Seed defaults asynchronously so build stays synchronous.
    Future(() async {
      final store = ref.read(storeProvider);
      final box = store.box<Mode>();
      final inserted = <Mode>[];
      for (final m in _defaultModes) {
        final id = box.put(m);
        final stored = box.get(id);
        if (stored != null) inserted.add(stored);
      }
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
      final store = ref.read(storeProvider);
      final box = store.box<Mode>();
      final mode = Mode(name: name, prompt: prompt, isEditable: true);
      final id = box.put(mode);
      final stored = box.get(id);
      if (stored != null) {
        final updated = state.modes.add(stored);
        state = state.copyWith(
          modes: updated,
          isSaving: false,
        );
      }
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
      final store = ref.read(storeProvider);
      final box = store.box<Mode>();
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
      box.put(updated);
      final updatedModes = state.modes.replace(idx, updated);
      state = state.copyWith(modes: updatedModes, isSaving: false);
      return true;
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
      final store = ref.read(storeProvider);
      final box = store.box<Mode>();
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
      final deleted = box.remove(id);
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
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
  }

  /// Force reload list from persistence.
  Future<void> reload() async {
    final store = ref.read(storeProvider);
    final box = store.box<Mode>();
    final list = box.getAll();
    if (list.isNotEmpty) {
      state = state.copyWith(modes: list.toIList());
    }
  }
}
