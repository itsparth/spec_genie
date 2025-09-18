import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../database.dart';
import '../drift_database_provider.dart';
import 'base_repository.dart';

part 'configuration_repository.g.dart';

class ConfigurationRepository
    extends BaseRepository<$ConfigurationTableTable, ConfigurationTableData> {
  ConfigurationRepository(super.db);

  Future<ConfigurationTableData?> getFirst() async {
    final adb = db as AppDatabase;
    return await adb.select(adb.configurationTable).getSingleOrNull();
  }
}

@riverpod
ConfigurationRepository configurationRepository(Ref ref) {
  final db = ref.watch(driftDatabaseProvider);
  return ConfigurationRepository(db);
}
