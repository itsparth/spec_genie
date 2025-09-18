import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../database.dart';
import '../drift_database_provider.dart';
import 'base_repository.dart';

part 'modes_repository.g.dart';

class ModesRepository extends BaseRepository<$ModesTable, ModeRow> {
  ModesRepository(super.db);

  Stream<List<ModeRow>> watchAll() {
    final adb = db as AppDatabase;
    return (adb.select(adb.modes)).watch();
  }
}

@riverpod
ModesRepository modesRepository(Ref ref) {
  final db = ref.watch(driftDatabaseProvider);
  return ModesRepository(db);
}
