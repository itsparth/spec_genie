import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routing/routes/app_routes.dart';
import '../../modes/bloc/modes_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../models/chat_state.dart';
import '../bloc/chat_input_bloc.dart';
// Removed unused chat_input_state import after refactor
import 'chat_input_widget.dart';
import 'message_item_widget.dart';

/// Main chat view page that displays messages and chat input
class ChatView extends ConsumerWidget {
  final int? threadId;
  final bool autoStartRecording;

  const ChatView({
    super.key,
    required this.threadId,
    this.autoStartRecording = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();
    // Watch the chat bloc for both new and existing chats
    final chatState = ref.watch(chatBlocProvider(threadId));
    final chatBloc = ref.read(chatBlocProvider(threadId).notifier);

    // Ensure chatInputBloc is created with autoStartRecording parameter
    ref.watch(chatInputBlocProvider(autoStartRecording: autoStartRecording));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.auto_awesome),
            onPressed: () => _showModeSelection(context, ref),
            tooltip: 'Generate',
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: _buildMessagesList(chatState, chatBloc, scrollController),
          ),

          // Chat input at bottom
          ChatInputWidget(
            threadId: threadId,
            onSend: () => _handleSendMessage(scrollController),
            padding: const EdgeInsets.all(16),
            autoStartRecording: autoStartRecording,
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList(ChatState chatState, ChatBloc chatBloc,
      ScrollController scrollController) {
    if (chatState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (chatState.messages.isEmpty) {
      // Use a Builder to provide a context for theming if needed
      return Builder(builder: (ctx) => _buildEmptyState(ctx));
    }

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: chatState.messages.length,
      itemBuilder: (context, index) {
        final message = chatState.messages[index];
        return MessageItemWidget(
          messageId: message.id,
          onDelete: () => chatBloc.removeMessage(message.id),
        );
      },
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
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 16),
          Text(
            'Start a conversation',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.6),
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Type a message, record audio, or add files to begin',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.5),
                ),
          ),
        ],
      ),
    );
  }

  void _handleSendMessage(ScrollController scrollController) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _showModeSelection(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Material(
          child: Consumer(
            builder: (context, ref, child) {
              final modeState = ref.watch(modesBlocProvider);
              final chatState = ref.watch(chatBlocProvider(threadId));

              return DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.3,
                maxChildSize: 0.9,
                expand: false,
                builder: (context, scrollController) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Mode',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: modeState.modes.isEmpty
                              ? const Center(
                                  child: Text('No modes available'),
                                )
                              : ListView.builder(
                                  controller: scrollController,
                                  itemCount: modeState.modes.length,
                                  itemBuilder: (context, index) {
                                    final mode = modeState.modes[index];
                                    return ListTile(
                                      leading: const Icon(Icons.psychology),
                                      title: Text(mode.name),
                                      subtitle: Text(
                                        mode.prompt,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                        if (chatState.threadId != null) {
                                          ModeOutputRoute(
                                            threadId:
                                                chatState.threadId.toString(),
                                            modeId: mode.id.toString(),
                                          ).push<void>(context);
                                        }
                                      },
                                    );
                                  },
                                ),
                        ),
                        // Add some bottom padding to ensure proper touch area
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
