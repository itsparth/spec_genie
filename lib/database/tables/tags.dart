import 'package:drift/drift.dart';

@DataClassName('TagRow')
class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  BoolColumn get isEditable => boolean().withDefault(const Constant(true))();
}
