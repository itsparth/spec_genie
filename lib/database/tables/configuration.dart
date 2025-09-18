import 'package:drift/drift.dart';

class ConfigurationTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get apiKey => text().withDefault(const Constant(''))();
  TextColumn get baseUrl => text().nullable()();
  TextColumn get modelName => text()();
}
