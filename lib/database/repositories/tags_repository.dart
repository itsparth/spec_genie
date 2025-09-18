import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../database.dart';
import '../drift_database_provider.dart';
import 'base_repository.dart';

part 'tags_repository.g.dart';

class TagsRepository extends BaseRepository<$TagsTable, TagRow> {
  TagsRepository(super.db);

  Stream<List<TagRow>> watchAll() {
    final adb = db as AppDatabase;
    return (adb.select(adb.tags)).watch();
  }
}

@riverpod
TagsRepository tagsRepository(Ref ref) {
  final db = ref.watch(driftDatabaseProvider);
  return TagsRepository(db);
}
