import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/configuration_bloc.dart';

class ModelConfigurationPage extends ConsumerWidget {
  const ModelConfigurationPage({super.key});

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? _validateApiKey(String? value) {
    return _validateRequired(value, 'API Key');
  }

  String? _validateModelName(String? value) {
    return _validateRequired(value, 'Model Name');
  }

  String? _validateBaseUrl(String? value) {
    if (value != null && value.isNotEmpty) {
      final uri = Uri.tryParse(value);
      if (uri == null || (!uri.isScheme('http') && !uri.isScheme('https'))) {
        return 'Please enter a valid URL (http:// or https://)';
      }
    }
    return null; // Base URL is optional
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configurationBlocProvider);

    // Create controllers and initialize with current config values
    final formKey = GlobalKey<FormState>();
    final apiKeyController = TextEditingController(text: config.apiKey);
    final modelNameController = TextEditingController(text: config.modelName);
    final baseUrlController = TextEditingController(text: config.baseUrl ?? '');

    Future<void> saveConfiguration() async {
      if (!formKey.currentState!.validate()) {
        return;
      }

      try {
        final notifier = ref.read(configurationBlocProvider.notifier);

        // Update the configuration state
        notifier.updateApiKey(apiKeyController.text.trim());
        notifier.updateModelName(modelNameController.text.trim());
        notifier.updateBaseUrl(baseUrlController.text.trim().isEmpty
            ? null
            : baseUrlController.text.trim());

        // Save to database
        await notifier.save();

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Configuration saved successfully'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pop();
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to save configuration: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Model Configuration'),
        elevation: 0,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'OpenAI Configuration',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),

                    // API Key Field
                    TextFormField(
                      controller: apiKeyController,
                      decoration: const InputDecoration(
                        labelText: 'API Key *',
                        hintText: 'sk-...',
                        prefixIcon: Icon(Icons.key),
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: _validateApiKey,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),

                    // Model Name Field
                    TextFormField(
                      controller: modelNameController,
                      decoration: const InputDecoration(
                        labelText: 'Model Name *',
                        hintText: 'gpt-4o-mini',
                        prefixIcon: Icon(Icons.smart_toy),
                        border: OutlineInputBorder(),
                      ),
                      validator: _validateModelName,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),

                    // Base URL Field
                    TextFormField(
                      controller: baseUrlController,
                      decoration: const InputDecoration(
                        labelText: 'Base URL (Optional)',
                        hintText: 'https://api.openai.com',
                        prefixIcon: Icon(Icons.link),
                        border: OutlineInputBorder(),
                        helperText: 'Leave empty to use the default OpenAI API',
                      ),
                      validator: _validateBaseUrl,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      onFieldSubmitted: (_) => saveConfiguration(),
                    ),
                    const SizedBox(height: 24),

                    // Save Button
                    ElevatedButton(
                      onPressed: saveConfiguration,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Save Configuration',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Info Card
            Card(
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Configuration Help',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '• API Key: Your OpenAI API key (required)\n'
                      '• Model Name: The OpenAI model to use (e.g., gpt-4o-mini, gpt-4)\n'
                      '• Base URL: Custom API endpoint (optional, for OpenAI-compatible services)',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
