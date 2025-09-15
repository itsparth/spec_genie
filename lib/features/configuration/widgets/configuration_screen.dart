import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/configuration_bloc.dart';
import 'api_settings_form.dart';
import 'model_selector.dart';

class ConfigurationScreen extends ConsumerWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configuration = ref.watch(configurationBlocProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // API Settings Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'API Settings',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    ApiSettingsForm(configuration: configuration),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Model Selection Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Model Configuration',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    ModelSelector(configuration: configuration),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Audio Processing Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Audio Processing',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: const Text('Transcribe Audio First'),
                      subtitle: const Text(
                        'Transcribe audio to text before processing with AI modes',
                      ),
                      value: configuration.transcribeAudioFirst,
                      onChanged: (value) {
                        ref
                            .read(configurationBlocProvider.notifier)
                            .toggleTranscribeAudioFirst();
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Validation Status
            _buildValidationStatus(context, configuration),
          ],
        ),
      ),
    );
  }

  Widget _buildValidationStatus(BuildContext context, Configuration config) {
    final isValid = config.isValid;

    return Card(
      color: isValid ? Colors.green.shade50 : Colors.red.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              isValid ? Icons.check_circle : Icons.error,
              color: isValid ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                isValid
                    ? 'Configuration is valid and ready to use'
                    : 'Please complete the configuration to continue',
                style: TextStyle(
                  color: isValid ? Colors.green.shade800 : Colors.red.shade800,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
