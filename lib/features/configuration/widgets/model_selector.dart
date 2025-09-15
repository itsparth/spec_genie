import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/configuration_bloc.dart';
import '../models/configuration.dart';

class ModelSelector extends ConsumerWidget {
  final Configuration configuration;

  const ModelSelector({
    super.key,
    required this.configuration,
  });

  static const List<ModelOption> availableModels = [
    ModelOption(
      name: 'gpt-4',
      displayName: 'GPT-4',
      description: 'Most capable model, best for complex tasks',
      isRecommended: true,
    ),
    ModelOption(
      name: 'gpt-4-turbo',
      displayName: 'GPT-4 Turbo',
      description: 'Faster GPT-4 with updated knowledge',
      isRecommended: false,
    ),
    ModelOption(
      name: 'gpt-3.5-turbo',
      displayName: 'GPT-3.5 Turbo',
      description: 'Fast and cost-effective for most tasks',
      isRecommended: false,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: configuration.modelName,
          decoration: const InputDecoration(
            labelText: 'AI Model',
            prefixIcon: Icon(Icons.psychology),
          ),
          items: availableModels.map((model) {
            return DropdownMenuItem<String>(
              value: model.name,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(model.displayName),
                            if (model.isRecommended) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'RECOMMENDED',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade800,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        Text(
                          model.description,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey.shade600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              ref
                  .read(configurationBlocProvider.notifier)
                  .updateModelName(value);
            }
          },
        ),

        const SizedBox(height: 16),

        // Model Information Card
        _buildModelInfo(context, configuration.modelName),
      ],
    );
  }

  Widget _buildModelInfo(BuildContext context, String modelName) {
    final selectedModel = availableModels.firstWhere(
      (model) => model.name == modelName,
      orElse: () => const ModelOption(
        name: 'custom',
        displayName: 'Custom Model',
        description: 'Custom or unknown model',
        isRecommended: false,
      ),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.blue.shade700,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                'Selected: ${selectedModel.displayName}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            selectedModel.description,
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: 12,
            ),
          ),
          if (selectedModel.name == 'custom') ...[
            const SizedBox(height: 8),
            Text(
              'Note: Make sure your API endpoint supports this model',
              style: TextStyle(
                color: Colors.orange.shade700,
                fontSize: 11,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class ModelOption {
  final String name;
  final String displayName;
  final String description;
  final bool isRecommended;

  const ModelOption({
    required this.name,
    required this.displayName,
    required this.description,
    required this.isRecommended,
  });
}
