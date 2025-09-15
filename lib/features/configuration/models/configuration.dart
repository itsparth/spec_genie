import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

part 'configuration.mapper.dart';
part 'configuration.g.dart';

@MappableClass()
@Collection()
class Configuration with ConfigurationMappable {
  final Id id;
  final String apiKey;
  final String? baseUrl; // Optional for custom API endpoints
  final String modelName;
  final bool transcribeAudioFirst;

  const Configuration({
    this.id = Isar.autoIncrement,
    this.apiKey = '',
    this.baseUrl,
    this.modelName = 'gpt-4',
    this.transcribeAudioFirst = true,
  });

  /// Default configuration for new installations
  factory Configuration.defaultConfig() {
    return const Configuration();
  }

  /// Validates the configuration settings
  bool get isValid {
    return apiKey.isNotEmpty && modelName.isNotEmpty;
  }

  /// Check if API key format is valid (basic validation)
  bool get hasValidApiKey {
    return apiKey.isNotEmpty && apiKey.length > 10;
  }

  /// Get effective API base URL (default OpenAI if not specified)
  String get effectiveBaseUrl {
    return baseUrl ?? 'https://api.openai.com/v1';
  }

  /// Check if using custom API endpoint
  bool get isCustomEndpoint {
    return baseUrl != null && baseUrl!.isNotEmpty;
  }
}
