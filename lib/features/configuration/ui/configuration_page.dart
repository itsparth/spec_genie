import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigurationPage extends ConsumerWidget {
  const ConfigurationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Model Configuration Card
          Card(
            child: ListTile(
              leading: const Icon(Icons.smart_toy),
              title: const Text('Model Configuration'),
              subtitle: const Text('Configure AI model settings and API keys'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to model configuration page
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Model Configuration - Coming soon'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),

          // Modes Card
          Card(
            child: ListTile(
              leading: const Icon(Icons.tune),
              title: const Text('Modes'),
              subtitle: const Text('Manage different operation modes'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to modes configuration
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Modes Configuration - Coming soon'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),

          // Tags Card
          Card(
            child: ListTile(
              leading: const Icon(Icons.label),
              title: const Text('Tags'),
              subtitle: const Text('Organize content with custom tags'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to tags configuration
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tags Configuration - Coming soon'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Info Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Configuration Settings',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Customize your Spec Genie experience by configuring these settings:',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• Model Configuration: Set up AI models and API credentials\n'
                    '• Modes: Configure different operational modes\n'
                    '• Tags: Manage labels for organizing your content',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
