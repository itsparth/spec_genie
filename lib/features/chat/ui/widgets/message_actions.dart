import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../bloc/message_bloc.dart';
import '../../../tags/ui/tags_selection_widget.dart';

class MessageActions extends ConsumerWidget {
  const MessageActions({super.key, required this.messageId});
  final int messageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final msgState = ref.watch(messageBlocProvider(messageId));
    final message = msgState.message;
    final selectionKey = 'message_$messageId';
    final cs = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cs.surfaceVariant.withValues(alpha: 0.03),
            cs.surfaceVariant.withValues(alpha: 0.08)
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
        border: Border(
          top: BorderSide(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
              width: 0.5),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(children: [
        const Spacer(),
        TagsSelectionWidget(
          selectionKey: selectionKey,
          title: 'Tags',
          showCreateButton: true,
          initialTags: message.tags.toList(),
          onTagObjectsChanged: (tags) => ref
              .read(messageBlocProvider(messageId).notifier)
              .updateTags(tags),
        ),
      ]),
    );
  }
}
