import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/message_state.dart';
import '../models/message.dart';

/// Widget to display a single message in the chat
class MessageItemWidget extends ConsumerWidget {
  final MessageState messageState;
  final void Function(int tagId)? onTagAdd;
  final void Function(int tagId)? onTagRemove;
  final VoidCallback? onDelete;

  const MessageItemWidget({
    super.key,
    required this.messageState,
    this.onTagAdd,
    this.onTagRemove,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = messageState.message;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _getMessageBackgroundColor(context, message.type),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Message header with timestamp and type
          _buildMessageHeader(context, message),

          const SizedBox(height: 8),

          // Message content
          _buildMessageContent(context, message),

          // Tags section
          if (message.tags.isNotEmpty) _buildTagsSection(context, message),

          // Message actions
          if (!messageState.isSaving) _buildMessageActions(context),

          // Loading indicator
          if (messageState.isSaving) _buildLoadingIndicator(),

          // Error display
          if (messageState.error != null) _buildErrorDisplay(context),
        ],
      ),
    );
  }

  Widget _buildMessageHeader(BuildContext context, Message message) {
    return Row(
      children: [
        // Message type icon
        Icon(
          _getMessageTypeIcon(message.type),
          size: 16,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 8),

        // Timestamp
        Text(
          _formatTimestamp(message.timestamp),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
        ),

        const Spacer(),

        // Message actions button
        IconButton(
          icon: const Icon(Icons.more_vert, size: 18),
          onPressed: () => _showMessageActions(context),
          constraints: const BoxConstraints(
            minHeight: 32,
            minWidth: 32,
          ),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildMessageContent(BuildContext context, Message message) {
    switch (message.type) {
      case MessageType.text:
        return Text(
          message.text.isNotEmpty ? message.text : message.description,
          style: Theme.of(context).textTheme.bodyMedium,
        );

      case MessageType.audio:
        return _buildAudioContent(context, message);

      case MessageType.image:
        return _buildImageContent(context, message);
    }
  }

  Widget _buildAudioContent(BuildContext context, Message message) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.audiotrack,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.fileName ?? 'Audio message',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                if (message.transcript?.isNotEmpty == true) ...[
                  const SizedBox(height: 4),
                  Text(
                    message.transcript!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.7),
                        ),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              // TODO: Implement audio playback
            },
          ),
        ],
      ),
    );
  }

  Widget _buildImageContent(BuildContext context, Message message) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 200,
        maxWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: message.fileData != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.memory(
                Uint8List.fromList(message.fileData!),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildImagePlaceholder(context, message);
                },
              ),
            )
          : _buildImagePlaceholder(context, message),
    );
  }

  Widget _buildImagePlaceholder(BuildContext context, Message message) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined,
            size: 48,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 8),
          Text(
            message.fileName ?? 'Image',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagsSection(BuildContext context, Message message) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: message.tags.map((tag) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              tag.name,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMessageActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton.icon(
            onPressed: () => _showTagsDialog(context),
            icon: const Icon(Icons.tag, size: 16),
            label: const Text('Tag'),
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodySmall,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 8),
          Text('Saving...', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildErrorDisplay(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            size: 16,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              messageState.error!,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getMessageBackgroundColor(BuildContext context, MessageType type) {
    switch (type) {
      case MessageType.text:
        return Theme.of(context).colorScheme.surface;
      case MessageType.audio:
        return Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1);
      case MessageType.image:
        return Theme.of(context)
            .colorScheme
            .secondaryContainer
            .withOpacity(0.1);
    }
  }

  IconData _getMessageTypeIcon(MessageType type) {
    switch (type) {
      case MessageType.text:
        return Icons.text_fields;
      case MessageType.audio:
        return Icons.audiotrack;
      case MessageType.image:
        return Icons.image;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  void _showMessageActions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.tag),
              title: const Text('Manage Tags'),
              onTap: () {
                Navigator.pop(context);
                _showTagsDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Delete Message'),
              textColor: Colors.red,
              onTap: () {
                Navigator.pop(context);
                onDelete?.call();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showTagsDialog(BuildContext context) {
    // TODO: Implement tags management dialog
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Manage Tags'),
        content: const Text('Tag management not yet implemented'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
