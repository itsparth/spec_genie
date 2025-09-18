import 'package:drift/drift.dart';

/// Minimal abstraction for common CRUD helpers.
/// Keeps surface small while we transition from Isar.
abstract class BaseRepository<TTable extends Table, TData> {
  final GeneratedDatabase db;
  BaseRepository(this.db);
}
