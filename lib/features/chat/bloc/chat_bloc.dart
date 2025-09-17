import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/shared/isar/isar_provider.dart';
import 'package:spec_genie/features/threads/models/thread.dart';
import 'package:spec_genie/features/threads/bloc/threads_bloc.dart';

import '../models/message.dart';
import '../../tags/models/tag.dart';
import 'chat_state.dart';
import 'message_state.dart';

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
      final messages = await isar.messages
          .filter()
          .thread((q) => q.idEqualTo(threadId))
          .sortByTimestamp()
          .findAll();

      final messageStates =
          messages.map((message) => MessageState(message: message)).toIList();

      state = state.copyWith(
        messages: messageStates,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  /// Add a new message to the chat, creating a thread if none exists
  Future<void> addMessage(Message message, {String? threadName}) async {
    // If no thread exists, create one first
    if (state.threadId == null) {
      final name = threadName ?? _generateThreadName(message);
      final newThreadId = await createThread(name);

      // Link the message to the new thread
      final isar = ref.read(isarProvider);
      final thread = await isar.threads.get(newThreadId);
      if (thread != null) {
        message.thread.value = thread;
      }
    }

    final newMessageState = MessageState(message: message, isSaving: true);
    final updated = state.messages.add(newMessageState);
    state = state.copyWith(messages: updated);

    try {
      final isar = ref.read(isarProvider);
      await isar.writeTxn(() async {
        await isar.messages.put(message);
        await message.thread.save();
        await message.tags.save();
      });

      final idx = state.messages.length - 1;
      final savedMessageState = newMessageState.copyWith(isSaving: false);
      final finalUpdated = state.messages.replace(idx, savedMessageState);
      state = state.copyWith(messages: finalUpdated);
    } catch (e) {
      // Remove the message on error
      final errorUpdated = state.messages.removeLast();
      state = state.copyWith(messages: errorUpdated);
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

  /// Add a tag to a message
  Future<bool> addMessageTag(int messageId, int tagId) async {
    final idx = state.messages.indexWhere((m) => m.message.id == messageId);
    if (idx == -1) return false;

    final currentMessageState = state.messages[idx];
    final updatedMessageState = currentMessageState.copyWith(isSaving: true);
    final tempUpdated = state.messages.replace(idx, updatedMessageState);
    state = state.copyWith(messages: tempUpdated);

    try {
      final isar = ref.read(isarProvider);
      final message = await isar.messages.get(messageId);
      final tag = await isar.tags.get(tagId);

      if (message == null || tag == null) {
        final errorMessageState = updatedMessageState.copyWith(isSaving: false);
        final errorUpdated = state.messages.replace(idx, errorMessageState);
        state = state.copyWith(messages: errorUpdated);
        return false;
      }

      await isar.writeTxn(() async {
        message.tags.add(tag);
        await message.tags.save();
      });

      final finalMessageState = MessageState(message: message, isSaving: false);
      final finalUpdated = state.messages.replace(idx, finalMessageState);
      state = state.copyWith(messages: finalUpdated);

      return true;
    } catch (e) {
      final errorMessageState = updatedMessageState.copyWith(isSaving: false);
      final errorUpdated = state.messages.replace(idx, errorMessageState);
      state = state.copyWith(messages: errorUpdated);
      rethrow;
    }
  }

  /// Remove a tag from a message
  Future<bool> removeMessageTag(int messageId, int tagId) async {
    final idx = state.messages.indexWhere((m) => m.message.id == messageId);
    if (idx == -1) return false;

    final currentMessageState = state.messages[idx];
    final updatedMessageState = currentMessageState.copyWith(isSaving: true);
    final tempUpdated = state.messages.replace(idx, updatedMessageState);
    state = state.copyWith(messages: tempUpdated);

    try {
      final isar = ref.read(isarProvider);
      final message = await isar.messages.get(messageId);

      if (message == null) {
        final errorMessageState = updatedMessageState.copyWith(isSaving: false);
        final errorUpdated = state.messages.replace(idx, errorMessageState);
        state = state.copyWith(messages: errorUpdated);
        return false;
      }

      await isar.writeTxn(() async {
        message.tags.removeWhere((tag) => tag.id == tagId);
        await message.tags.save();
      });

      final finalMessageState = MessageState(message: message, isSaving: false);
      final finalUpdated = state.messages.replace(idx, finalMessageState);
      state = state.copyWith(messages: finalUpdated);

      return true;
    } catch (e) {
      final errorMessageState = updatedMessageState.copyWith(isSaving: false);
      final errorUpdated = state.messages.replace(idx, errorMessageState);
      state = state.copyWith(messages: errorUpdated);
      rethrow;
    }
  }

  /// Remove a message from the chat
  Future<bool> removeMessage(int messageId) async {
    try {
      final isar = ref.read(isarProvider);
      final deleted = await isar.writeTxn(() async {
        return await isar.messages.delete(messageId);
      });

      if (deleted) {
        final updated =
            state.messages.where((m) => m.message.id != messageId).toIList();
        state = state.copyWith(messages: updated);
      }

      return deleted;
    } catch (e) {
      rethrow;
    }
  }
}
