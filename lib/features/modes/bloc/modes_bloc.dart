import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/mode.dart';

part 'modes_bloc.g.dart';

@riverpod
class ModesBloc extends _$ModesBloc {
  @override
  List<Mode> build() {
    // Return default modes
    return [
      Mode.spec(),
      Mode.codeContext(),
    ];
  }

  /// Add a custom mode
  void addCustomMode({required String name, required String prompt}) {
    final customMode = Mode.custom(name: name, prompt: prompt);
    state = [...state, customMode];
  }

  /// Update an existing custom mode
  void updateMode(int modeId, {required String name, required String prompt}) {
    state = state.map((mode) {
      if (mode.id == modeId && mode.isEditable) {
        return Mode.custom(name: name, prompt: prompt);
      }
      return mode;
    }).toList();
  }

  /// Delete a custom mode
  void deleteMode(int modeId) {
    state = state
        .where((mode) =>
                mode.id != modeId ||
                mode.isDefault // Can't delete default modes
            )
        .toList();
  }

  /// Duplicate a mode (create custom copy)
  void duplicateMode(int modeId, String newName) {
    final originalMode = state.firstWhere((mode) => mode.id == modeId);
    final duplicatedMode = Mode.custom(
      name: newName,
      prompt: originalMode.prompt,
    );
    state = [...state, duplicatedMode];
  }

  /// Get mode by ID
  Mode? getModeById(int modeId) {
    try {
      return state.firstWhere((mode) => mode.id == modeId);
    } catch (e) {
      return null;
    }
  }

  /// Get all custom modes
  List<Mode> get customModes {
    return state.where((mode) => !mode.isDefault).toList();
  }

  /// Get all default modes
  List<Mode> get defaultModes {
    return state.where((mode) => mode.isDefault).toList();
  }
}
