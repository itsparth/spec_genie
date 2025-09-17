import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/tags_bloc.dart';
import '../bloc/tag_selection_bloc.dart';
import '../models/tag.dart';
import '../utils/tag_color_utils.dart';
import 'tag_dialog.dart';

class TagsSelectionWidget extends ConsumerWidget {
  final String selectionKey;
  final void Function(List<String>)? onTagsChanged;
  final void Function(List<Tag>)? onTagObjectsChanged;
  final String? title;
  final bool showCreateButton;
  final int? maxSelections;

  const TagsSelectionWidget({
    super.key,
    required this.selectionKey,
    this.onTagsChanged,
    this.onTagObjectsChanged,
    this.title,
    this.showCreateButton = true,
    this.maxSelections,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionState = ref.watch(tagSelectionBlocProvider(selectionKey));

    return InkWell(
      onTap: () => _showTagSelectionPopup(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: 200,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.label_outline,
                size: 16,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: selectionState.selectedTags.isEmpty
                    ? Text(
                        title ?? 'Select Tags',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      )
                    : Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: selectionState.selectedTags.map((tag) {
                          return _CompactTagChip(tag: tag);
                        }).toList(),
                      ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTagSelectionPopup(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => _TagSelectionPopup(
        selectionKey: selectionKey,
        title: title ?? 'Select Tags',
        showCreateButton: showCreateButton,
        maxSelections: maxSelections,
      ),
    );
  }
}

class _CompactTagChip extends StatelessWidget {
  final Tag tag;

  const _CompactTagChip({required this.tag});

  @override
  Widget build(BuildContext context) {
    final color = TagColorUtils.getTagColor(tag.name);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag.name,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _TagSelectionPopup extends ConsumerStatefulWidget {
  final String selectionKey;
  final String title;
  final bool showCreateButton;
  final int? maxSelections;

  const _TagSelectionPopup({
    required this.selectionKey,
    required this.title,
    required this.showCreateButton,
    this.maxSelections,
  });

  @override
  ConsumerState<_TagSelectionPopup> createState() => _TagSelectionPopupState();
}

class _TagSelectionPopupState extends ConsumerState<_TagSelectionPopup> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tagState = ref.watch(tagsBlocProvider);
    final selectionState =
        ref.watch(tagSelectionBlocProvider(widget.selectionKey));
    final selectionBloc =
        ref.read(tagSelectionBlocProvider(widget.selectionKey).notifier);
    final tagsBloc = ref.read(tagsBlocProvider.notifier);

    final filteredTags = tagState.tags.where((tag) {
      return tag.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          tag.description.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Dialog(
      child: Container(
        width: 400,
        height: 500,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Search bar
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search tags...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Max selections info
            if (widget.maxSelections != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Maximum ${widget.maxSelections!} tag${widget.maxSelections! == 1 ? '' : 's'} allowed (${selectionState.selectedTags.length}/${widget.maxSelections!})',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),

            // Tags list
            Expanded(
              child: ListView(
                children: [
                  // Available tags
                  ...filteredTags.map((tag) {
                    final isSelected =
                        selectionState.selectedTags.any((t) => t.id == tag.id);
                    final canSelect = widget.maxSelections == null ||
                        selectionState.selectedTags.length <
                            widget.maxSelections! ||
                        isSelected;

                    return _TagListItem(
                      tag: tag,
                      isSelected: isSelected,
                      canSelect: canSelect,
                      onTap: () {
                        if (isSelected) {
                          selectionBloc.removeTag(tag);
                        } else if (canSelect) {
                          selectionBloc.addTag(tag);
                        }
                      },
                    );
                  }),

                  // Create new tag option
                  if (widget.showCreateButton && _searchQuery.isNotEmpty) ...[
                    const Divider(),
                    _CreateTagListItem(
                      searchQuery: _searchQuery,
                      onTap: () => _showCreateTagDialog(
                          context, tagsBloc, selectionBloc),
                    ),
                  ],
                ],
              ),
            ),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Done'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateTagDialog(
    BuildContext context,
    TagsBloc tagsBloc,
    TagSelectionBloc selectionBloc,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => TagDialog(
        tag: null,
        onSave: (String name, String description) async {
          final tag =
              await tagsBloc.create(name: name, description: description);
          // Auto-select the newly created tag
          if (tag != null) {
            selectionBloc.addTag(tag);
          }
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        },
        onDelete: null,
      ),
    );
  }
}

class _TagListItem extends StatelessWidget {
  final Tag tag;
  final bool isSelected;
  final bool canSelect;
  final VoidCallback onTap;

  const _TagListItem({
    required this.tag,
    required this.isSelected,
    required this.canSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = TagColorUtils.getTagColor(tag.name);

    return ListTile(
      onTap: canSelect ? onTap : null,
      leading: Icon(
        isSelected ? Icons.check_circle : Icons.circle_outlined,
        color: isSelected ? color : Colors.grey,
      ),
      title: Text(
        tag.name,
        style: TextStyle(
          color: isSelected ? color : null,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      subtitle: tag.description.isNotEmpty
          ? Text(
              tag.description,
              style: const TextStyle(fontSize: 12),
            )
          : null,
      trailing: !canSelect && !isSelected
          ? Icon(
              Icons.block,
              color: Colors.grey[400],
              size: 16,
            )
          : null,
    );
  }
}

class _CreateTagListItem extends StatelessWidget {
  final String searchQuery;
  final VoidCallback onTap;

  const _CreateTagListItem({
    required this.searchQuery,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const Icon(
        Icons.add_circle_outline,
        color: Colors.blue,
      ),
      title: Text(
        'Create "${searchQuery.trim()}"',
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: const Text(
        'Add as a new tag',
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
