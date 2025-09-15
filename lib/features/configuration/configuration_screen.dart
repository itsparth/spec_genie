import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spec_genie/models/configuration.dart';
import 'package:spec_genie/services/storage_service.dart';

/// Configuration screen for app settings and API configuration
class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen>
    with SingleTickerProviderStateMixin {
  final StorageService _storage = StorageService.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TabController _tabController;
  late Configuration _config;
  bool _isLoading = true;
  bool _isSaving = false;
  String? _error;

  // Form controllers
  late TextEditingController _apiKeyController;
  late TextEditingController _systemPromptController;
  late TextEditingController _maxTokensController;
  late TextEditingController _temperatureController;
  late TextEditingController _maxFileSizeController;
  late TextEditingController _maxRecordingDurationController;
  late TextEditingController _maxCachedOutputsController;

  // Form values
  String _selectedModel = 'gpt-4';
  String? _selectedSttModel;
  bool _enableAudioTranscription = true;
  bool _enableSpeechToText = true;
  bool _enableImageProcessing = true;
  bool _enableFileProcessing = true;
  bool _enableOutputCaching = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _initializeControllers();
    _loadConfiguration();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _disposeControllers();
    super.dispose();
  }

  void _initializeControllers() {
    _apiKeyController = TextEditingController();
    _systemPromptController = TextEditingController();
    _maxTokensController = TextEditingController();
    _temperatureController = TextEditingController();
    _maxFileSizeController = TextEditingController();
    _maxRecordingDurationController = TextEditingController();
    _maxCachedOutputsController = TextEditingController();
  }

  void _disposeControllers() {
    _apiKeyController.dispose();
    _systemPromptController.dispose();
    _maxTokensController.dispose();
    _temperatureController.dispose();
    _maxFileSizeController.dispose();
    _maxRecordingDurationController.dispose();
    _maxCachedOutputsController.dispose();
  }

  Future<void> _loadConfiguration() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      _config = await _storage.getConfiguration();

      // Update controllers with loaded values
      _apiKeyController.text = _config.openAIApiKey;
      _systemPromptController.text = _config.systemPrompt;
      _maxTokensController.text = _config.maxTokens.toString();
      _temperatureController.text = _config.temperature.toString();
      _maxFileSizeController.text = _config.maxFileSizeMB.toStringAsFixed(1);
      _maxRecordingDurationController.text =
          _config.maxRecordingDurationSeconds.toString();
      _maxCachedOutputsController.text = _config.maxCachedOutputs.toString();

      // Update form values
      _selectedModel = _config.defaultModel;
      _selectedSttModel = _config.sttModel;
      _enableAudioTranscription = _config.enableAudioTranscription;
      _enableSpeechToText = _config.enableSpeechToText;
      _enableImageProcessing = _config.enableImageProcessing;
      _enableFileProcessing = _config.enableFileProcessing;
      _enableOutputCaching = _config.enableOutputCaching;

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load configuration: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _saveConfiguration() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() {
        _isSaving = true;
        _error = null;
      });

      final updatedConfig = _config.copyWith(
        openAIApiKey: _apiKeyController.text.trim(),
        defaultModel: _selectedModel,
        maxTokens: int.parse(_maxTokensController.text),
        temperature: double.parse(_temperatureController.text),
        systemPrompt: _systemPromptController.text.trim(),
        enableAudioTranscription: _enableAudioTranscription,
        enableSpeechToText: _enableSpeechToText,
        sttModel: _selectedSttModel,
        enableImageProcessing: _enableImageProcessing,
        enableFileProcessing: _enableFileProcessing,
        maxFileSizeBytes:
            (double.parse(_maxFileSizeController.text) * 1024 * 1024).toInt(),
        maxRecordingDurationSeconds:
            int.parse(_maxRecordingDurationController.text),
        enableOutputCaching: _enableOutputCaching,
        maxCachedOutputs: int.parse(_maxCachedOutputsController.text),
        updatedAt: DateTime.now(),
      );

      await _storage.saveConfiguration(updatedConfig);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Configuration saved successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save configuration: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

  Future<void> _resetToDefaults() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset to Defaults'),
        content: const Text(
          'Are you sure you want to reset all settings to their default values?\n\nThis will not affect your API key.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Reset'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final defaults = Configuration.defaultConfig();
      final apiKey = _apiKeyController.text; // Preserve API key

      _systemPromptController.text = defaults.systemPrompt;
      _maxTokensController.text = defaults.maxTokens.toString();
      _temperatureController.text = defaults.temperature.toString();
      _maxFileSizeController.text = defaults.maxFileSizeMB.toStringAsFixed(1);
      _maxRecordingDurationController.text =
          defaults.maxRecordingDurationSeconds.toString();
      _maxCachedOutputsController.text = defaults.maxCachedOutputs.toString();

      setState(() {
        _selectedModel = defaults.defaultModel;
        _selectedSttModel = defaults.sttModel;
        _enableAudioTranscription = defaults.enableAudioTranscription;
        _enableSpeechToText = defaults.enableSpeechToText;
        _enableImageProcessing = defaults.enableImageProcessing;
        _enableFileProcessing = defaults.enableFileProcessing;
        _enableOutputCaching = defaults.enableOutputCaching;
      });

      _apiKeyController.text = apiKey; // Restore API key
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration'),
        bottom: _isLoading
            ? null
            : TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: const [
                  Tab(text: 'API & Model'),
                  Tab(text: 'Features'),
                  Tab(text: 'Limits'),
                  Tab(text: 'Advanced'),
                ],
              ),
        actions: [
          if (!_isLoading) ...[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _resetToDefaults,
              tooltip: 'Reset to Defaults',
            ),
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _isSaving ? null : _saveConfiguration,
              tooltip: 'Save Configuration',
            ),
          ],
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? _buildErrorState()
              : _buildConfigurationForm(),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            _error!,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _loadConfiguration,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildConfigurationForm() {
    return Form(
      key: _formKey,
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildApiModelTab(),
          _buildFeaturesTab(),
          _buildLimitsTab(),
          _buildAdvancedTab(),
        ],
      ),
    );
  }

  Widget _buildApiModelTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('OpenAI Configuration'),
          TextFormField(
            controller: _apiKeyController,
            decoration: const InputDecoration(
              labelText: 'OpenAI API Key',
              hintText: 'sk-...',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.key),
              helperText: 'Enter your OpenAI API key to enable AI features',
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'API key is required';
              }
              if (!value.startsWith('sk-')) {
                return 'Invalid API key format';
              }
              if (value.length < 20) {
                return 'API key appears to be too short';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedModel,
            decoration: const InputDecoration(
              labelText: 'Default Model',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.psychology),
            ),
            items: const [
              DropdownMenuItem(value: 'gpt-4', child: Text('GPT-4')),
              DropdownMenuItem(
                  value: 'gpt-4-turbo', child: Text('GPT-4 Turbo')),
              DropdownMenuItem(
                  value: 'gpt-3.5-turbo', child: Text('GPT-3.5 Turbo')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedModel = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _maxTokensController,
            decoration: const InputDecoration(
              labelText: 'Max Tokens',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.memory),
              helperText: 'Maximum tokens per request (1-8000)',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Max tokens is required';
              }
              final tokens = int.tryParse(value);
              if (tokens == null || tokens < 1 || tokens > 8000) {
                return 'Must be between 1 and 8000';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _temperatureController,
            decoration: const InputDecoration(
              labelText: 'Temperature',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.thermostat),
              helperText: 'Creativity level (0.0-2.0)',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Temperature is required';
              }
              final temp = double.tryParse(value);
              if (temp == null || temp < 0.0 || temp > 2.0) {
                return 'Must be between 0.0 and 2.0';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('System Prompt'),
          TextFormField(
            controller: _systemPromptController,
            decoration: const InputDecoration(
              labelText: 'System Prompt',
              border: OutlineInputBorder(),
              helperText: 'Instructions that guide the AI\'s behavior',
            ),
            maxLines: 4,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'System prompt is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Audio Features'),
          SwitchListTile(
            title: const Text('Audio Transcription'),
            subtitle: const Text('Enable audio-to-text conversion'),
            value: _enableAudioTranscription,
            onChanged: (value) {
              setState(() {
                _enableAudioTranscription = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Speech-to-Text'),
            subtitle: const Text('Process voice messages with AI'),
            value: _enableSpeechToText,
            onChanged: (value) {
              setState(() {
                _enableSpeechToText = value;
              });
            },
          ),
          if (_enableSpeechToText)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButtonFormField<String?>(
                value: _selectedSttModel,
                decoration: const InputDecoration(
                  labelText: 'STT Model (Optional)',
                  border: OutlineInputBorder(),
                  helperText: 'Leave empty to use default model',
                ),
                items: [
                  const DropdownMenuItem(
                      value: null, child: Text('Use Default Model')),
                  ...Configuration().availableSttModels.map(
                        (model) =>
                            DropdownMenuItem(value: model, child: Text(model)),
                      ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedSttModel = value;
                  });
                },
              ),
            ),
          const SizedBox(height: 16),
          _buildSectionHeader('Media Processing'),
          SwitchListTile(
            title: const Text('Image Processing'),
            subtitle: const Text('Analyze and process image content'),
            value: _enableImageProcessing,
            onChanged: (value) {
              setState(() {
                _enableImageProcessing = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('File Processing'),
            subtitle: const Text('Read and analyze document files'),
            value: _enableFileProcessing,
            onChanged: (value) {
              setState(() {
                _enableFileProcessing = value;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildSectionHeader('Performance'),
          SwitchListTile(
            title: const Text('Output Caching'),
            subtitle: const Text('Cache AI responses for faster access'),
            value: _enableOutputCaching,
            onChanged: (value) {
              setState(() {
                _enableOutputCaching = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLimitsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('File Limits'),
          TextFormField(
            controller: _maxFileSizeController,
            decoration: const InputDecoration(
              labelText: 'Max File Size (MB)',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.file_present),
              helperText: 'Maximum size for uploaded files',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Max file size is required';
              }
              final size = double.tryParse(value);
              if (size == null || size <= 0 || size > 100) {
                return 'Must be between 0.1 and 100 MB';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _maxRecordingDurationController,
            decoration: const InputDecoration(
              labelText: 'Max Recording Duration (seconds)',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.timer),
              helperText: 'Maximum audio recording length',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Max recording duration is required';
              }
              final duration = int.tryParse(value);
              if (duration == null || duration < 5 || duration > 300) {
                return 'Must be between 5 and 300 seconds';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          if (_enableOutputCaching)
            TextFormField(
              controller: _maxCachedOutputsController,
              decoration: const InputDecoration(
                labelText: 'Max Cached Outputs',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.storage),
                helperText: 'Maximum number of cached responses',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Max cached outputs is required';
                }
                final count = int.tryParse(value);
                if (count == null || count < 10 || count > 1000) {
                  return 'Must be between 10 and 1000';
                }
                return null;
              },
            ),
          const SizedBox(height: 24),
          _buildSectionHeader('Supported File Types'),
          _buildFileTypesList('Documents', _config.allowedFileTypes),
          _buildFileTypesList('Images', _config.allowedImageTypes),
          _buildFileTypesList('Audio', _config.allowedAudioTypes),
        ],
      ),
    );
  }

  Widget _buildAdvancedTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Configuration Status'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildStatusRow(
                    'API Key',
                    _config.hasValidApiKey,
                    _config.hasValidApiKey ? 'Valid' : 'Invalid or missing',
                  ),
                  const Divider(),
                  _buildStatusRow(
                    'Configuration',
                    _config.isValid,
                    _config.isValid
                        ? 'All settings valid'
                        : 'Some settings need attention',
                  ),
                  const Divider(),
                  _buildStatusRow(
                    'STT Available',
                    _config.isSttEnabled,
                    _config.isSttEnabled
                        ? 'Ready to use'
                        : 'Requires valid API key',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Data Management'),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Export Configuration'),
            subtitle: const Text('Save settings to file'),
            onTap: _exportConfiguration,
          ),
          ListTile(
            leading: const Icon(Icons.upload),
            title: const Text('Import Configuration'),
            subtitle: const Text('Load settings from file'),
            onTap: _importConfiguration,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text('Clear All Data',
                style: TextStyle(color: Colors.red)),
            subtitle: const Text('Remove all threads and messages'),
            onTap: _clearAllData,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildFileTypesList(String title, List<String> types) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: types
                  .map((type) => Chip(
                        label: Text(type.toUpperCase()),
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String title, bool isValid, String status) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.error,
          color: isValid ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                status,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isValid ? Colors.green : Colors.red,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _exportConfiguration() async {
    // TODO: Implement configuration export
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Export feature coming soon!')),
    );
  }

  Future<void> _importConfiguration() async {
    // TODO: Implement configuration import
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Import feature coming soon!')),
    );
  }

  Future<void> _clearAllData() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Data'),
        content: const Text(
          'Are you sure you want to delete all threads, messages, and cached outputs?\n\nThis action cannot be undone and will not affect your configuration settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await _storage.clearAllData();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('All data cleared successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to clear data: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
