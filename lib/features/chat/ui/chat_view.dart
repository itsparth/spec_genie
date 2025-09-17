import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routing/routes/app_routes.dart';
import '../../modes/bloc/modes_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_state.dart';
import 'chat_input_widget.dart';
import 'message_item_widget.dart';

/// Main chat view page that displays messages and chat input
class ChatView extends ConsumerStatefulWidget {
  final int threadId;

  const ChatView({
    super.key,
    required this.threadId,
  });

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatBlocProvider(widget.threadId));
    final chatBloc = ref.read(chatBlocProvider(widget.threadId).notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.auto_awesome),
            onPressed: () => _showModeSelection(context),
            tooltip: 'Generate',
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: _buildMessagesList(chatState, chatBloc),
          ),

          // Chat input at bottom
          ChatInputWidget(
            threadId: widget.threadId,
            onSend: _handleSendMessage,
            padding: const EdgeInsets.all(16),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList(ChatState chatState, ChatBloc chatBloc) {
    if (chatState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (chatState.messages.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: chatState.messages.length,
      itemBuilder: (context, index) {
        final messageState = chatState.messages[index];
        return MessageItemWidget(
          messageState: messageState,
          onTagAdd: (int tagId) =>
              chatBloc.addMessageTag(messageState.message.id, tagId),
          onTagRemove: (int tagId) =>
              chatBloc.removeMessageTag(messageState.message.id, tagId),
          onDelete: () => chatBloc.removeMessage(messageState.message.id),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 64,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
          ),
          const SizedBox(height: 16),
          Text(
            'Start a conversation',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Type a message, record audio, or add files to begin',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
          ),
        ],
      ),
    );
  }

  void _handleSendMessage() {
    // Scroll to bottom when a new message is sent
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _showModeSelection(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, child) {
            final modeState = ref.watch(modesBlocProvider);

            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Mode',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  if (modeState.modes.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('No modes available'),
                    )
                  else
                    ...modeState.modes.map((mode) => ListTile(
                          leading: const Icon(Icons.psychology),
                          title: Text(mode.name),
                          subtitle: Text(mode.prompt),
                          onTap: () {
                            Navigator.pop(context);
                            ModeOutputRoute(
                              threadId: widget.threadId.toString(),
                              modeId: mode.id.toString(),
                            ).go(context);
                          },
                        )),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
