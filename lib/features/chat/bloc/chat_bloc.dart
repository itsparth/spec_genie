import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';
import 'package:flutter_riverpod/misc.dart';
import 'package:isar_community/isar.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/shared/isar/isar_provider.dart';
import 'package:spec_genie/features/threads/bloc/threads_bloc.dart';
import 'package:spec_genie/features/shared/openai/openai_provider.dart';
import 'package:spec_genie/features/shared/openai/content_parts.dart';
import 'package:spec_genie/features/threads/models/thread.dart';

import '../models/message.dart';
import '../models/chat_state.dart';
import 'message_bloc.dart';

part 'chat_bloc.g.dart';

/// Manages chat messages for a specific thread
@riverpod
class ChatBloc extends _$ChatBloc {
  KeepAliveLink?
      _keepAliveLink; // still allow temporary keep alive during title generation
  Timer? _disposeTimer;
  bool _generatingTitle = false;

  @override
  ChatState build(int? threadId) {
    // Acquire keepAlive only when needed later (lazy)
    ref.onDispose(() {
      _disposeTimer?.cancel();
      _keepAliveLink?.close();
    });
    if (threadId != null) {
      _loadMessages(threadId);
    }
    return ChatState(threadId: threadId, isLoading: threadId != null);
  }

  void _scheduleAutoDispose() {
    if (_generatingTitle) return; // keep alive while generating title
    _disposeTimer?.cancel();
    _disposeTimer = Timer(const Duration(seconds: 30), () {
      if (!ref.mounted) return;
      if (_generatingTitle) return;
      // _keepAliveLink?.close(); // Uncomment if you want auto-dispose
    });
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

      // If thread still has placeholder name and we have messages, attempt title generation
      final thread = await isar.threads.get(threadId);
      if (thread != null &&
          thread.name.trim() == 'New Thread' &&
          messages.isNotEmpty) {
        _generateThreadTitle();
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  /// Add a new message to the chat, creating a thread if none exists.
  /// The thread title will be generated asynchronously after the first message is saved.
  Future<void> addMessage(Message message) async {
    bool createdNewThread = false;
    if (state.threadId == null) {
      // Temporary placeholder name until we generate one
      final placeholderName = _generateThreadName(message);
      final newThreadId = await createThread(placeholderName);
      state = state.copyWith(threadId: newThreadId);
      createdNewThread = true;
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

      // Generate a better title if this is a newly created thread
      if (createdNewThread) {
        _generateThreadTitle();
      } else {
        _scheduleAutoDispose();
      }
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

  /// Generate and update the thread title (3-4 word concise title) using OpenAI.
  Future<void> _generateThreadTitle() async {
    final threadId = state.threadId;
    if (threadId == null) return;
    try {
      _generatingTitle = true;
      _keepAliveLink ??= ref.keepAlive();
      final messages = state.messages;
      if (messages.isEmpty) return;
      // Use first one or two messages for context
      final sample = messages.take(2).toList();
      final parts = <ContentPart>[];
      for (final m in sample) {
        switch (m.type) {
          case MessageType.text:
            if (m.text.isNotEmpty) parts.add(TextPart(m.text));
            break;
          case MessageType.audio:
            if (m.transcript != null && m.transcript!.isNotEmpty) {
              parts.add(TextPart('Audio: ${m.transcript!}'));
            } else if (m.description.isNotEmpty) {
              parts.add(TextPart('Audio summary: ${m.description}'));
            }
            break;
          case MessageType.image:
            // For image, rely on description if available
            if (m.description.isNotEmpty) {
              parts.add(TextPart('Image: ${m.description}'));
            }
            break;
        }
      }
      if (parts.isEmpty) return;
      final openAI = ref.read(openAIUtilProvider);
      final title = await openAI.generateTitle(parts);
      if (title.trim().isEmpty) return;
      // Update thread name
      await ref
          .read(threadsBlocProvider.notifier)
          .updateThread(threadId, title.trim());
    } catch (_) {
      // Silently ignore failures; placeholder thread name remains.
    } finally {
      _generatingTitle = false;
      _scheduleAutoDispose();
    }
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
