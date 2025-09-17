import 'package:flutter/material.dart';
import '../models/mode.dart';

class ModeDialog extends StatefulWidget {
  final Mode? mode;
  final Future<void> Function(String name, String prompt) onSave;
  final VoidCallback? onDelete;

  const ModeDialog({
    super.key,
    this.mode,
    required this.onSave,
    this.onDelete,
  });

  @override
  State<ModeDialog> createState() => _ModeDialogState();
}

class _ModeDialogState extends State<ModeDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _promptController;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.mode?.name ?? '');
    _promptController = TextEditingController(text: widget.mode?.prompt ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.mode != null;
    final title = isEditing ? 'Edit Mode' : 'Create Mode';

    return AlertDialog(
      title: Text(title),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name *',
                hintText: 'Enter mode name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name is required';
                }
                if (value.trim().length > 50) {
                  return 'Name must be 50 characters or less';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              enabled: !_isLoading,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _promptController,
              decoration: const InputDecoration(
                labelText: 'Prompt *',
                hintText: 'Enter the system prompt for this mode',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Prompt is required';
                }
                if (value.trim().length > 1000) {
                  return 'Prompt must be 1000 characters or less';
                }
                return null;
              },
              maxLines: 5,
              textInputAction: TextInputAction.done,
              enabled: !_isLoading,
            ),
          ],
        ),
      ),
      actions: [
        // Delete button (only if editing an editable mode)
        if (isEditing && widget.mode!.isEditable && widget.onDelete != null)
          TextButton(
            onPressed:
                _isLoading ? null : () => _showDeleteConfirmation(context),
            child: Text(
              'Delete',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),

        // Cancel button
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),

        // Save button
        FilledButton(
          onPressed: _isLoading ? null : _handleSave,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Save'),
        ),
      ],
    );
  }

  void _handleSave() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final name = _nameController.text.trim();
      final prompt = _promptController.text.trim();
      await widget.onSave(name, prompt);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving mode: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Mode'),
        content: Text(
          'Are you sure you want to delete "${widget.mode!.name}"? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true && widget.onDelete != null) {
        setState(() {
          _isLoading = true;
        });
        widget.onDelete!();
      }
    });
  }
}
