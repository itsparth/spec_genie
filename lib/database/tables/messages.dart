import 'package:drift/drift.dart';
import 'threads.dart';

@DataClassName('MessageRow')
class Messages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get threadId =>
      integer().references(Threads, #id, onDelete: KeyAction.cascade)();
  // Column previously named 'text'; renamed to 'body' to prevent shadowing the text() builder
  TextColumn get body => text().withDefault(const Constant(''))();
  DateTimeColumn get timestamp => dateTime()();
  // Renamed from 'type' to 'messageType' to avoid analyzer bug in drift parser
  TextColumn get messageType =>
      text()(); // TODO: Add CHECK constraint migration
  TextColumn get description => text().withDefault(const Constant(''))();
  BlobColumn get fileData => blob().nullable()(); // Uint8List in generated row
  TextColumn get mimeType => text().nullable()();
  TextColumn get transcript => text().nullable()();
  TextColumn get fileName => text().nullable()();
}
