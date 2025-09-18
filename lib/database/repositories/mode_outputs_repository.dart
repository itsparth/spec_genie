import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart';
import '../database.dart';
import '../drift_database_provider.dart';
import 'base_repository.dart';

part 'mode_outputs_repository.g.dart';

class ModeOutputsRepository
    extends BaseRepository<$ModeOutputsTable, ModeOutputRow> {
  ModeOutputsRepository(super.db);

  Stream<List<ModeOutputRow>> watchForThread(int threadId) {
    final adb = db as AppDatabase;
    final q = (adb.select(adb.modeOutputs)
      ..where((m) => m.threadId.equals(threadId))
      ..orderBy([
        (m) => OrderingTerm(expression: m.createdAt, mode: OrderingMode.desc)
      ]));
    return q.watch();
  }
}

@riverpod
ModeOutputsRepository modeOutputsRepository(Ref ref) {
  final db = ref.watch(driftDatabaseProvider);
  return ModeOutputsRepository(db);
}
