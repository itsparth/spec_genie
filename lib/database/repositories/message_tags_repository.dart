import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../database.dart';
import '../drift_database_provider.dart';
import 'base_repository.dart';

part 'message_tags_repository.g.dart';

class MessageTagsRepository
    extends BaseRepository<$MessageTagsTable, MessageTag> {
  MessageTagsRepository(super.db);

  Future<void> attachTag({required int messageId, required int tagId}) async {
    final adb = db as AppDatabase;
    await adb.into(adb.messageTags).insertOnConflictUpdate(
          MessageTagsCompanion.insert(messageId: messageId, tagId: tagId),
        );
  }
}

@riverpod
MessageTagsRepository messageTagsRepository(Ref ref) {
  final db = ref.watch(driftDatabaseProvider);
  return MessageTagsRepository(db);
}
