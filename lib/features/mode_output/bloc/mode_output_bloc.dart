import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../models/mode_output.dart';
import '../../threads/models/thread.dart';
import '../../modes/models/mode.dart';
import '../../shared/isar_provider.dart';
import 'mode_output_state.dart';

part 'mode_output_bloc.g.dart';

/// Manages mode outputs for a specific thread and mode combination
@riverpod
class ModeOutputBloc extends _$ModeOutputBloc {
  int? _threadId;
  int? _modeId;

  @override
  ModeOutputState build(int threadId, int modeId) {
    _threadId = threadId;
    _modeId = modeId;
    _loadOutputs(threadId, modeId);
    return const ModeOutputState(isLoading: true);
  }

  /// Load all outputs for the thread and mode combination
  Future<void> _loadOutputs(int threadId, int modeId) async {
    try {
      final isar = ref.read(isarProvider);
      final outputs = await isar.modeOutputs
          .filter()
          .thread((q) => q.idEqualTo(threadId))
          .and()
          .mode((q) => q.idEqualTo(modeId))
          .sortByCreatedAt()
          .findAll();

      state = state.copyWith(
        outputs: outputs.toIList(),
        isLoading: false,
        isGenerating: false,
        currentIndex: outputs.isNotEmpty
            ? outputs.length - 1
            : 0, // Show latest by default
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isGenerating: false,
        error: e.toString(),
      );
    }
  }

  /// Generate a new output for the current thread and mode
  Future<void> generateOutput({String? customPrompt}) async {
    final threadId = _threadId!;
    final modeId = _modeId!;

    state = state.copyWith(isGenerating: true, error: null);

    try {
      final isar = ref.read(isarProvider);

      // Get the thread and mode
      final thread = await isar.threads.get(threadId);
      final mode = await isar.modes.get(modeId);

      if (thread == null || mode == null) {
        throw Exception('Thread or Mode not found');
      }

      // TODO: Integrate with AI service to generate actual content
      // For now, simulate generation with a delay
      await Future<void>.delayed(const Duration(seconds: 2));

      // Create the completed output with generated content
      final completedOutput = ModeOutput.completed(
        content:
            'Generated content for mode "${mode.name}" in thread "${thread.name}".\n\nThis is placeholder content that would be replaced with actual AI-generated content.',
      );

      // Save to database and link relationships
      await isar.writeTxn(() async {
        await isar.modeOutputs.put(completedOutput);
        completedOutput.thread.value = thread;
        completedOutput.mode.value = mode;
        await completedOutput.thread.save();
        await completedOutput.mode.save();
      });

      // Reload outputs to get the updated state
      await _loadOutputs(threadId, modeId);
    } catch (e) {
      state = state.copyWith(
        isGenerating: false,
        error: e.toString(),
      );
    }
  }

  /// Regenerate the current output
  Future<void> regenerateCurrentOutput() async {
    final currentOutput = state.currentOutput;
    if (currentOutput == null) return;

    await generateOutput();
  }

  /// Navigate to the previous output
  void goToPreviousOutput() {
    if (state.canGoBack) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  /// Navigate to the next output
  void goToNextOutput() {
    if (state.canGoForward) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  /// Navigate to a specific output by index
  void goToOutput(int index) {
    if (index >= 0 && index < state.outputs.length) {
      state = state.copyWith(currentIndex: index);
    }
  }

  /// Delete the current output
  Future<void> deleteCurrentOutput() async {
    final currentOutput = state.currentOutput;
    if (currentOutput == null || state.outputs.length <= 1) return;

    try {
      final isar = ref.read(isarProvider);

      await isar.writeTxn(() async {
        await isar.modeOutputs.delete(currentOutput.id);
      });

      // Remove from state and adjust current index
      final updatedOutputs = state.outputs.removeAt(state.currentIndex);
      final newIndex = state.currentIndex >= updatedOutputs.length
          ? updatedOutputs.length - 1
          : state.currentIndex;

      state = state.copyWith(
        outputs: updatedOutputs,
        currentIndex: newIndex.clamp(0, updatedOutputs.length - 1),
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Clear error state
  void clearError() {
    state = state.copyWith(error: null);
  }
}
