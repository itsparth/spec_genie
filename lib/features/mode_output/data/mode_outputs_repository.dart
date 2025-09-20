import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/mode_output.dart';
import '../../threads/models/thread.dart';
import '../../modes/models/mode.dart';
import '../../shared/isar/isar_provider.dart';

part 'mode_outputs_repository.g.dart';

/// Repository responsible for all Isar database access for ModeOutputs.
/// Keeps persistence logic out of the bloc.
class ModeOutputsRepository {
  ModeOutputsRepository(this._isar);

  final Isar _isar;

  /// Returns all mode outputs for a thread+mode sorted by creation time ascending.
  Future<List<ModeOutput>> getOutputsFor(int threadId, int modeId) =>
      _isar.modeOutputs
          .filter()
          .thread((q) => q.idEqualTo(threadId))
          .and()
          .mode((q) => q.idEqualTo(modeId))
          .sortByCreatedAt() // chronological
          .findAll();

  /// Adds a placeholder output (empty content) and links it to thread & mode.
  Future<ModeOutput> addPlaceholder(Thread thread, Mode mode) async {
    final placeholder = ModeOutput.completed(content: '');
    await _isar.writeTxn(() async {
      await _isar.modeOutputs.put(placeholder);
      placeholder.thread.value = thread;
      placeholder.mode.value = mode;
      await placeholder.thread.save();
      await placeholder.mode.save();
    });
    return placeholder;
  }

  /// Persists final content for an existing placeholder output.
  Future<ModeOutput> completeOutput(
      ModeOutput placeholder, String content) async {
    // Mutate in place to preserve id
    placeholder.content = content;
    await _isar.writeTxn(() async {
      await _isar.modeOutputs.put(placeholder);
      // Relationships should already be set; save defensively
      await placeholder.thread.save();
      await placeholder.mode.save();
    });
    return placeholder;
  }

  /// Saves a brand new output created during regeneration (already in-memory object).
  Future<ModeOutput> saveNewOutput(
      ModeOutput output, Thread thread, Mode mode) async {
    await _isar.writeTxn(() async {
      await _isar.modeOutputs.put(output);
      output.thread.value = thread;
      output.mode.value = mode;
      await output.thread.save();
      await output.mode.save();
    });
    return output;
  }

  /// Deletes a mode output by id.
  Future<void> deleteOutput(int id) async {
    await _isar.writeTxn(() async {
      await _isar.modeOutputs.delete(id);
    });
  }

  /// Returns the most recent output for thread+mode if its content is empty.
  Future<ModeOutput?> getLatestEmpty(int threadId, int modeId) async {
    final latest = await _isar.modeOutputs
        .filter()
        .thread((q) => q.idEqualTo(threadId))
        .and()
        .mode((q) => q.idEqualTo(modeId))
        .sortByCreatedAtDesc()
        .findFirst();
    if (latest != null && (latest.content.isEmpty)) {
      return latest;
    }
    return null;
  }

  /// Returns the Mode associated with the most recent output for a given thread, or null if none.
  Future<Mode?> getLatestUsedModeForThread(int threadId) async {
    final latest = await _isar.modeOutputs
        .filter()
        .thread((q) => q.idEqualTo(threadId))
        .sortByCreatedAtDesc()
        .findFirst();
    if (latest == null) return null;
    await latest.mode.load();
    return latest.mode.value;
  }

  /// Determines the most frequently used Mode across the last [lookback] outputs.
  /// Returns the Mode instance (loaded) or null if none.
  /// Tie-breaker: among equally frequent modes, the most recent output wins.
  Future<Mode?> getMostUsedModeInLastGenerations({int lookback = 10}) async {
    final recentOutputs = await _isar.modeOutputs
        .where()
        .sortByCreatedAtDesc()
        .limit(lookback)
        .findAll();
    if (recentOutputs.isEmpty) return null;

    final freq = <int, int>{};
    // Keep a map of id -> Mode reference (first seen) to return the proper instance.
    final modeRef = <int, Mode>{};
    for (final output in recentOutputs) {
      await output.mode.load();
      final modeObj = output.mode.value;
      final modeId = modeObj?.id;
      if (modeObj == null || modeId == null) continue;
      freq.update(modeId, (v) => v + 1, ifAbsent: () => 1);
      modeRef.putIfAbsent(modeId, () => modeObj);
    }
    if (freq.isEmpty) return null;

    final maxCount = freq.values.fold<int>(0, (p, c) => c > p ? c : p);
    for (final output in recentOutputs) {
      final id = output.mode.value?.id;
      if (id != null && freq[id] == maxCount) {
        return modeRef[id];
      }
    }
    return null;
  }
}

/// Riverpod provider for the repository
@riverpod
ModeOutputsRepository modeOutputsRepository(Ref ref) {
  final isar = ref.watch(isarProvider);
  return ModeOutputsRepository(isar);
}
