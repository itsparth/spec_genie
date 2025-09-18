import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/modes_bloc.dart';
import '../models/mode.dart';
import 'mode_dialog.dart';

class ModesPage extends ConsumerWidget {
  const ModesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modeState = ref.watch(modesBlocProvider);
    final modesBloc = ref.read(modesBlocProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modes'),
        elevation: 0,
      ),
      body: modeState.modes.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.psychology_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No modes yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Create your first mode to get started',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: modeState.modes.length,
              itemBuilder: (context, index) {
                final mode = modeState.modes[index];
                return _ModeListItem(
                  mode: mode,
                  onTap: () => _showModeDialog(context, modesBloc, mode),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModeDialog(context, modesBloc, null),
        tooltip: 'Add Mode',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showModeDialog(BuildContext context, ModesBloc modesBloc, Mode? mode) {
    showDialog<void>(
      context: context,
      builder: (context) => ModeDialog(
        mode: mode,
        onSave: (String name, String prompt) async {
          if (mode == null) {
            // Creating new mode
            await modesBloc.create(name: name, prompt: prompt);
          } else {
            // Updating existing mode
            await modesBloc.update(mode.id, name: name, prompt: prompt);
          }
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        },
        onDelete: mode != null && mode.isEditable
            ? () async {
                await modesBloc.remove(mode.id);
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              }
            : null,
      ),
    );
  }
}

class _ModeListItem extends StatelessWidget {
  final Mode mode;
  final VoidCallback onTap;

  const _ModeListItem({
    required this.mode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: mode.isEditable
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            Icons.psychology,
            color: mode.isEditable
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : Theme.of(context).colorScheme.onSurfaceVariant,
            size: 20,
          ),
        ),
        title: Text(
          mode.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: mode.isEditable
                ? Theme.of(context).colorScheme.onSurface
                : Colors.grey,
          ),
        ),
        subtitle: Text(
          mode.prompt,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: mode.isEditable
            ? Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                size: 20,
              )
            : const Icon(
                Icons.lock_outlined,
                color: Colors.grey,
                size: 16,
              ),
        onTap: mode.isEditable ? onTap : null,
      ),
    );
  }
}
