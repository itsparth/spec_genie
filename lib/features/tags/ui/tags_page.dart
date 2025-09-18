import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/tags_bloc.dart';
import '../models/tag.dart';
import 'tag_dialog.dart';

class TagsPage extends ConsumerWidget {
  const TagsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagState = ref.watch(tagsBlocProvider);
    final tagsBloc = ref.read(tagsBlocProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tags'),
        elevation: 0,
      ),
      body: tagState.tags.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.label_outline,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No tags yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Create your first tag to get started',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: tagState.tags.length,
              itemBuilder: (context, index) {
                final tag = tagState.tags[index];
                return _TagListItem(
                  tag: tag,
                  onTap: () => _showTagDialog(context, tagsBloc, tag),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTagDialog(context, tagsBloc, null),
        tooltip: 'Add Tag',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showTagDialog(BuildContext context, TagsBloc tagsBloc, Tag? tag) {
    showDialog<void>(
      context: context,
      builder: (context) => TagDialog(
        tag: tag,
        onSave: (String name, String description) async {
          if (tag == null) {
            // Creating new tag
            await tagsBloc.create(name: name, description: description);
          } else {
            // Updating existing tag
            await tagsBloc.update(tag.id, name: name, description: description);
          }
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        },
        onDelete: tag != null && tag.isEditable
            ? () async {
                await tagsBloc.remove(tag.id);
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              }
            : null,
      ),
    );
  }
}

class _TagListItem extends StatelessWidget {
  final Tag tag;
  final VoidCallback onTap;

  const _TagListItem({
    required this.tag,
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
            color: tag.isEditable
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            Icons.label,
            color: tag.isEditable
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : Theme.of(context).colorScheme.onSurfaceVariant,
            size: 20,
          ),
        ),
        title: Text(
          tag.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: tag.isEditable
                ? Theme.of(context).colorScheme.onSurface
                : Colors.grey,
          ),
        ),
        subtitle: tag.description.isNotEmpty
            ? Text(
                tag.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            : null,
        trailing: tag.isEditable
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
        onTap: tag.isEditable ? onTap : null,
      ),
    );
  }
}
