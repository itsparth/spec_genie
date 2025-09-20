import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../bloc/message_bloc.dart';
import '../../models/message_state.dart';
import '../../models/message.dart';

class MessageDescription extends ConsumerWidget {
  const MessageDescription({super.key, required this.messageId});
  final int messageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(messageBlocProvider(messageId));
    final message = state.message;
    final cs = Theme.of(context).colorScheme;
    final isEmpty = message.description.isEmpty;
    final isProcessingDescription =
        state.isProcessing && isEmpty && message.type != MessageType.audio;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap:
            !isProcessingDescription ? () => _edit(context, ref, state) : null,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: isEmpty
                ? cs.surfaceVariant.withValues(alpha: 0.3)
                : cs.primaryContainer.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:
                  (isEmpty ? cs.outline : cs.primary).withValues(alpha: 0.15),
              width: 0.5,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isProcessingDescription) ...[
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          cs.primary.withValues(alpha: 0.6))),
                )
              ] else ...[
                Icon(
                  isEmpty
                      ? Icons.add_comment_outlined
                      : Icons.description_outlined,
                  size: 16,
                  color: (isEmpty ? cs.onSurfaceVariant : cs.primary)
                      .withValues(alpha: isEmpty ? 0.6 : 0.7),
                ),
              ],
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  isProcessingDescription
                      ? 'Generating description...'
                      : (isEmpty ? 'Add description...' : message.description),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isProcessingDescription
                            ? cs.primary.withValues(alpha: 0.7)
                            : isEmpty
                                ? cs.onSurfaceVariant.withValues(alpha: 0.6)
                                : cs.onSurface,
                        height: 1.4,
                        fontWeight: isEmpty ? FontWeight.w400 : FontWeight.w500,
                        fontStyle:
                            isEmpty ? FontStyle.italic : FontStyle.normal,
                      ),
                ),
              ),
              if (!isProcessingDescription) ...[
                const SizedBox(width: 8),
                Icon(Icons.edit_outlined,
                    size: 14,
                    color: cs.onSurfaceVariant.withValues(alpha: 0.5)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _edit(
      BuildContext context, WidgetRef ref, MessageState msgState) async {
    final controller =
        TextEditingController(text: msgState.message.description);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(children: [
          Icon(Icons.edit_note_rounded,
              color: Theme.of(context).colorScheme.primary, size: 20),
          const SizedBox(width: 8),
          const Text('Edit Description'),
        ]),
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add or edit a description to help organize and remember this message.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7)),
              ),
              const SizedBox(height: 16),
              TextField(
                  controller: controller,
                  maxLines: 4,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Enter a description for this message...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withValues(alpha: 0.3),
                    contentPadding: const EdgeInsets.all(16),
                  )),
            ]),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text('Cancel',
                  style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.7)))),
          FilledButton(
              onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
              child: const Text('Save')),
        ],
        actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      ),
    );
    if (result != null) {
      await ref
          .read(messageBlocProvider(msgState.message.id).notifier)
          .updateDescription(result);
    }
  }
}
