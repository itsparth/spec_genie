import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/chat_bloc.dart';
import 'message_input.dart';
import 'message_bubble.dart';

class ChatScreen extends ConsumerWidget {
  final int threadId;

  const ChatScreen({
    super.key,
    required this.threadId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatBlocProvider(threadId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => _handleMenuAction(context, ref, value),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'clear',
                child: Row(
                  children: [
                    Icon(Icons.clear_all, size: 18),
                    SizedBox(width: 8),
                    Text('Clear Chat'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings, size: 18),
                    SizedBox(width: 8),
                    Text('Settings'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages area
          Expanded(
            child: messages.isEmpty
                ? _buildEmptyState(context)
                : _buildMessagesList(context, messages, ref),
          ),

          // Message input
          MessageInput(
            onSendText: (text) {
              ref
                  .read(chatBlocProvider(threadId).notifier)
                  .sendTextMessage(text);
            },
            onSendAudio: (filePath) {
              ref
                  .read(chatBlocProvider(threadId).notifier)
                  .sendAudioMessage(filePath);
            },
            onSendImage: (filePath) {
              ref
                  .read(chatBlocProvider(threadId).notifier)
                  .sendImageMessage(filePath);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Start a conversation',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Send a message, record audio, or share an image',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade500,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList(
      BuildContext context, List<dynamic> messages, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return MessageBubble(
          message: message,
          onDelete: () => _deleteMessage(ref, message.id),
        );
      },
    );
  }

  void _handleMenuAction(BuildContext context, WidgetRef ref, String action) {
    switch (action) {
      case 'clear':
        _showClearConfirmDialog(context, ref);
        break;
      case 'settings':
        // Navigate to settings
        Navigator.pushNamed(context, '/configuration');
        break;
    }
  }

  void _showClearConfirmDialog(BuildContext context, WidgetRef ref) {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Chat'),
        content: const Text(
          'Are you sure you want to clear all messages? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear'),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true) {
        ref.read(chatBlocProvider(threadId).notifier).clearMessages();
      }
    });
  }

  void _deleteMessage(WidgetRef ref, int messageId) {
    ref.read(chatBlocProvider(threadId).notifier).deleteMessage(messageId);
  }
}
