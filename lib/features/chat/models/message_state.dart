import 'package:dart_mappable/dart_mappable.dart';

import 'message.dart';

part 'message_state.mapper.dart';

@MappableClass()
class MessageState with MessageStateMappable {
  final Message message;
  final bool isSaving;
  final bool isProcessing;
  final String? error;
  // Audio playback UI state (managed by MessageBloc)
  final bool isAudioPlaying;
  final bool isAudioLoading;
  final int audioDurationMs; // total duration in ms
  final int audioPositionMs; // current position in ms

  const MessageState({
    required this.message,
    this.isSaving = false,
    this.isProcessing = false,
    this.error,
    this.isAudioPlaying = false,
    this.isAudioLoading = false,
    this.audioDurationMs = 0,
    this.audioPositionMs = 0,
  });
}
