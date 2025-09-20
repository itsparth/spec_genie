import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';
import 'package:isar_community/isar.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/shared/isar/isar_provider.dart';
import 'package:spec_genie/features/threads/bloc/threads_bloc.dart';
import 'package:spec_genie/features/threads/models/thread.dart';

import '../models/message.dart';
import '../models/chat_state.dart';
import 'message_bloc.dart';

part 'chat_bloc.g.dart';

/// Manages chat messages for a specific thread
@riverpod
class ChatBloc extends _$ChatBloc {
  @override
  ChatState build(int? threadId) {
    if (threadId != null) {
      _loadMessages(threadId);
    }
    return ChatState(threadId: threadId, isLoading: threadId != null);
  }

  /// Create a new thread with the given name
  Future<int> createThread(String threadName) async {
    final threadsBloc = ref.read(threadsBlocProvider.notifier);
    final newThread = await threadsBloc.addThread(threadName);

    // Update our state with the new thread ID
    state = state.copyWith(threadId: newThread.id);

    return newThread.id;
  }

  /// Load messages for the thread
  Future<void> _loadMessages(int threadId) async {
    try {
      final isar = ref.read(isarProvider);
      // Query messages for the thread. Adjust predicate to your generated schema if needed.
      final messages = await isar.messages
          .filter()
          .thread((q) => q.idEqualTo(threadId))
          .sortByTimestamp()
          .findAll();

      state = state.copyWith(
        messages: messages.toIList(),
        isLoading: false,
      );

      // Kick off processing for messages needing work (handled by MessageBloc)
      for (final m in messages) {
        if ((m.type == MessageType.audio &&
                (m.transcript == null || m.transcript!.isEmpty)) ||
            m.description.isEmpty) {
          ref.read(messageBlocProvider(m.id).notifier).process();
        }
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  /// Add a new message to the chat, creating a thread if none exists.
  /// The thread title will be generated asynchronously after the first message is saved.
  Future<void> addMessage(Message message) async {
    if (state.threadId == null) {
      // Use generated placeholder name if none present yet
      final placeholderName = _generateThreadName(message);
      final newThreadId = await createThread(placeholderName);
      state = state.copyWith(threadId: newThreadId);
    }
    final isar = ref.read(isarProvider);
    final thread = await isar.threads.get(state.threadId!);
    message.thread.value = thread;

    try {
      late Message saved;
      await isar.writeTxn(() async {
        final id = await isar.messages.put(message);
        await message.thread.save();
        await message.tags.save();
        saved = (await isar.messages.get(id))!;
      });

      state = state.copyWith(messages: state.messages.add(saved));
      ref.read(messageBlocProvider(saved.id).notifier).process();
    } catch (e) {
      rethrow;
    }
  }

  /// Generate a thread name from a message
  String _generateThreadName(Message message) {
    final text = message.text;
    if (text.isNotEmpty) {
      return text.length <= 50 ? text : '${text.substring(0, 47)}...';
    }
    return 'New Thread';
  }

  // Message-specific update operations have moved to MessageBloc.

  /// Remove a message from the chat
  Future<bool> removeMessage(int messageId) async {
    try {
      final isar = ref.read(isarProvider);
      final deleted = await isar.writeTxn(() async {
        return await isar.messages.delete(messageId);
      });

      if (deleted) {
        final updated =
            state.messages.where((m) => m.id != messageId).toIList();
        state = state.copyWith(messages: updated);
      }

      return deleted;
    } catch (e) {
      rethrow;
    }
  }
}
