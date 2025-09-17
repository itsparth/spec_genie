/// Configuration for OpenAI API client
class OpenAIConfig {
  /// The OpenAI API key
  final String apiKey;

  /// The base URL for the API (optional, defaults to OpenAI)
  final String? baseUrl;

  /// The organization ID (optional)
  final String? organization;

  /// The model to use for completions (defaults to gpt-4)
  final String model;

  const OpenAIConfig({
    required this.apiKey,
    this.baseUrl,
    this.organization,
    this.model = 'gpt-4',
  });

  /// Create config from environment variable
  factory OpenAIConfig.fromEnv({
    String? model,
    String? baseUrl,
    String? organization,
  }) {
    const apiKey = String.fromEnvironment('OPENAI_API_KEY');
    if (apiKey.isEmpty) {
      throw ArgumentError('OPENAI_API_KEY environment variable not set');
    }

    return OpenAIConfig(
      apiKey: apiKey,
      model: model ?? 'gpt-4',
      baseUrl: baseUrl,
      organization: organization,
    );
  }
}
