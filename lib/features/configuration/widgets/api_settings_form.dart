import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/configuration_bloc.dart';
import '../models/configuration.dart';

class ApiSettingsForm extends ConsumerStatefulWidget {
  final Configuration configuration;

  const ApiSettingsForm({
    super.key,
    required this.configuration,
  });

  @override
  ConsumerState<ApiSettingsForm> createState() => _ApiSettingsFormState();
}

class _ApiSettingsFormState extends ConsumerState<ApiSettingsForm> {
  late final TextEditingController _apiKeyController;
  late final TextEditingController _baseUrlController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _apiKeyController =
        TextEditingController(text: widget.configuration.apiKey);
    _baseUrlController =
        TextEditingController(text: widget.configuration.baseUrl ?? '');
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    _baseUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // API Key Field
          TextFormField(
            controller: _apiKeyController,
            decoration: InputDecoration(
              labelText: 'API Key',
              hintText: 'Enter your OpenAI API key',
              prefixIcon: const Icon(Icons.key),
              suffixIcon: IconButton(
                icon: const Icon(Icons.help_outline),
                onPressed: () => _showApiKeyHelp(context),
              ),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'API key is required';
              }
              if (value.length < 10) {
                return 'API key seems too short';
              }
              return null;
            },
            onChanged: (value) {
              ref.read(configurationBlocProvider.notifier).updateApiKey(value);
            },
          ),

          const SizedBox(height: 16),

          // Base URL Field (Optional)
          TextFormField(
            controller: _baseUrlController,
            decoration: InputDecoration(
              labelText: 'Custom Base URL (Optional)',
              hintText: 'https://api.openai.com/v1',
              prefixIcon: const Icon(Icons.link),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _baseUrlController.clear();
                  ref
                      .read(configurationBlocProvider.notifier)
                      .updateBaseUrl(null);
                },
              ),
            ),
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                final uri = Uri.tryParse(value);
                if (uri == null || !uri.hasScheme) {
                  return 'Please enter a valid URL';
                }
              }
              return null;
            },
            onChanged: (value) {
              final baseUrl = value.isEmpty ? null : value;
              ref
                  .read(configurationBlocProvider.notifier)
                  .updateBaseUrl(baseUrl);
            },
          ),

          const SizedBox(height: 16),

          // Connection Status
          _buildConnectionStatus(),
        ],
      ),
    );
  }

  Widget _buildConnectionStatus() {
    final config = widget.configuration;
    final hasValidKey = config.hasValidApiKey;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: hasValidKey ? Colors.green.shade50 : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: hasValidKey ? Colors.green.shade200 : Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Icon(
            hasValidKey ? Icons.check_circle_outline : Icons.info_outline,
            color: hasValidKey ? Colors.green : Colors.grey.shade600,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              hasValidKey
                  ? 'Using ${config.effectiveBaseUrl}'
                  : 'Enter API key to enable AI features',
              style: TextStyle(
                color:
                    hasValidKey ? Colors.green.shade800 : Colors.grey.shade700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showApiKeyHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('API Key Help'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('You need an API key to use AI features.'),
            SizedBox(height: 8),
            Text('For OpenAI:'),
            Text('1. Visit https://platform.openai.com/api-keys'),
            Text('2. Create a new secret key'),
            Text('3. Copy and paste it here'),
            SizedBox(height: 8),
            Text('For custom providers:'),
            Text('• Use your provider\'s API key format'),
            Text('• Update the Base URL if needed'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}
