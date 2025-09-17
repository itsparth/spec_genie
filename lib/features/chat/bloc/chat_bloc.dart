import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../models/message.dart';
import '../../tags/models/tag.dart';
import '../../shared/isar_provider.dart';
import 'chat_state.dart';

part 'chat_bloc.g.dart';

/// Manages chat messages for a specific thread
@riverpod
class ChatBloc extends _$ChatBloc {
  @override
  ChatState build(int threadId) {
    _loadMessages(threadId);
    return const ChatState(isLoading: true);
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
      
      state = state.copyWith(
        messages: messages.toIList(),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  /// Add a new message to the chat
  Future<void> addMessage(Message message) async {
    state = state.copyWith(isSaving: true);
    
    try {
      final isar = ref.read(isarProvider);
      await isar.writeTxn(() async {
        await isar.messages.put(message);
        await message.thread.save();
        await message.tags.save();
      });
      
      final updated = state.messages.add(message);
      state = state.copyWith(messages: updated, isSaving: false);
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
  }

  /// Add a tag to a message
  Future<bool> addMessageTag(int messageId, int tagId) async {
    state = state.copyWith(isSaving: true);
    
    try {
      final isar = ref.read(isarProvider);
      final message = await isar.messages.get(messageId);
      final tag = await isar.tags.get(tagId);
      
      if (message == null || tag == null) return false;

      await isar.writeTxn(() async {
        message.tags.add(tag);
        await message.tags.save();
      });

      final idx = state.messages.indexWhere((m) => m.id == messageId);
      if (idx >= 0) {
        final updated = state.messages.replace(idx, message);
        state = state.copyWith(messages: updated, isSaving: false);
      }
      
      return true;
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
  }

  /// Remove a tag from a message
  Future<bool> removeMessageTag(int messageId, int tagId) async {
    state = state.copyWith(isSaving: true);
    
    try {
      final isar = ref.read(isarProvider);
      final message = await isar.messages.get(messageId);
      
      if (message == null) return false;

      await isar.writeTxn(() async {
        message.tags.removeWhere((tag) => tag.id == tagId);
        await message.tags.save();
      });

      final idx = state.messages.indexWhere((m) => m.id == messageId);
      if (idx >= 0) {
        final updated = state.messages.replace(idx, message);
        state = state.copyWith(messages: updated, isSaving: false);
      }
      
      return true;
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
  }

  /// Remove a message from the chat
  Future<bool> removeMessage(int messageId) async {
    state = state.copyWith(isSaving: true);
    
    try {
      final isar = ref.read(isarProvider);
      final deleted = await isar.writeTxn(() async {
        return await isar.messages.delete(messageId);
      });
      
      if (deleted) {
        final updated = state.messages.where((m) => m.id != messageId).toIList();
        state = state.copyWith(messages: updated, isSaving: false);
      }
      
      return deleted;
    } finally {
      if (state.isSaving) {
        state = state.copyWith(isSaving: false);
      }
    }
  }
}