import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart';
import '../database.dart';
import '../drift_database_provider.dart';
import 'base_repository.dart';

part 'threads_repository.g.dart';

class ThreadsRepository extends BaseRepository<$ThreadsTable, ThreadRow> {
  ThreadsRepository(super.db);

  Future<int> createThread(
      {required String name, required DateTime createdAt}) async {
    final adb = db as AppDatabase;
    return await adb.into(adb.threads).insert(
          ThreadsCompanion.insert(createdAt: createdAt, name: Value(name)),
        );
  }

  Stream<List<ThreadRow>> watchAll() {
    final adb = db as AppDatabase;
    return (adb.select(adb.threads)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Future<void> rename(int id, String newName) async {
    final adb = db as AppDatabase;
    await (adb.update(adb.threads)..where((tbl) => tbl.id.equals(id)))
        .write(ThreadsCompanion(name: Value(newName)));
  }

  Future<void> delete(int id) async {
    final adb = db as AppDatabase;
    await (adb.delete(adb.threads)..where((tbl) => tbl.id.equals(id))).go();
  }
}

@riverpod
ThreadsRepository threadsRepository(Ref ref) {
  final db = ref.watch(driftDatabaseProvider);
  return ThreadsRepository(db);
}
