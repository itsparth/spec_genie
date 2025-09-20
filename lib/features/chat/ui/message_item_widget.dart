import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/message_bloc.dart';
import '../models/message.dart';
import 'widgets/message_header.dart';
import 'widgets/message_description.dart';
import 'widgets/message_audio_content.dart';
import 'widgets/message_image_content.dart';
import 'widgets/message_actions.dart';

/// Widget to display a single message in the chat
class MessageItemWidget extends ConsumerWidget {
  final int messageId;
  final VoidCallback onDelete;

  const MessageItemWidget(
      {super.key, required this.messageId, required this.onDelete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final msgState = ref.watch(messageBlocProvider(messageId));
    final message = msgState.message;
    final isLoading = msgState.isSaving || msgState.isProcessing;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isLoading ? 0.7 : 1.0,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        elevation: 1.5,
        shadowColor: Theme.of(context).shadowColor.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _getMessageBackgroundColor(context, message.type),
                _getMessageBackgroundColor(context, message.type)
                    .withValues(alpha: 0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Loading indicator at the top
              if (isLoading)
                LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor.withValues(alpha: 0.3),
                  ),
                  minHeight: 2,
                ),

              // Main message content
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Message header with timestamp and type
                    MessageHeader(
                      messageId: messageId,
                      onDelete: onDelete,
                    ),

                    // Description at the top (always show for editing)
                    const SizedBox(height: 8),
                    MessageDescription(messageId: messageId),

                    const SizedBox(height: 8),

                    // Message content
                    _ContentSwitcher(messageId: messageId),

                    // Error display
                    if (msgState.error != null) ...[
                      const SizedBox(height: 8),
                      _ErrorDisplay(error: msgState.error!),
                    ],
                  ],
                ),
              ),

              // Message actions
              MessageActions(messageId: messageId),
            ],
          ),
        ),
      ),
    );
  }

  Color _getMessageBackgroundColor(BuildContext context, MessageType type) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (type) {
      case MessageType.text:
        return colorScheme.surface;
      case MessageType.audio:
        return colorScheme.primaryContainer.withValues(alpha: 0.05);
      case MessageType.image:
        return colorScheme.secondaryContainer.withValues(alpha: 0.05);
    }
  }
}

class _ContentSwitcher extends ConsumerWidget {
  const _ContentSwitcher({required this.messageId});
  final int messageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(messageBlocProvider(messageId));
    final m = state.message;
    if (m.type == MessageType.text) {
      return Text(
        m.text.isNotEmpty ? m.text : m.description,
        style: Theme.of(context).textTheme.bodyMedium,
      );
    } else if (m.type == MessageType.audio) {
      return MessageAudioContent(messageId: messageId);
    } else {
      return MessageImageContent(messageId: messageId);
    }
  }
}

class _ErrorDisplay extends StatelessWidget {
  const _ErrorDisplay({required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cs.errorContainer.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: cs.error.withValues(alpha: 0.2), width: 0.5),
      ),
      child: Row(children: [
        Icon(Icons.error_outline_rounded, size: 16, color: cs.error),
        const SizedBox(width: 8),
        Expanded(
            child: Text(error,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: cs.error, height: 1.3))),
      ]),
    );
  }
}
