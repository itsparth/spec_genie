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

  /// Computes the globally most used mode across ALL outputs (optionally limited by [maxScan]).
  /// Strategy:
  /// 1. Scan most recent [maxScan] outputs (default 200) descending by createdAt.
  /// 2. Build frequency map; stop early if we have already seen a stable winner and remaining
  ///    outputs cannot overtake (micro-optimization; minimal here but keeps future scalability).
  /// 3. Tie-breaker: the most recent occurrence among modes with equal frequency wins.
  /// Returns loaded Mode instance or null if none.
  Future<Mode?> getGloballyMostUsedMode({int maxScan = 20}) async {
    final outputs = await _isar.modeOutputs
        .where()
        .sortByCreatedAtDesc()
        .limit(maxScan)
        .findAll();
    if (outputs.isEmpty) return null;

    final freq = <int, int>{};
    final latestOccurrenceIndex =
        <int, int>{}; // lower index => more recent (since list is desc)
    final modeCache = <int, Mode>{};

    for (var i = 0; i < outputs.length; i++) {
      final o = outputs[i];
      await o.mode.load();
      final m = o.mode.value;
      final id = m?.id;
      if (m == null || id == null) continue;
      freq.update(id, (v) => v + 1, ifAbsent: () => 1);
      // Only set latest occurrence if not already present (first seen is most recent)
      latestOccurrenceIndex.putIfAbsent(id, () => i);
      modeCache.putIfAbsent(id, () => m);
    }

    if (freq.isEmpty) return null;

    // Determine max frequency
    final maxFreq = freq.values.reduce((a, b) => a > b ? a : b);
    // Among those with max frequency, pick the one with smallest index (most recent)
    int? winningId;
    int? winningIndex;
    freq.forEach((id, count) {
      if (count == maxFreq) {
        final idx = latestOccurrenceIndex[id]!;
        if (winningIndex == null || idx < winningIndex!) {
          winningId = id;
          winningIndex = idx;
        }
      }
    });
    return winningId != null ? modeCache[winningId] : null;
  }
}

/// Riverpod provider for the repository
@Riverpod(keepAlive: true)
ModeOutputsRepository modeOutputsRepository(Ref ref) {
  final isar = ref.watch(isarProvider);
  return ModeOutputsRepository(isar);
}
