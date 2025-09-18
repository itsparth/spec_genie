import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'database.dart';

part 'drift_database_provider.g.dart';

@riverpod
AppDatabase driftDatabase(Ref ref) {
  // In future: dispose / close logic
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
}
