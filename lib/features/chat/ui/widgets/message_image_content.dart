import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../bloc/message_bloc.dart';
import '../../models/message.dart';

class MessageImageContent extends ConsumerWidget {
  const MessageImageContent({super.key, required this.messageId});
  final int messageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(messageBlocProvider(messageId));
    final msg = state.message;
    if (msg.type != MessageType.image) return const SizedBox.shrink();
    final cs = Theme.of(context).colorScheme;

    return Container(
      constraints:
          const BoxConstraints(maxHeight: 240, maxWidth: double.infinity),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cs.secondaryContainer.withValues(alpha: 0.05),
            cs.secondaryContainer.withValues(alpha: 0.1)
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border:
            Border.all(color: cs.secondary.withValues(alpha: 0.15), width: 0.5),
      ),
      child: msg.fileData != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.memory(
                Uint8List.fromList(msg.fileData!),
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stack) =>
                    _placeholder(context, msg.fileName),
              ),
            )
          : _placeholder(context, msg.fileName),
    );
  }

  Widget _placeholder(BuildContext context, String? name) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: cs.secondaryContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.image_outlined, size: 32, color: cs.secondary)),
        const SizedBox(height: 12),
        Text(name ?? 'Image',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center),
      ]),
    );
  }
}
