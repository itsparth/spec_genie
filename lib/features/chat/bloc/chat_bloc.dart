import 'dart:async';
import 'dart:typed_data';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:drift/drift.dart' show Value, OrderingTerm, innerJoin;
import 'package:spec_genie/database/database.dart';
import 'package:spec_genie/database/repositories/messages_repository.dart';
import 'package:spec_genie/database/repositories/threads_repository.dart';
import 'package:spec_genie/database/drift_database_provider.dart';
import 'chat_state.dart';
import 'message_state.dart';

part 'chat_bloc.g.dart';

/// Manages chat messages for a specific thread backed by Drift
@riverpod
class ChatBloc extends _$ChatBloc {
  StreamSubscription<List<MessageRow>>? _sub;

  @override
  ChatState build(int? threadId) {
    if (threadId != null) {
      _listen(threadId);
    }
    ref.onDispose(() => _sub?.cancel());
    return ChatState(threadId: threadId, isLoading: threadId != null);
  }

  void _listen(int threadId) {
    _sub?.cancel();
    final repo = ref.read(messagesRepositoryProvider);
    _sub = repo.watchForThread(threadId).listen((rows) {
      final list =
          rows.map((r) => MessageState(message: r, isSaving: false)).toIList();
      state = state.copyWith(messages: list, isLoading: false);
    });
  }

  /// Returns a stream of messages with their associated tag rows using a join.
  Stream<List<MessageWithTags>> watchMessagesWithTags(int threadId) {
    final db = ref.read(driftDatabaseProvider);
    final messages = db.select(db.messages)
      ..where((m) => m.threadId.equals(threadId))
      ..orderBy([(m) => OrderingTerm.desc(m.id)]);

    return messages.watch().asyncMap((messageRows) async {
      if (messageRows.isEmpty) return <MessageWithTags>[];
      final ids = messageRows.map((m) => m.id).toList();
      final joinQuery = await (db.select(db.messageTags).join([
        innerJoin(db.tags, db.tags.id.equalsExp(db.messageTags.tagId)),
      ])
            ..where(db.messageTags.messageId.isIn(ids)))
          .get();

      final map = <int, List<TagRow>>{};
      for (final row in joinQuery) {
        final tag = row.readTable(db.tags);
        final mt = row.readTable(db.messageTags);
        map.putIfAbsent(mt.messageId, () => []).add(tag);
      }
      return messageRows
          .map((m) => MessageWithTags(message: m, tags: map[m.id] ?? const []))
          .toList();
    });
  }

  /// Replace tags on a message with provided tag ids
  Future<void> updateMessageTags(int messageId, List<int> tagIds) async {
    final db = ref.read(driftDatabaseProvider);
    await db.transaction(() async {
      // Clear existing
      await (db.delete(db.messageTags)
            ..where((tbl) => tbl.messageId.equals(messageId)))
          .go();
      // Insert new
      for (final id in tagIds.toSet()) {
        await db.into(db.messageTags).insertOnConflictUpdate(
              MessageTagsCompanion.insert(messageId: messageId, tagId: id),
            );
      }
    });
  }

  Future<int> createThread(String threadName) async {
    final repo = ref.read(threadsRepositoryProvider);
    final id =
        await repo.createThread(name: threadName, createdAt: DateTime.now());
    state = state.copyWith(threadId: id);
    _listen(id);
    return id;
  }

  Future<void> addMessage({
    required String body,
    required String messageType,
    String description = '',
    String? mimeType,
    String? transcript,
    String? fileName,
    Uint8List? fileData,
    String? threadName,
  }) async {
    if (state.threadId == null) {
      final generated = threadName ?? _generateThreadName(body);
      await createThread(generated);
    }
    final repo = ref.read(messagesRepositoryProvider);
    await repo.addMessage(
      threadId: state.threadId!,
      body: body,
      messageType: messageType,
      description: description,
      mimeType: mimeType,
      transcript: transcript,
      fileName: fileName,
      fileData: fileData,
    );
  }

  String _generateThreadName(String body) {
    if (body.isNotEmpty) {
      return body.length <= 50 ? body : '${body.substring(0, 47)}...';
    }
    return 'New Thread';
  }

  Future<bool> updateMessageDescription(
      int messageId, String description) async {
    try {
      final adb = ref.read(driftDatabaseProvider);
      await (adb.update(adb.messages)..where((m) => m.id.equals(messageId)))
          .write(
        MessagesCompanion(description: Value(description)),
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> removeMessage(int messageId) async {
    try {
      final repo = ref.read(messagesRepositoryProvider);
      await repo.deleteMessage(messageId);
      return true;
    } catch (_) {
      return false;
    }
  }
}

/// Convenience view model combining a message row with its associated tags.
class MessageWithTags {
  final MessageRow message;
  final List<TagRow> tags;
  const MessageWithTags({required this.message, required this.tags});
}
