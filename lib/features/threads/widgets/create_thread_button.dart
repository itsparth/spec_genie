import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/threads_bloc.dart';

class CreateThreadButton extends ConsumerWidget {
  const CreateThreadButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: () => _showCreateThreadDialog(context, ref),
      icon: const Icon(Icons.add),
      label: const Text('New Chat'),
    );
  }

  void _showCreateThreadDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Conversation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'You can start with a custom name or leave blank for auto-generation:'),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Conversation name (optional)',
                hintText: 'Leave blank for auto-naming',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
              onSubmitted: (value) {
                Navigator.of(context).pop(value);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final name = controller.text.trim();
              Navigator.of(context).pop(name.isEmpty ? null : name);
            },
            child: const Text('Create'),
          ),
          ElevatedButton(
            onPressed: () {
              // Create and navigate immediately
              final name = controller.text.trim();
              Navigator.of(context)
                  .pop('__create_and_navigate__${name.isEmpty ? '' : name}');
            },
            child: const Text('Create & Open'),
          ),
        ],
      ),
    ).then((result) {
      if (result != null) {
        final shouldNavigate = result.startsWith('__create_and_navigate__');
        final name = shouldNavigate
            ? result.replaceFirst('__create_and_navigate__', '')
            : result;

        // Create the thread
        ref.read(threadsBlocProvider.notifier).createThread(
              name: name.isEmpty ? null : name,
            );

        if (shouldNavigate) {
          // TODO: Navigate to the new thread
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Created new conversation: ${name.isEmpty ? 'Untitled' : name}'),
              action: SnackBarAction(
                label: 'Open',
                onPressed: () {
                  // Navigate to chat
                },
              ),
            ),
          );
        }
      }
    });
  }
}
