import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bloc/chat_input_bloc.dart';

class ChatInputField extends ConsumerWidget {
  final String? hintText;
  final bool canSend;
  final VoidCallback? onSubmit;

  const ChatInputField({
    super.key,
    this.hintText,
    required this.canSend,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatInputBloc = ref.read(chatInputBlocProvider.notifier);

    return TextFormField(
      controller: chatInputBloc.textController,
      decoration: InputDecoration(
        hintText: hintText ?? 'Info...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        isDense: true,
      ),
      maxLines: 2,
      minLines: 1,
      textCapitalization: TextCapitalization.sentences,
      onFieldSubmitted: canSend ? (_) => onSubmit?.call() : null,
    );
  }
}
