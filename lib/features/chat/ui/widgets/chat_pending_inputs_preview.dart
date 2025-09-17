import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bloc/chat_input_bloc.dart';
import '../../models/chat_input.dart';

class ChatPendingInputsPreview extends ConsumerWidget {
  final List<ChatInput> pendingInputs;

  const ChatPendingInputsPreview({
    super.key,
    required this.pendingInputs,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (pendingInputs.isEmpty) return const SizedBox.shrink();

    final chatInputBloc = ref.read(chatInputBlocProvider.notifier);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: pendingInputs.map((input) {
            return Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getInputIcon(input),
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _getInputPreviewText(input),
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => chatInputBloc.removePendingInput(input.id),
                    child: Icon(
                      Icons.close,
                      size: 14,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  IconData _getInputIcon(ChatInput input) {
    switch (input.type) {
      case ChatInputType.text:
        return Icons.text_fields;
      case ChatInputType.audio:
        return Icons.mic;
      case ChatInputType.image:
        return Icons.image;
      case ChatInputType.file:
        final fileInput = input as FileChatInput;
        return fileInput.fileType == FileInputType.audio
            ? Icons.audiotrack
            : Icons.insert_drive_file;
    }
  }

  String _getInputPreviewText(ChatInput input) {
    switch (input.type) {
      case ChatInputType.text:
        final textInput = input as TextChatInput;
        return textInput.text.length > 20
            ? '${textInput.text.substring(0, 20)}...'
            : textInput.text;
      case ChatInputType.audio:
        final audioInput = input as AudioChatInput;
        return audioInput.duration != null
            ? _formatDuration(audioInput.duration!)
            : 'Audio';
      case ChatInputType.image:
        return 'Image';
      case ChatInputType.file:
        final fileInput = input as FileChatInput;
        return fileInput.fileName.length > 15
            ? '${fileInput.fileName.substring(0, 15)}...'
            : fileInput.fileName;
    }
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
