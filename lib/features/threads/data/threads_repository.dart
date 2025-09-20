import 'package:isar_community/isar.dart';
import '../models/thread.dart';
import '../../chat/models/message.dart';
import '../../mode_output/models/mode_output.dart';

/// Repository responsible for all Isar database access for Threads.
/// This isolates persistence logic from state management (bloc/provider).
class ThreadsRepository {
  ThreadsRepository(this._isar);

  final Isar _isar;

  /// Returns all threads (sync) sorted by creation date descending.
  List<Thread> getAllThreadsSync() =>
      _isar.threads.where().sortByCreatedAtDesc().findAllSync();

  /// Watches all threads (sorted desc) and emits on any change.
  Stream<List<Thread>> watchAllThreads() =>
      _isar.threads.where().sortByCreatedAtDesc().watch(fireImmediately: true);

  /// Adds a new thread and returns the saved entity (with id assigned).
  Future<Thread> addThread(String name) async {
    final newThread = Thread(
      name: name,
      createdAt: DateTime.now(),
    );

    late Thread savedThread;
    await _isar.writeTxn(() async {
      final id = await _isar.threads.put(newThread);
      savedThread = (await _isar.threads.get(id))!;
    });
    return savedThread;
  }

  /// Updates an existing thread. Returns the updated thread or null if missing.
  Future<Thread?> updateThread(int id, String name) async {
    final existing = _isar.threads.getSync(id);
    if (existing == null) return null;

    final updated = Thread(
      id: existing.id,
      name: name,
      createdAt: existing.createdAt,
    );

    await _isar.writeTxn(() async {
      await _isar.threads.put(updated);
    });
    return updated;
  }

  /// Deletes a thread by id.
  Future<void> deleteThread(int id) async {
    await _isar.writeTxn(() async {
      await _isar.threads.delete(id);
    });
  }

  /// Cascades deletion: deletes all messages and mode outputs referencing the thread, then the thread.
  Future<void> deleteThreadCascade(int id) async {
    await _isar.writeTxn(() async {
      // Collect message ids linked to this thread
      final messageIds = await _isar.messages
          .where()
          .filter()
          .thread((q) => q.idEqualTo(id))
          .idProperty()
          .findAll();
      if (messageIds.isNotEmpty) {
        await _isar.messages.deleteAll(messageIds);
      }

      // Collect mode output ids linked to this thread
      final modeOutputIds = await _isar.modeOutputs
          .where()
          .filter()
          .thread((q) => q.idEqualTo(id))
          .idProperty()
          .findAll();
      if (modeOutputIds.isNotEmpty) {
        await _isar.modeOutputs.deleteAll(modeOutputIds);
      }

      // Finally delete the thread itself
      await _isar.threads.delete(id);
    });
  }
}
