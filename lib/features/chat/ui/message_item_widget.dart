import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/message_state.dart';
import '../models/message.dart';
import '../../tags/models/tag.dart';
import '../../tags/ui/tags_selection_widget.dart';

/// Widget to display a single message in the chat
class MessageItemWidget extends ConsumerWidget {
  final MessageState messageState;
  final void Function(List<Tag> tags)? onTagsUpdate;
  final void Function(String description)? onDescriptionUpdate;
  final VoidCallback? onDelete;

  const MessageItemWidget({
    super.key,
    required this.messageState,
    this.onTagsUpdate,
    this.onDescriptionUpdate,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = messageState.message;
    final isLoading = messageState.isSaving || messageState.isProcessing;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isLoading ? 0.7 : 1.0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: _getMessageBackgroundColor(context, message.type),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Loading indicator at the top
            if (isLoading)
              LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor.withOpacity(0.3),
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
                  _buildMessageHeader(context, message),

                  const SizedBox(height: 12),

                  // Message content
                  _buildMessageContent(context, message),

                  // Error display
                  if (messageState.error != null) ...[
                    const SizedBox(height: 8),
                    _buildErrorDisplay(context),
                  ],
                ],
              ),
            ),

            // Message actions
            _buildMessageActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageHeader(BuildContext context, Message message) {
    return Row(
      children: [
        // Message type icon with better styling
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            _getMessageTypeIcon(message.type),
            size: 14,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(width: 10),

        // Timestamp
        Text(
          _formatTimestamp(message.timestamp),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                fontWeight: FontWeight.w500,
              ),
        ),

        const Spacer(),

        // Status indicator for loading states
        if (messageState.isSaving || messageState.isProcessing) ...[
          SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor.withOpacity(0.6),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            messageState.isSaving ? 'Saving...' : 'Processing...',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(width: 8),
        ],

        // Delete message button
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: onDelete,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.delete_outline,
                size: 16,
                color: Theme.of(context).colorScheme.error.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageContent(BuildContext context, Message message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main content based on message type
        _buildMainContent(context, message),

        // Description (if present)
        if (message.description.isNotEmpty) ...[
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
                width: 0.5,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.note_outlined,
                  size: 14,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withOpacity(0.6),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    message.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                          height: 1.3,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildMainContent(BuildContext context, Message message) {
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
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          // Audio icon with background
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.audiotrack_rounded,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.fileName ?? 'Audio message',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
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
                          height: 1.3,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                // TODO: Implement audio playback
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContent(BuildContext context, Message message) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 220,
        maxWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color:
            Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          width: 0.5,
        ),
      ),
      child: message.fileData != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.memory(
                Uint8List.fromList(message.fileData!),
                fit: BoxFit.cover,
                width: double.infinity,
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
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.image_outlined,
              size: 32,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            message.fileName ?? 'Image',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageActions(BuildContext context) {
    final message = messageState.message;
    final selectionKey = 'message_${message.id}';

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.05),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Edit description button
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onDescriptionUpdate != null
                  ? () => _showEditDescriptionDialog(context)
                  : null,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color:
                        Theme.of(context).colorScheme.outline.withOpacity(0.2),
                    width: 0.5,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit_note_outlined,
                      size: 16,
                      color: onDescriptionUpdate != null
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.4),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Edit',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: onDescriptionUpdate != null
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.4),
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Spacer(),

          // Tags selection widget
          TagsSelectionWidget(
            selectionKey: selectionKey,
            title: 'Tags',
            showCreateButton: true,
            initialTags: messageState.message.tags.toList(),
            onTagObjectsChanged: (selectedTags) {
              onTagsUpdate?.call(selectedTags);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildErrorDisplay(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.error.withOpacity(0.2),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 16,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              messageState.error!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                    height: 1.3,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showEditDescriptionDialog(BuildContext context) async {
    final TextEditingController controller = TextEditingController(
      text: messageState.message.description,
    );

    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.edit_note_rounded,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text('Edit Description'),
            ],
          ),
          content: TextField(
            controller: controller,
            maxLines: 4,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter a description for this message...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor:
                  Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ),
            FilledButton(
              onPressed: () =>
                  Navigator.of(context).pop(controller.text.trim()),
              child: const Text('Save'),
            ),
          ],
          actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        );
      },
    );

    if (result != null) {
      onDescriptionUpdate?.call(result);
    }
  }

  Color _getMessageBackgroundColor(BuildContext context, MessageType type) {
    switch (type) {
      case MessageType.text:
        return Theme.of(context).colorScheme.surface;
      case MessageType.audio:
        return Theme.of(context).colorScheme.primaryContainer.withOpacity(0.03);
      case MessageType.image:
        return Theme.of(context)
            .colorScheme
            .secondaryContainer
            .withOpacity(0.03);
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
}
