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
        title: const Text('Projects'),
        elevation: 0,
        actions: [
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
                  onEdit: () => _onEditThread(context, ref, thread),
                  onDelete: () => _onDeleteThread(context, ref, thread),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to new chat page
          const ChatRoute(threadId: 'new').push(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('Create'),
      ),
    );
  }

  void _onThreadTap(BuildContext context, Thread thread) {
    ChatRoute(threadId: thread.id.toString()).go(context);
  }

  void _onEditThread(BuildContext context, WidgetRef ref, Thread thread) {
    final TextEditingController controller =
        TextEditingController(text: thread.name);

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Project'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Project Name',
              border: OutlineInputBorder(),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  ref.read(threadsBlocProvider.notifier).updateThread(
                        thread.id,
                        controller.text.trim(),
                      );
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Project updated successfully'),
                    ),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _onDeleteThread(BuildContext context, WidgetRef ref, Thread thread) {
    // TODO: Implement delete thread functionality with confirmation dialog
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Project'),
          content: Text('Are you sure you want to delete "${thread.name}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(threadsBlocProvider.notifier).deleteThread(thread.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Deleted project: ${thread.name}'),
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
        const ModelConfigurationRoute().push(context);
        break;
      case 'modes':
        const ModesRoute().push(context);
        break;
      case 'tags':
        const TagsRoute().push(context);
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
            'No projects yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Create your first project to get started',
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
