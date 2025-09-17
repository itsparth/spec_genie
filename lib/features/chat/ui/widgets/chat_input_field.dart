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
    final state = ref.watch(chatInputBlocProvider);

    return TextFormField(
      initialValue: state.textInput,
      decoration: InputDecoration(
        hintText: hintText ?? 'Type a message...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        isDense: true,
      ),
      maxLines: 4,
      minLines: 1,
      textCapitalization: TextCapitalization.sentences,
      onChanged: chatInputBloc.updateTextInput,
      onFieldSubmitted: canSend ? (_) => onSubmit?.call() : null,
    );
  }
}
