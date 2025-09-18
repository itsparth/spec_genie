import 'package:drift/drift.dart';

@DataClassName('ModeRow')
class Modes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get prompt => text()();
  BoolColumn get isEditable => boolean().withDefault(const Constant(true))();
}
