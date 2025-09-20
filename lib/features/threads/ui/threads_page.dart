import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routing/routes/app_routes.dart';
import '../bloc/threads_bloc.dart';
import '../bloc/threads_state.dart';
import '../models/thread.dart';
import 'thread_item_widget.dart';
import '../../mode_output/data/mode_outputs_repository.dart';

class ThreadsPage extends ConsumerWidget {
  const ThreadsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThreadsState state = ref.watch(threadsBlocProvider);
    final notifier = ref.read(threadsBlocProvider.notifier);
    // Prefer enriched threadItems if available, else fall back to raw threads
    final items = state.threadItems.isNotEmpty
        ? state.threadItems
        : state.threads.map((t) => ThreadItemState(thread: t)).toList();

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
      body: Builder(
        builder: (context) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return _ErrorView(
              error: state.error!,
              onRetry: () => notifier.reload(),
            );
          }
          if (items.isEmpty) {
            return const _EmptyThreadsView();
          }
          return RefreshIndicator(
            onRefresh: () async => notifier.reload(),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final thread = item.thread;
                final isDeleting = state.deletingIds.contains(thread.id);
                return ThreadItemWidget(
                  thread: thread,
                  isDeleting: isDeleting,
                  onTap: () => _onThreadTap(context, thread),
                  onEdit: () => _onEditThread(context, ref, thread),
                  onDelete: isDeleting
                      ? null
                      : () => _onDeleteThread(context, ref, thread),
                  onOpenLatestOutput: () =>
                      _openLatestOutput(context, ref, thread),
                  onQuickRecord: () => _quickRecord(context, thread),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'fab_mic_new',
            tooltip: 'Quick voice project',
            onPressed: () {
              // Start a brand new chat with recording enabled immediately
              const ChatRoute(
                threadId: 'new',
                autoStartRecording: true,
              ).push<void>(context);
            },
            child: const Icon(Icons.mic),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            heroTag: 'fab_create_new',
            onPressed: () {
              // Navigate to new chat page
              const ChatRoute(threadId: 'new').push<void>(context);
            },
            icon: const Icon(Icons.add),
            label: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _onThreadTap(BuildContext context, Thread thread) {
    ChatRoute(threadId: thread.id.toString()).go(context);
  }

  Future<void> _openLatestOutput(
      BuildContext context, WidgetRef ref, Thread thread) async {
    final repo = ref.read(modeOutputsRepositoryProvider);
    final latestMode = await repo.getLatestUsedModeForThread(thread.id);
    if (latestMode == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No outputs yet for this project')),
      );
      return;
    }
    ModeOutputRoute(
      threadId: thread.id.toString(),
      modeId: latestMode.id.toString(),
    ).push<void>(context);
  }

  void _quickRecord(BuildContext context, Thread thread) {
    ChatRoute(threadId: thread.id.toString(), autoStartRecording: true)
        .push<void>(context);
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
        const ModelConfigurationRoute().push<void>(context);
        break;
      case 'modes':
        const ModesRoute().push<void>(context);
        break;
      case 'tags':
        const TagsRoute().push<void>(context);
        break;
    }
  }
}

class _ErrorView extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;
  const _ErrorView({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
            const SizedBox(height: 12),
            Text(
              'Failed to load projects',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.redAccent),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            )
          ],
        ),
      ),
    );
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
