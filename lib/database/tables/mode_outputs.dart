import 'package:drift/drift.dart';
import 'threads.dart';
import 'modes.dart';

@DataClassName('ModeOutputRow')
class ModeOutputs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get threadId =>
      integer().references(Threads, #id, onDelete: KeyAction.cascade)();
  IntColumn get modeId =>
      integer().references(Modes, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get content => text()();
}
