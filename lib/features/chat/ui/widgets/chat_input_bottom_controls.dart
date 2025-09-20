import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bloc/chat_input_bloc.dart';
import '../../models/chat_input_state.dart';
import '../../models/chat_input.dart';
import 'chat_input_record_button.dart';

class ChatInputBottomControls extends ConsumerWidget {
  final ChatInputState state;
  final ChatInputBloc bloc;
  final VoidCallback onSend;
  final VoidCallback onCancel;
  final VoidCallback onShowFileOptions;
  final VoidCallback onShowTextInput;
  final VoidCallback? onGenerateMostUsedMode; // New button action

  const ChatInputBottomControls({
    super.key,
    required this.state,
    required this.bloc,
    required this.onSend,
    required this.onCancel,
    required this.onShowFileOptions,
    required this.onShowTextInput,
    this.onGenerateMostUsedMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasAttachmentOrText =
        state.currentContent != null || state.textInput.trim().isNotEmpty;
    final isRecording = state.isRecording || state.isRecordingPaused;
    final recordingFinished =
        state.audioState.status == RecordingStatus.stopped &&
            state.currentContent != null &&
            state.currentContent!.type == ChatInputType.audio;

    Widget buildLeft() {
      // We always wrap the icon with the same horizontal padding so the
      // center record button stays perfectly centered regardless of state.
      Widget icon;
      if (isRecording) {
        icon = _SmallCircleIcon(
          icon: state.isRecordingPaused ? Icons.play_arrow : Icons.pause,
          color: Colors.orange,
          tooltip: state.isRecordingPaused ? 'Resume' : 'Pause',
          onTap: () => state.isRecordingPaused
              ? bloc.resumeRecording()
              : bloc.pauseRecording(),
        );
      } else if (recordingFinished || hasAttachmentOrText) {
        icon = _SmallCircleIcon(
          icon: Icons.close,
          color: Theme.of(context).colorScheme.error,
          tooltip: 'Cancel',
          onTap: onCancel,
        );
      } else {
        icon = _SmallCircleIcon(
          icon: Icons.attach_file_outlined,
          color: Theme.of(context).colorScheme.primary,
          tooltip: 'Attach',
          onTap: state.isLoading ? null : onShowFileOptions,
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: icon,
      );
    }

    Widget buildCenter() {
      if (isRecording) {
        return ChatInputRecordButton(
          state: state,
          isStop: true,
          onTap: () async {
            await bloc.stopRecording();
            await bloc.saveRecording();
          },
        );
      }
      if (recordingFinished || hasAttachmentOrText) {
        return ChatInputRecordButton(
          state: state,
          isSend: true,
          onTap: state.canSend ? onSend : null,
        );
      }
      return ChatInputRecordButton(
        state: state,
        onTap: state.isLoading
            ? null
            : () async {
                await bloc.startRecording();
              },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          buildLeft(),
          const Spacer(),
          buildCenter(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _SmallCircleIcon(
              icon: Icons.auto_awesome,
              color: Theme.of(context).colorScheme.primary,
              tooltip: 'Generate (Most Used Mode)',
              onTap: state.isLoading ? null : onGenerateMostUsedMode,
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallCircleIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  final String tooltip;
  const _SmallCircleIcon({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.tooltip,
  });
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.1),
            border: Border.all(color: color, width: 1.5),
          ),
          child: Icon(icon, color: color),
        ),
      ),
    );
  }
}
