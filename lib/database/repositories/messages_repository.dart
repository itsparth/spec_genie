import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart';
import '../database.dart';
import '../drift_database_provider.dart';
import 'base_repository.dart';

part 'messages_repository.g.dart';

class MessagesRepository extends BaseRepository<$MessagesTable, MessageRow> {
  MessagesRepository(super.db);

  Future<int> addMessage({
    required int threadId,
    required String body,
    required String messageType,
    DateTime? timestamp,
    String description = '',
    String? mimeType,
    String? transcript,
    String? fileName,
    Uint8List? fileData,
  }) async {
    final adb = db as AppDatabase;
    return await adb.into(adb.messages).insert(MessagesCompanion.insert(
          threadId: threadId,
          timestamp: timestamp ?? DateTime.now(),
          messageType: messageType,
          body: Value(body),
          description: Value(description),
          mimeType: Value(mimeType),
          transcript: Value(transcript),
          fileName: Value(fileName),
          fileData: Value(fileData),
        ));
  }

  Stream<List<MessageRow>> watchForThread(int threadId) {
    final adb = db as AppDatabase;
    final query = (adb.select(adb.messages)
      ..where((m) => m.threadId.equals(threadId))
      ..orderBy([
        (m) => OrderingTerm(expression: m.timestamp, mode: OrderingMode.asc)
      ]));
    return query.watch();
  }

  Future<void> deleteMessage(int id) async {
    final adb = db as AppDatabase;
    await (adb.delete(adb.messages)..where((m) => m.id.equals(id))).go();
  }
}

@riverpod
MessagesRepository messagesRepository(Ref ref) {
  final db = ref.watch(driftDatabaseProvider);
  return MessagesRepository(db);
}
