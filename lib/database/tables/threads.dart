import 'package:drift/drift.dart';

@DataClassName('ThreadRow')

/// Threads table (chat conversation roots)
class Threads extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withDefault(const Constant(''))();

  /// Stored as ISO-8601 string underneath (build.yaml) but surfaced as DateTime
  DateTimeColumn get createdAt => dateTime()();
}
