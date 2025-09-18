import 'package:drift/drift.dart';
import 'messages.dart';
import 'tags.dart';

// Junction table for many-to-many Message <-> Tag
class MessageTags extends Table {
  IntColumn get messageId =>
      integer().references(Messages, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId =>
      integer().references(Tags, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {messageId, tagId};
}
