import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:spec_genie/features/shared/isar/isar_provider.dart';
import 'package:spec_genie/features/threads/models/thread.dart';
import 'package:spec_genie/features/threads/bloc/threads_bloc.dart';
import 'package:spec_genie/features/shared/openai/openai_provider.dart';
import 'package:spec_genie/features/shared/openai/content_parts.dart';
import 'dart:typed_data';

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

      // Process audio messages without transcripts
      await _processAudioMessagesWithoutTranscripts();

      // Process messages without descriptions
      await _processMessagesWithoutDescriptions();
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  /// Process audio messages that don't have transcripts
  Future<void> _processAudioMessagesWithoutTranscripts() async {
    final audioMessagesWithoutTranscripts = state.messages
        .where((msgState) =>
            msgState.message.type == MessageType.audio &&
            (msgState.message.transcript == null ||
                msgState.message.transcript!.isEmpty))
        .toList();

    for (final msgState in audioMessagesWithoutTranscripts) {
      await _transcribeAudioMessage(msgState.message.id);
    }
  }

  /// Transcribe audio message and update state
  Future<void> _transcribeAudioMessage(int messageId) async {
    final idx = state.messages.indexWhere((m) => m.message.id == messageId);
    if (idx == -1) return;

    final currentMessageState = state.messages[idx];
    final message = currentMessageState.message;

    // Check if message is audio and has no transcript
    if (message.type != MessageType.audio ||
        message.fileData == null ||
        (message.transcript != null && message.transcript!.isNotEmpty)) {
      return;
    }

    // Set processing state
    final processingMessageState =
        currentMessageState.copyWith(isProcessing: true);
    final tempUpdated = state.messages.replace(idx, processingMessageState);
    state = state.copyWith(messages: tempUpdated);

    try {
      // Get OpenAI utility
      final openAIUtil = ref.watch(openAIUtilProvider);

      // Convert file data to AudioPart for transcription
      final audioPart = AudioPart(
        Uint8List.fromList(message.fileData!),
        message.mimeType ?? 'audio/wav',
      );

      // Transcribe audio
      final transcript = await openAIUtil.transcribeAudio(audioPart);

      // Update message with transcript
      var updatedMessage = message.copyWith(transcript: transcript);

      // Generate description if not provided (after transcription for audio)
      if (updatedMessage.description.isEmpty) {
        print("generatiign121");
        // Keep processing state during description generation
        updatedMessage = await _generateMessageDescription(updatedMessage);
      }

      // Save both transcript and description to database
      final isar = ref.read(isarProvider);
      await isar.writeTxn(() async {
        await isar.messages.put(updatedMessage);
      });

      // Update state with transcribed message
      final finalMessageState = MessageState(
        message: updatedMessage,
        isProcessing: false,
      );
      final finalUpdated = state.messages.replace(idx, finalMessageState);
      state = state.copyWith(messages: finalUpdated);
    } catch (e) {
      // Handle error
      final errorMessageState = processingMessageState.copyWith(
        isProcessing: false,
        error: 'Failed to process audio: ${e.toString()}',
      );
      final errorUpdated = state.messages.replace(idx, errorMessageState);
      state = state.copyWith(messages: errorUpdated);
      rethrow;
    }
  }

  /// Generate description for message if it doesn't have one
  Future<Message> _generateMessageDescription(Message message) async {
    print("generatiign125");
    if (message.description.isNotEmpty) return message;

    try {
      final openAIUtil = ref.watch(openAIUtilProvider);
      final contentParts = <ContentPart>[];

      // Add content based on message type
      switch (message.type) {
        case MessageType.text:
          if (message.text.isNotEmpty) {
            contentParts.add(TextPart(message.text));
          }
          break;
        case MessageType.audio:
          if (message.transcript != null && message.transcript!.isNotEmpty) {
            contentParts
                .add(TextPart('Audio transcript: ${message.transcript!}'));
          }
          break;
        case MessageType.image:
          if (message.fileData != null) {
            final imageBytes = Uint8List.fromList(message.fileData!);
            final mimeType = message.mimeType ?? 'image/jpeg';
            contentParts.add(ImagePart(imageBytes, mimeType));
          }
          break;
      }

      // Generate description if we have content
      if (contentParts.isNotEmpty) {
        final description = await openAIUtil.generateDescription(contentParts);
        return message.copyWith(description: description.trim());
      }

      return message;
    } catch (e) {
      // If description generation fails, return original message
      return message;
    }
  }

  /// Process messages without descriptions and generate them
  Future<void> _processMessagesWithoutDescriptions() async {
    final messagesWithoutDescriptions = state.messages
        .where((msgState) => msgState.message.description.isEmpty)
        .toList();

    for (final msgState in messagesWithoutDescriptions) {
      print("generatiign123");
      await _generateDescriptionForMessage(msgState.message.id);
    }
  }

  /// Generate description for a specific message by ID
  Future<void> _generateDescriptionForMessage(int messageId) async {
    final idx = state.messages.indexWhere((m) => m.message.id == messageId);
    if (idx == -1) return;

    final currentMessageState = state.messages[idx];
    final message = currentMessageState.message;

    // Skip if already has description or is currently processing
    if (message.description.isNotEmpty || currentMessageState.isProcessing) {
      return;
    }

    // Set processing state
    final processingMessageState =
        currentMessageState.copyWith(isProcessing: true);
    final tempUpdated = state.messages.replace(idx, processingMessageState);
    state = state.copyWith(messages: tempUpdated);

    try {
      // Generate description
      final updatedMessage = await _generateMessageDescription(message);

      // Save to database if description was generated
      if (updatedMessage.description != message.description) {
        final isar = ref.read(isarProvider);
        await isar.writeTxn(() async {
          await isar.messages.put(updatedMessage);
        });
      }

      // Update state
      final finalMessageState = MessageState(
        message: updatedMessage,
        isProcessing: false,
      );
      final finalUpdated = state.messages.replace(idx, finalMessageState);
      state = state.copyWith(messages: finalUpdated);
    } catch (e) {
      // Handle error - just stop processing
      final errorMessageState = processingMessageState.copyWith(
        isProcessing: false,
      );
      final errorUpdated = state.messages.replace(idx, errorMessageState);
      state = state.copyWith(messages: errorUpdated);
    }
  }

  /// Add a new message to the chat, creating a thread if none exists
  Future<void> addMessage(Message message, {String? threadName}) async {
    // If no thread exists, create one first
    if (state.threadId == null) {
      final name = threadName ?? _generateThreadName(message);
      final newThreadId = await createThread(name);
      state = state.copyWith(threadId: newThreadId);
    }
    final isar = ref.read(isarProvider);
    final thread = await isar.threads.get(state.threadId!);
    message.thread.value = thread;

    // Determine if this is an audio message that needs transcription
    final needsTranscription = message.type == MessageType.audio &&
        message.fileData != null &&
        (message.transcript == null || message.transcript!.isEmpty);

    // Determine if message needs description (for non-audio messages)
    final needsDescription = message.description.isEmpty && !needsTranscription;

    final newMessageState = MessageState(
      message: message,
      isSaving: true,
      isProcessing: needsTranscription || needsDescription,
    );
    final updated = state.messages.add(newMessageState);
    state = state.copyWith(messages: updated);

    try {
      // Generate description for non-audio messages before saving
      var messageToSave = message;
      if (needsDescription) {
        messageToSave = await _generateMessageDescription(message);
      }

      await isar.writeTxn(() async {
        await isar.messages.put(messageToSave);
        await messageToSave.thread.save();
        await messageToSave.tags.save();
      });

      final idx = state.messages.length - 1;

      if (needsTranscription) {
        // Keep processing state for transcription
        final savedMessageState = newMessageState.copyWith(
          message: messageToSave,
          isSaving: false,
        );
        final tempUpdated = state.messages.replace(idx, savedMessageState);
        state = state.copyWith(messages: tempUpdated);

        // Start transcription
        await _transcribeAudioMessage(messageToSave.id);
      } else {
        // No transcription needed, just mark as saved
        final savedMessageState = newMessageState.copyWith(
          message: messageToSave,
          isSaving: false,
          isProcessing: false,
        );
        final finalUpdated = state.messages.replace(idx, savedMessageState);
        state = state.copyWith(messages: finalUpdated);
      }
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

  /// Update tags for a message
  Future<bool> updateMessageTags(int messageId, List<Tag> newTags) async {
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

      final newTagIds = newTags.map((t) => t.id).toSet();
      final existingIds = message.tags.map((t) => t.id).toSet();
      final tagsToLink = newTags.where((t) => !existingIds.contains(t.id));
      final tagsToUnlink = message.tags.where((t) => !newTagIds.contains(t.id));

      await isar.writeTxn(() async {
        await message.tags.update(link: tagsToLink, unlink: tagsToUnlink);
      });

      await message.tags.load();

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

  /// Update description for a message
  Future<bool> updateMessageDescription(
      int messageId, String newDescription) async {
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

      // Create updated message with new description
      final updatedMessage = message.copyWith(description: newDescription);

      await isar.writeTxn(() async {
        await isar.messages.put(updatedMessage);
      });

      final finalMessageState =
          MessageState(message: updatedMessage, isSaving: false);
      final finalUpdated = state.messages.replace(idx, finalMessageState);
      state = state.copyWith(messages: finalUpdated);

      return true;
    } catch (e) {
      final errorMessageState = updatedMessageState.copyWith(
        isSaving: false,
        error: 'Failed to update description: ${e.toString()}',
      );
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
