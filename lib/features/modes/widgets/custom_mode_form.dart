import 'package:flutter/material.dart';

class CustomModeForm extends StatefulWidget {
  final String title;
  final String submitLabel;
  final String? initialName;
  final String? initialPrompt;

  const CustomModeForm({
    super.key,
    required this.title,
    required this.submitLabel,
    this.initialName,
    this.initialPrompt,
  });

  @override
  State<CustomModeForm> createState() => _CustomModeFormState();
}

class _CustomModeFormState extends State<CustomModeForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _promptController;
  final FocusNode _promptFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _promptController = TextEditingController(text: widget.initialPrompt ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _promptController.dispose();
    _promptFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: 500,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Mode Name',
                  hintText: 'e.g., Creative Writer, Code Reviewer',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a name for the mode';
                  }
                  if (value.trim().length < 2) {
                    return 'Name must be at least 2 characters';
                  }
                  if (value.trim().length > 50) {
                    return 'Name must be 50 characters or less';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  _promptFocusNode.requestFocus();
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _promptController,
                focusNode: _promptFocusNode,
                decoration: const InputDecoration(
                  labelText: 'System Prompt',
                  hintText: 'Describe how the AI should behave and respond...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 6,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a system prompt';
                  }
                  if (value.trim().length < 10) {
                    return 'Prompt must be at least 10 characters';
                  }
                  if (value.trim().length > 2000) {
                    return 'Prompt must be 2000 characters or less';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Text(
                'Tip: Be specific about the AI\'s role, tone, and expected output format.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _handleSubmit,
          child: Text(widget.submitLabel),
        ),
      ],
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pop({
        'name': _nameController.text.trim(),
        'prompt': _promptController.text.trim(),
      });
    }
  }
}
