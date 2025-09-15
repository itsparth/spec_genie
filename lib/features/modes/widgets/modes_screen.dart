import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/modes_bloc.dart';
import '../models/mode.dart';
import 'mode_selector.dart';
import 'custom_mode_form.dart';

class ModesScreen extends ConsumerWidget {
  const ModesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modes = ref.watch(modesBlocProvider);
    final defaultModes = modes.where((mode) => mode.isDefault).toList();
    final customModes = modes.where((mode) => !mode.isDefault).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generation Modes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showCreateModeDialog(context, ref),
            tooltip: 'Create custom mode',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Default Modes Section
            Text(
              'Default Modes',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Built-in modes that cannot be edited but can be duplicated',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            const SizedBox(height: 16),
            ...defaultModes.map((mode) => _buildModeCard(
                  context,
                  ref,
                  mode,
                  isDefault: true,
                )),

            const SizedBox(height: 32),

            // Custom Modes Section
            Row(
              children: [
                Text(
                  'Custom Modes',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${customModes.length}',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Custom modes you\'ve created and can modify',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            const SizedBox(height: 16),

            if (customModes.isEmpty)
              _buildEmptyCustomModes(context, ref)
            else
              ...customModes.map((mode) => _buildModeCard(
                    context,
                    ref,
                    mode,
                    isDefault: false,
                  )),
          ],
        ),
      ),
    );
  }

  Widget _buildModeCard(BuildContext context, WidgetRef ref, Mode mode,
      {required bool isDefault}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    mode.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (isDefault)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'DEFAULT',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ),
                PopupMenuButton<String>(
                  onSelected: (value) => _handleModeAction(
                    context,
                    ref,
                    mode,
                    value,
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'duplicate',
                      child: Row(
                        children: [
                          Icon(Icons.copy, size: 18),
                          SizedBox(width: 8),
                          Text('Duplicate'),
                        ],
                      ),
                    ),
                    if (!isDefault) ...[
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit, size: 18),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, size: 18, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Delete', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              mode.prompt,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade700,
                  ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyCustomModes(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.grey.shade50,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(
              Icons.psychology_outlined,
              size: 48,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'No custom modes yet',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create your own AI generation modes with custom prompts',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade500,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _showCreateModeDialog(context, ref),
              icon: const Icon(Icons.add),
              label: const Text('Create Mode'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleModeAction(
    BuildContext context,
    WidgetRef ref,
    Mode mode,
    String action,
  ) {
    switch (action) {
      case 'duplicate':
        _showDuplicateModeDialog(context, ref, mode);
        break;
      case 'edit':
        _showEditModeDialog(context, ref, mode);
        break;
      case 'delete':
        _showDeleteConfirmDialog(context, ref, mode);
        break;
    }
  }

  void _showCreateModeDialog(BuildContext context, WidgetRef ref) {
    showDialog<Map<String, String>>(
      context: context,
      builder: (context) => const CustomModeForm(
        title: 'Create Custom Mode',
        submitLabel: 'Create',
      ),
    ).then((result) {
      if (result != null) {
        ref.read(modesBlocProvider.notifier).addCustomMode(
              name: result['name']!,
              prompt: result['prompt']!,
            );
      }
    });
  }

  void _showDuplicateModeDialog(
      BuildContext context, WidgetRef ref, Mode mode) {
    final controller = TextEditingController(text: '${mode.name} (Copy)');

    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Duplicate Mode'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'New mode name',
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
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                Navigator.of(context).pop(name);
              }
            },
            child: const Text('Duplicate'),
          ),
        ],
      ),
    ).then((newName) {
      if (newName != null) {
        ref.read(modesBlocProvider.notifier).duplicateMode(mode.id, newName);
      }
    });
  }

  void _showEditModeDialog(BuildContext context, WidgetRef ref, Mode mode) {
    showDialog<Map<String, String>>(
      context: context,
      builder: (context) => CustomModeForm(
        title: 'Edit Mode',
        submitLabel: 'Save',
        initialName: mode.name,
        initialPrompt: mode.prompt,
      ),
    ).then((result) {
      if (result != null) {
        ref.read(modesBlocProvider.notifier).updateMode(
              mode.id,
              name: result['name']!,
              prompt: result['prompt']!,
            );
      }
    });
  }

  void _showDeleteConfirmDialog(
      BuildContext context, WidgetRef ref, Mode mode) {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Mode'),
        content: Text(
          'Are you sure you want to delete "${mode.name}"? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true) {
        ref.read(modesBlocProvider.notifier).deleteMode(mode.id);
      }
    });
  }
}
