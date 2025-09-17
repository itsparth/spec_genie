import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../tags/ui/tags_selection_widget.dart';

class ChatActionButtons extends ConsumerWidget {
  final VoidCallback? onFilePressed;
  final VoidCallback? onImagePressed;
  final VoidCallback? onMicPressed;
  final VoidCallback? onSendPressed;
  final bool isLoading;
  final bool isRecording;
  final bool canSend;

  const ChatActionButtons({
    super.key,
    this.onFilePressed,
    this.onImagePressed,
    this.onMicPressed,
    this.onSendPressed,
    required this.isLoading,
    required this.isRecording,
    required this.canSend,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // File selection button
        _buildActionButton(
          context: context,
          icon: Icons.attach_file,
          onPressed: isLoading ? null : onFilePressed,
          tooltip: 'Attach file',
        ),

        const SizedBox(width: 8),

        // Tags selection
        const TagsSelectionWidget(selectionKey: 'input'),

        const SizedBox(width: 8),

        // Image selection button
        _buildActionButton(
          context: context,
          icon: Icons.image_outlined,
          onPressed: isLoading ? null : onImagePressed,
          tooltip: 'Add image',
        ),

        const SizedBox(width: 8),

        // Mic button for recording
        _buildMicButton(context),

        const SizedBox(width: 8),

        // Send button (shown when there's content to send)
        if (canSend) _buildSendButton(context),
      ],
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback? onPressed,
    required String tooltip,
    Color? color,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            color: color ?? Theme.of(context).colorScheme.onSurface,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildMicButton(BuildContext context) {
    return Material(
      color: isRecording ? Colors.red : Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(20),
      elevation: isRecording ? 4 : 0,
      child: InkWell(
        onTap: isLoading ? null : onMicPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Icon(
            isRecording ? Icons.stop : Icons.mic,
            color: isRecording
                ? Colors.white
                : Theme.of(context).colorScheme.onSurface,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildSendButton(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: isLoading ? null : onSendPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.send,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 20,
          ),
        ),
      ),
    );
  }
}
