import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/modes_bloc.dart';
import '../../../models/mode.dart';

class ModeSelector extends ConsumerWidget {
  final String? selectedModeId;
  final ValueChanged<String?> onChanged;
  final bool showLabel;
  final String? labelText;
  final String? hintText;

  const ModeSelector({
    super.key,
    this.selectedModeId,
    required this.onChanged,
    this.showLabel = true,
    this.labelText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modes = ref.watch(modesBlocProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              labelText ?? 'Generation Mode',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        DropdownButtonFormField<String>(
          value: selectedModeId,
          hint: Text(hintText ?? 'Select a mode'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
          isExpanded: true,
          items: _buildDropdownItems(modes),
          onChanged: onChanged,
        ),
        if (selectedModeId != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _buildModePreview(modes, selectedModeId!),
          ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List<Mode> modes) {
    final defaultModes = modes.where((m) => m.isDefault).toList();
    final customModes = modes.where((m) => !m.isDefault).toList();

    final items = <DropdownMenuItem<String>>[];

    // Add default modes
    if (defaultModes.isNotEmpty) {
      for (final mode in defaultModes) {
        items.add(DropdownMenuItem<String>(
          value: mode.id,
          child: Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Colors.amber.shade600,
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(mode.name)),
            ],
          ),
        ));
      }

      // Add separator if there are custom modes too
      if (customModes.isNotEmpty) {
        items.add(const DropdownMenuItem<String>(
          enabled: false,
          value: '',
          child: Divider(height: 1),
        ));
      }
    }

    // Add custom modes
    for (final mode in customModes) {
      items.add(DropdownMenuItem<String>(
        value: mode.id,
        child: Row(
          children: [
            Icon(
              Icons.psychology,
              size: 16,
              color: Colors.blue.shade600,
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(mode.name)),
          ],
        ),
      ));
    }

    return items;
  }

  Widget _buildModePreview(List<Mode> modes, String modeId) {
    final mode = modes.firstWhere(
      (m) => m.id == modeId,
      orElse: () => Mode(id: '', name: '', prompt: ''),
    );

    if (mode.prompt.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                mode.isDefault ? Icons.star : Icons.psychology,
                size: 14,
                color: mode.isDefault
                    ? Colors.amber.shade600
                    : Colors.blue.shade600,
              ),
              const SizedBox(width: 4),
              Text(
                'System Prompt',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            mode.prompt,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
