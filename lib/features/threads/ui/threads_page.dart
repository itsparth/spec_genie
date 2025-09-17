import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routing/routes/app_routes.dart';
import '../bloc/threads_bloc.dart';
import '../models/thread.dart';
import 'thread_item_widget.dart';

class ThreadsPage extends ConsumerWidget {
  const ThreadsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final threads = ref.watch(threadsBlocProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Threads'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Implement add thread functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Add thread - Coming soon'),
                ),
              );
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.settings),
            onSelected: (value) => _onSettingsSelected(context, value),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'model',
                child: ListTile(
                  leading: Icon(Icons.model_training),
                  title: Text('Model Configuration'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem<String>(
                value: 'modes',
                child: ListTile(
                  leading: Icon(Icons.psychology),
                  title: Text('Modes'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem<String>(
                value: 'tags',
                child: ListTile(
                  leading: Icon(Icons.tag),
                  title: Text('Tags'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
      body: threads.isEmpty
          ? const _EmptyThreadsView()
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: threads.length,
              itemBuilder: (context, index) {
                final thread = threads[index];
                return ThreadItemWidget(
                  thread: thread,
                  onTap: () => _onThreadTap(context, thread),
                  onEdit: () => _onEditThread(context, thread),
                  onDelete: () => _onDeleteThread(context, thread),
                );
              },
            ),
    );
  }

  void _onThreadTap(BuildContext context, Thread thread) {
    ChatRoute(threadId: thread.id.toString()).go(context);
  }

  void _onEditThread(BuildContext context, Thread thread) {
    // TODO: Implement edit thread functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Edit thread: ${thread.name}'),
      ),
    );
  }

  void _onDeleteThread(BuildContext context, Thread thread) {
    // TODO: Implement delete thread functionality with confirmation dialog
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Thread'),
          content: Text('Are you sure you want to delete "${thread.name}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Actually delete the thread
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Deleted thread: ${thread.name}'),
                  ),
                );
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _onSettingsSelected(BuildContext context, String value) {
    switch (value) {
      case 'model':
        const ModelConfigurationRoute().go(context);
        break;
      case 'modes':
        const ModesRoute().go(context);
        break;
      case 'tags':
        const TagsRoute().go(context);
        break;
    }
  }
}

class _EmptyThreadsView extends StatelessWidget {
  const _EmptyThreadsView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No threads yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Create your first thread to get started',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
