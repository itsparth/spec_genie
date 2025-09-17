import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatRecordingControls extends ConsumerWidget {
  final Duration recordingDuration;
  final bool isRecordingPaused;
  final VoidCallback? onPauseResume;
  final VoidCallback? onCancel;

  const ChatRecordingControls({
    super.key,
    required this.recordingDuration,
    required this.isRecordingPaused,
    this.onPauseResume,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Recording indicator and duration
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _formatDuration(recordingDuration),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ],
          ),

          // Control buttons
          Row(
            children: [
              // Pause/Resume button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onPauseResume,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      isRecordingPaused ? Icons.play_arrow : Icons.pause,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Cancel button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onCancel,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
