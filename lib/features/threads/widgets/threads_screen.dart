import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/threads_bloc.dart';
import 'thread_list_item.dart';
import 'create_thread_button.dart';

class ThreadsScreen extends ConsumerWidget {
  const ThreadsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final threads = ref.watch(threadsBlocProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversations'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => _handleSortOption(ref, value),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'date',
                child: Text('Sort by Date'),
              ),
              const PopupMenuItem(
                value: 'name',
                child: Text('Sort by Name'),
              ),
              const PopupMenuItem(
                value: 'activity',
                child: Text('Sort by Activity'),
              ),
            ],
          ),
        ],
      ),
      body: threads.isEmpty
          ? _buildEmptyState(context)
          : _buildThreadsList(context, threads, ref),
      floatingActionButton: const CreateThreadButton(),
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
            'No conversations yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start a new conversation to begin',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade500,
                ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              // This will be handled by CreateThreadButton
            },
            icon: const Icon(Icons.add),
            label: const Text('New Conversation'),
          ),
        ],
      ),
    );
  }

  Widget _buildThreadsList(
      BuildContext context, List<dynamic> threads, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        // Refresh threads from database
        ref.invalidate(threadsBlocProvider);
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: threads.length,
        itemBuilder: (context, index) {
          final thread = threads[index];
          return ThreadListItem(
            thread: thread,
            onTap: () => _navigateToChat(context, thread),
            onDelete: () => _deleteThread(ref, thread.id),
            onRename: (newName) => _renameThread(ref, thread.id, newName),
          );
        },
      ),
    );
  }

  void _handleSortOption(WidgetRef ref, String option) {
    final notifier = ref.read(threadsBlocProvider.notifier);
    switch (option) {
      case 'date':
        notifier.sortByDateDescending();
        break;
      case 'name':
        notifier.sortByName();
        break;
      case 'activity':
        notifier.sortByMessageCount();
        break;
    }
  }

  void _navigateToChat(BuildContext context, dynamic thread) {
    // TODO: Navigate to chat screen using go_router
    // context.push('/chat/${thread.id}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening chat for: ${thread.name}'),
      ),
    );
  }

  void _deleteThread(WidgetRef ref, int threadId) {
    ref.read(threadsBlocProvider.notifier).deleteThread(threadId);
  }

  void _renameThread(WidgetRef ref, int threadId, String newName) {
    ref.read(threadsBlocProvider.notifier).updateThreadName(threadId, newName);
  }
}
