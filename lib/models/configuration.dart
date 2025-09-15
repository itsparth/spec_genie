import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

part 'configuration.mapper.dart';
part 'configuration.g.dart';

@MappableClass()
@Collection()
class Configuration with ConfigurationMappable {
  final Id id;
  final String openAIApiKey;
  final String defaultModel;
  final int maxTokens;
  final double temperature;
  final String systemPrompt;
  final bool enableAudioTranscription;
  final bool enableSpeechToText;
  final String? sttModel; // If null, uses defaultModel
  final bool enableImageProcessing;
  final bool enableFileProcessing;
  final int maxFileSizeBytes;
  final List<String> allowedFileTypes;
  final List<String> allowedImageTypes;
  final List<String> allowedAudioTypes;
  final int maxRecordingDurationSeconds;
  final bool enableOutputCaching;
  final int maxCachedOutputs;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Configuration({
    this.id = Isar.autoIncrement,
    this.openAIApiKey = '',
    this.defaultModel = 'gpt-4',
    this.maxTokens = 4000,
    this.temperature = 0.7,
    this.systemPrompt =
        'You are a helpful assistant that processes user inputs and generates comprehensive outputs.',
    this.enableAudioTranscription = true,
    this.enableSpeechToText = true,
    this.sttModel, // If null, uses defaultModel
    this.enableImageProcessing = true,
    this.enableFileProcessing = true,
    this.maxFileSizeBytes = 10485760, // 10MB
    this.allowedFileTypes = const ['pdf', 'txt', 'md', 'doc', 'docx'],
    this.allowedImageTypes = const ['jpg', 'jpeg', 'png', 'gif', 'bmp'],
    this.allowedAudioTypes = const ['mp3', 'wav', 'm4a', 'aac'],
    this.maxRecordingDurationSeconds = 30,
    this.enableOutputCaching = true,
    this.maxCachedOutputs = 100,
    this.createdAt,
    this.updatedAt,
  });

  /// Default configuration for new installations
  factory Configuration.defaultConfig() {
    final now = DateTime.now();
    return Configuration(
      createdAt: now,
      updatedAt: now,
    );
  }

  /// Validates the configuration settings
  bool get isValid {
    return openAIApiKey.isNotEmpty &&
        openAIApiKey.startsWith('sk-') &&
        maxTokens > 0 &&
        maxTokens <= 8000 &&
        temperature >= 0.0 &&
        temperature <= 2.0 &&
        maxFileSizeBytes > 0 &&
        maxRecordingDurationSeconds > 0 &&
        allowedFileTypes.isNotEmpty &&
        allowedImageTypes.isNotEmpty &&
        allowedAudioTypes.isNotEmpty;
  }

  /// Check if API key format is valid
  bool get hasValidApiKey {
    return openAIApiKey.isNotEmpty &&
        openAIApiKey.startsWith('sk-') &&
        openAIApiKey.length > 20;
  }

  /// Get max file size in MB for display
  double get maxFileSizeMB {
    return maxFileSizeBytes / (1024 * 1024);
  }

  /// Check if Speech-to-Text is enabled and configured
  bool get isSttEnabled {
    return enableSpeechToText && hasValidApiKey;
  }

  /// Get the effective STT model (fallback to defaultModel if not specified)
  String get effectiveSttModel {
    return sttModel ?? defaultModel;
  }

  /// Get available STT models (same as available LLM models for compatibility)
  List<String> get availableSttModels {
    return ['gpt-4', 'gpt-4-turbo', 'gpt-3.5-turbo', 'whisper-1'];
  }

  /// Check if STT model is valid
  bool get hasSttModel {
    return availableSttModels.contains(effectiveSttModel);
  }
}
