import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_service.g.dart';

/// Plays short UI feedback sounds & haptics for recording lifecycle.
@riverpod
FeedbackService feedbackService(Ref ref) {
  final service = FeedbackService._();
  ref.onDispose(service.dispose);
  return service;
}

class FeedbackService {
  FeedbackService._();

  final _player = AudioPlayer();
  AudioSource? _startSource;
  AudioSource? _stopSource;

  bool _loaded = false;

  Future<void> _ensureLoaded() async {
    if (_loaded) return;
    try {
      // You can replace with real asset paths; placeholders for now.
      _startSource = AudioSource.asset('test/features/shared/assets/start.wav');
      _stopSource = AudioSource.asset('test/features/shared/assets/stop.wav');
      _loaded = true;
    } catch (_) {
      // Silently ignore if assets missing.
    }
  }

  Future<void> playStart() async {
    HapticFeedback.mediumImpact();
    await _ensureLoaded();
    if (_startSource != null) {
      try {
        await _player.setAudioSource(_startSource!);
        await _player.play();
      } catch (_) {}
    }
  }

  Future<void> playStop() async {
    HapticFeedback.lightImpact();
    await _ensureLoaded();
    if (_stopSource != null) {
      try {
        await _player.setAudioSource(_stopSource!);
        await _player.play();
      } catch (_) {}
    }
  }

  void dispose() {
    _player.dispose();
  }
}
