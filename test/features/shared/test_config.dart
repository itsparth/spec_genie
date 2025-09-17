import 'dart:io';

/// Simple configuration loader for test environment
class TestConfig {
  static Map<String, String>? _config;

  /// Load configuration from test_config.env file
  static Map<String, String> load() {
    if (_config != null) return _config!;

    final file = File('test_config.env');
    if (!file.existsSync()) {
      throw Exception(
        'test_config.env file not found. Please copy test_config.env.example to test_config.env and fill in your API credentials.',
      );
    }

    _config = {};
    final lines = file.readAsLinesSync();

    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#')) continue;

      final parts = trimmed.split('=');
      if (parts.length >= 2) {
        final key = parts[0].trim();
        final value = parts.sublist(1).join('=').trim();
        _config![key] = value;
      }
    }

    return _config!;
  }

  /// Get a configuration value by key
  static String get(String key, {String? defaultValue}) {
    final config = load();
    return config[key] ??
        defaultValue ??
        (throw Exception('Missing configuration: $key'));
  }
}
