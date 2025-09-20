import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/chat_input_state.dart';

class ChatInputRecordButton extends ConsumerWidget {
  final ChatInputState state;
  final VoidCallback? onTap;
  final bool isStop;
  final bool isSend;

  const ChatInputRecordButton({
    super.key,
    required this.state,
    required this.onTap,
    this.isStop = false,
    this.isSend = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRecording = state.isRecording || state.isRecordingPaused;
    final amplitude = state.audioState.amplitude;
    final pulse = state.audioState.pulsePhase;
    double shapedPulse = pulse < 0.5 ? (pulse * 2) : (1 - (pulse - 0.5) * 2);
    shapedPulse *= shapedPulse;
    double ringScale(double base) =>
        base + (amplitude * 0.4) + (shapedPulse * 0.25);

    final baseColor = isSend
        ? Theme.of(context).colorScheme.primary
        : (isStop ? Colors.red : Theme.of(context).primaryColor);

    final icon =
        isSend ? Icons.send_rounded : (isStop ? Icons.stop : Icons.mic);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: baseColor,
          boxShadow: [
            BoxShadow(
              color: baseColor.withValues(alpha: 0.35),
              blurRadius: 16,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (!isSend && !isStop && isRecording) ...[
              _PulseRing(
                  scale: ringScale(1.0),
                  color: Colors.white.withValues(alpha: 0.30)),
              _PulseRing(
                  scale: ringScale(0.8),
                  color: Colors.white.withValues(alpha: 0.20)),
              _PulseRing(
                  scale: ringScale(0.6),
                  color: Colors.white.withValues(alpha: 0.10)),
            ],
            if (isRecording)
              Positioned(
                top: 10,
                child: _DurationChip(
                  duration: state.audioState.duration,
                  paused: state.isRecordingPaused,
                ),
              ),
            Icon(icon, color: Colors.white, size: 40),
          ],
        ),
      ),
    );
  }
}

class _PulseRing extends StatelessWidget {
  final double scale;
  final Color color;
  const _PulseRing({required this.scale, required this.color});
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 2),
        ),
      ),
    );
  }
}

class _DurationChip extends StatelessWidget {
  final Duration duration;
  final bool paused;
  const _DurationChip({required this.duration, required this.paused});

  String _two(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final text = '${_two(duration.inMinutes)}:${_two(duration.inSeconds % 60)}';
    return AnimatedOpacity(
      opacity: paused ? 0.6 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              paused ? Icons.pause_circle_filled : Icons.fiber_manual_record,
              size: 12,
              color: paused ? Colors.orangeAccent : Colors.redAccent,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
