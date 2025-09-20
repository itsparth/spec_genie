import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../bloc/message_bloc.dart';
import '../../models/message_state.dart';
import '../../models/message.dart';

class MessageHeader extends ConsumerWidget {
  const MessageHeader(
      {super.key, required this.messageId, required this.onDelete});
  final int messageId;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MessageState msgState = ref.watch(messageBlocProvider(messageId));
    final message = msgState.message;
    final cs = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: cs.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(_iconForType(message.type), size: 14, color: cs.primary),
        ),
        const SizedBox(width: 10),
        Text(_formatTimestamp(message.timestamp),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: cs.onSurface.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w500,
                )),
        const Spacer(),
        if (msgState.isSaving || msgState.isProcessing) ...[
          SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                  cs.primary.withValues(alpha: 0.6)),
            ),
          ),
          const SizedBox(width: 8),
          Text(_statusText(msgState),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: cs.primary.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w500,
                  )),
          const SizedBox(width: 8),
        ],
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: onDelete,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(Icons.delete_outline,
                  size: 16, color: cs.error.withValues(alpha: 0.7)),
            ),
          ),
        ),
      ],
    );
  }

  IconData _iconForType(MessageType type) => switch (type) {
        MessageType.text => Icons.text_fields,
        MessageType.audio => Icons.audiotrack,
        MessageType.image => Icons.image,
      };

  String _statusText(MessageState s) {
    final m = s.message;
    if (s.isSaving) return 'Saving...';
    if (s.isProcessing) {
      if (m.type == MessageType.audio &&
          (m.transcript == null || m.transcript!.isEmpty))
        return 'Transcribing...';
      if (m.description.isEmpty) return 'Generating description...';
      return 'Processing...';
    }
    return '';
  }

  String _formatTimestamp(DateTime ts) {
    final diff = DateTime.now().difference(ts);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Just now';
  }
}
