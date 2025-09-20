import 'dart:typed_data';
import 'package:flutter_riverpod/misc.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:spec_genie/features/chat/models/message.dart';
import 'package:spec_genie/features/chat/models/message_state.dart';
import 'package:spec_genie/features/shared/isar/isar_provider.dart';
import 'package:spec_genie/features/shared/openai/openai_provider.dart';
import 'package:spec_genie/features/shared/openai/util.dart';
import 'package:spec_genie/features/shared/openai/content_parts.dart';
import 'package:spec_genie/features/threads/models/thread.dart';
import '../../tags/models/tag.dart';

part 'message_bloc.g.dart';

/// Bloc responsible for a single message's lifecycle (processing, saving updates, etc.)
@Riverpod(keepAlive: true)
class MessageBloc extends _$MessageBloc {
  Timer? _disposeTimer;
  KeepAliveLink? _keepAliveLink;

  @override
  MessageState build(int messageId) {
    _keepAliveLink ??= ref.keepAlive();
    ref.onDispose(() {
      _disposeTimer?.cancel();
      _audioPlayer?.dispose();
    });
    ref.onCancel(_scheduleAutoDispose);
    ref.onResume(() => _disposeTimer?.cancel());

    final msg = ref.read(isarProvider).messages.getSync(messageId);
    if (msg != null) return MessageState(message: msg);
    return MessageState(
      message: Message(
        id: messageId,
        type: MessageType.text,
        text: '',
        description: '',
        timestamp: DateTime.now(),
      ),
    );
  }

  void _scheduleAutoDispose() {
    if (state.isProcessing || state.isSaving) return;
    _disposeTimer?.cancel();
    _disposeTimer = Timer(const Duration(seconds: 30), () {
      if (!ref.mounted) return;
      if (state.isProcessing || state.isSaving) return;
      // _keepAliveLink?.close();
    });
  }

  Isar get _isar => ref.read(isarProvider);

  OpenAIUtil get _openAI => ref.read(openAIUtilProvider);

  AudioPlayer? _audioPlayer;

  Future<void> _ensureAudioPlayer() async {
    if (_audioPlayer != null) return;
    if (state.message.type != MessageType.audio ||
        state.message.fileData == null) return;
    _audioPlayer = AudioPlayer();
    // listeners
    _audioPlayer!.playerStateStream.listen((playerState) {
      final isLoading =
          playerState.processingState == ProcessingState.loading ||
              playerState.processingState == ProcessingState.buffering;
      final isPlaying = playerState.playing;
      _emitAudioState(isPlaying: isPlaying, isLoading: isLoading);
    });
    _audioPlayer!.durationStream.listen((d) {
      if (d != null) {
        _emitAudioState(durationMs: d.inMilliseconds);
      }
    });
    _audioPlayer!.positionStream.listen((p) {
      _emitAudioState(positionMs: p.inMilliseconds);
    });
    try {
      final bytes = Uint8List.fromList(state.message.fileData!);
      await _audioPlayer!.setAudioSource(AudioSource.uri(
        Uri.dataFromBytes(bytes,
            mimeType: state.message.mimeType ?? 'audio/mpeg'),
      ));
    } catch (_) {
      // ignore load errors for now
    }
  }

  void _emitAudioState({
    bool? isPlaying,
    bool? isLoading,
    int? durationMs,
    int? positionMs,
  }) {
    state = state.copyWith(
      isAudioPlaying: isPlaying ?? state.isAudioPlaying,
      isAudioLoading: isLoading ?? state.isAudioLoading,
      audioDurationMs: durationMs ?? state.audioDurationMs,
      audioPositionMs: positionMs ?? state.audioPositionMs,
    );
  }

  Future<void> togglePlayback() async {
    if (state.message.type != MessageType.audio ||
        state.message.fileData == null) return;
    await _ensureAudioPlayer();
    if (_audioPlayer == null) return;
    if (state.isAudioPlaying) {
      await _audioPlayer!.pause();
    } else {
      if (state.audioPositionMs >= state.audioDurationMs &&
          state.audioDurationMs > 0) {
        await _audioPlayer!.seek(Duration.zero);
      }
      await _audioPlayer!.play();
    }
  }

  Future<void> seekAudio(double fraction) async {
    if (_audioPlayer == null || state.audioDurationMs == 0) return;
    final target =
        Duration(milliseconds: (state.audioDurationMs * fraction).round());
    await _audioPlayer!.seek(target);
  }

  /// Public method to trigger post-save processing (transcription/description)
  Future<void> process() async {
    final msg = _fresh();
    if (msg.type == MessageType.audio && _needsTranscription(msg)) {
      await _transcribe();
    } else if (msg.description.isEmpty) {
      await _generateDescription();
    }
  }

  bool _needsTranscription(Message m) =>
      m.fileData != null && (m.transcript == null || m.transcript!.isEmpty);

  Future<void> _transcribe() async {
    _refreshState();
    state = state.copyWith(isProcessing: true);
    try {
      final msg = _fresh();
      if (msg.fileData == null) {
        state = state.copyWith(isProcessing: false);
        return;
      }
      final audioPart = AudioPart(
        Uint8List.fromList(msg.fileData!),
        msg.mimeType ?? 'audio/wav',
      );
      final transcript = await _openAI.transcribeAudio(audioPart);
      var updated = msg.copyWith(transcript: transcript);
      if (updated.description.isEmpty) {
        updated = await _generateDescriptionInternal(updated);
      }
      await _isar.writeTxn(() async {
        await _isar.messages.put(updated);
      });
      final fresh = _fresh();
      state = state.copyWith(
        message: fresh,
        isProcessing: false,
        error: null,
      );
      // Attempt thread title update using description if available
      await _maybeUpdateThreadTitle(fresh);
    } catch (e) {
      state = state.copyWith(
        isProcessing: false,
        error: 'Transcription failed: $e',
      );
    }
  }

  Future<void> _generateDescription() async {
    final current = _refreshState();
    state = state.copyWith(isProcessing: true);
    try {
      final updated = await _generateDescriptionInternal(_fresh());
      if (updated != current.message) {
        await _isar.writeTxn(() async {
          await _isar.messages.put(updated);
        });
        final fresh = _fresh();
        state = state.copyWith(
          message: fresh,
          isProcessing: false,
          error: null,
        );
        await _maybeUpdateThreadTitle(fresh);
      } else {
        state = state.copyWith(isProcessing: false);
      }
    } catch (e) {
      state = state.copyWith(
        isProcessing: false,
        error: 'Description failed: $e',
      );
    }
  }

  Future<Message> _generateDescriptionInternal(Message message) async {
    if (message.description.isNotEmpty) return message;
    final parts = <ContentPart>[];
    switch (message.type) {
      case MessageType.text:
        if (message.text.isNotEmpty) parts.add(TextPart(message.text));
        break;
      case MessageType.audio:
        if (message.transcript != null && message.transcript!.isNotEmpty) {
          parts.add(TextPart('Audio transcript: ${message.transcript!}'));
        }
        break;
      case MessageType.image:
        if (message.fileData != null) {
          parts.add(ImagePart(Uint8List.fromList(message.fileData!),
              message.mimeType ?? 'image/jpeg'));
        }
        break;
    }
    if (parts.isEmpty) return message;
    try {
      final description = await _openAI.generateDescription(parts);
      return message.copyWith(description: description.trim());
    } catch (_) {
      return message; // Fallback silently
    }
  }

  /// Update description manually
  Future<void> updateDescription(String newDescription) async {
    _refreshState();
    state = state.copyWith(isSaving: true);
    try {
      final updated = _fresh().copyWith(description: newDescription);
      await _isar.writeTxn(() async {
        await _isar.messages.put(updated);
      });
      state = state.copyWith(
        message: _fresh(),
        isSaving: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isSaving: false,
        error: 'Update description failed: $e',
      );
    }
  }

  /// Update tags
  Future<void> updateTags(List<Tag> newTags) async {
    final current = _refreshState();
    state = state.copyWith(isSaving: true);
    try {
      final message = await _isar.messages.get(current.message.id);
      if (message == null) {
        state = state.copyWith(
          isSaving: false,
          error: 'Message not found',
        );
        return;
      }
      final newTagIds = newTags.map((t) => t.id).toSet();
      final existingIds = message.tags.map((t) => t.id).toSet();
      final tagsToLink = newTags.where((t) => !existingIds.contains(t.id));
      final tagsToUnlink = message.tags.where((t) => !newTagIds.contains(t.id));
      await _isar.writeTxn(() async {
        await message.tags.update(link: tagsToLink, unlink: tagsToUnlink);
      });
      await message.tags.load();
      state = state.copyWith(
        message: _fresh(),
        isSaving: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isSaving: false,
        error: 'Update tags failed: $e',
      );
    }
  }

  // Helper to always retrieve latest message from DB (synchronous when possible)
  Message _fresh() => _isar.messages.getSync(state.message.id) ?? state.message;

  MessageState _refreshState() {
    final latest = _fresh();
    if (!identical(latest, state.message)) {
      state = state.copyWith(message: latest);
    }
    return state;
  }

  /// If the parent thread still has the placeholder name, try updating it using this message's description.
  Future<void> _maybeUpdateThreadTitle(Message m) async {
    try {
      // Load thread via link
      await m.thread.load();
      final thread = m.thread.value;
      if (thread == null) return;
      if (thread.name.trim() != 'New Thread') return; // already named
      final desc = m.description.trim();
      if (desc.isEmpty) return;
      // Derive a concise title (reuse the same heuristic as placeholder trimming)
      final candidate =
          desc.length <= 50 ? desc : '${desc.substring(0, 47)}...';
      if (candidate.isEmpty) return;
      // Update directly via Isar to avoid depending on non-keepAlive providers.
      await _isar.writeTxn(() async {
        final updatedThread = Thread(
          id: thread.id,
          name: candidate,
          createdAt: thread.createdAt,
        );
        await _isar.threads.put(updatedThread);
      });
    } catch (_) {
      // Ignore failures silently
    }
  }
}
