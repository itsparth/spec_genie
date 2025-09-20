import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/chat_input.dart';
import '../../models/chat_input_state.dart';

class ChatInputContentPreview extends ConsumerWidget {
  final ChatInputState state;
  final VoidCallback onTapText; // open text input sheet

  const ChatInputContentPreview({
    super.key,
    required this.state,
    required this.onTapText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasContent = state.currentContent != null;
    final hasTextInput = state.textInput.trim().isNotEmpty;
    if (!hasContent && !hasTextInput) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            hasContent
                ? _getContentIcon(state.currentContent!.type)
                : Icons.text_fields,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: hasContent &&
                    state.currentContent!.type != ChatInputType.text
                ? Text(
                    _getContentDisplayText(state.currentContent!),
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                : GestureDetector(
                    onTap: onTapText,
                    child: SizedBox(
                      height: 40,
                      child: SingleChildScrollView(
                        child: Text(
                          hasContent
                              ? _getContentDisplayText(state.currentContent!)
                              : state.textInput.trim(),
                          style: Theme.of(context).textTheme.bodyMedium,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  IconData _getContentIcon(ChatInputType type) {
    switch (type) {
      case ChatInputType.text:
        return Icons.text_fields;
      case ChatInputType.audio:
        return Icons.audiotrack;
      case ChatInputType.image:
        return Icons.image;
      case ChatInputType.file:
        return Icons.attach_file;
    }
  }

  String _getContentDisplayText(ChatInput content) {
    switch (content.type) {
      case ChatInputType.text:
        return (content as TextChatInput).text;
      case ChatInputType.audio:
        return (content as AudioChatInput).fileName ?? 'Audio recording';
      case ChatInputType.image:
        return (content as ImageChatInput).fileName ?? 'Image';
      case ChatInputType.file:
        return (content as FileChatInput).fileName;
    }
  }
}
