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

  const ChatInputBottomControls({
    super.key,
    required this.state,
    required this.bloc,
    required this.onSend,
    required this.onCancel,
    required this.onShowFileOptions,
    required this.onShowTextInput,
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
      if (isRecording) {
        return _SmallCircleIcon(
          icon: state.isRecordingPaused ? Icons.play_arrow : Icons.pause,
          color: Colors.orange,
          tooltip: state.isRecordingPaused ? 'Resume' : 'Pause',
          onTap: () => state.isRecordingPaused
              ? bloc.resumeRecording()
              : bloc.pauseRecording(),
        );
      }
      if (recordingFinished || hasAttachmentOrText) {
        return _SmallCircleIcon(
          icon: Icons.close,
          color: Theme.of(context).colorScheme.error,
          tooltip: 'Cancel',
          onTap: onCancel,
        );
      }
      return _SmallCircleIcon(
        icon: Icons.attach_file_outlined,
        color: Theme.of(context).colorScheme.primary,
        tooltip: 'Attach',
        onTap: state.isLoading ? null : onShowFileOptions,
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
          Opacity(
            opacity: 0.0,
            child: _SmallCircleIcon(
              icon: Icons.more_horiz,
              color: Theme.of(context).colorScheme.primary,
              tooltip: '',
              onTap: null,
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
