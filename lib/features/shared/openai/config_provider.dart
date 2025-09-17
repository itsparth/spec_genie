import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'config.dart';

part 'config_provider.g.dart';

/// Provider for OpenAI configuration
///
/// This provider should be overridden in your app initialization
/// with the actual configuration values.
@riverpod
OpenAIConfig openAIConfig(Ref ref) {
  throw UnimplementedError('openAIConfigProvider must be overridden');
}

/// Provider for OpenAI API key
///
/// Override this to provide the API key from secure storage,
/// environment variables, or user settings.
@riverpod
String openAIApiKey(Ref ref) {
  throw UnimplementedError('openAIApiKeyProvider must be overridden');
}

/// Provider for OpenAI base URL
///
/// Override this to provide a custom base URL.
/// Returns null for default OpenAI API endpoint.
@riverpod
String? openAIBaseUrl(Ref ref) {
  return null; // Default to OpenAI endpoint
}

/// Provider for OpenAI model name
///
/// Override this to provide a custom model name.
/// Defaults to 'gpt-4'.
@riverpod
String openAIModel(Ref ref) {
  return 'gpt-4'; // Default model
}

/// Provider for OpenAI organization ID
///
/// Override this to provide an organization ID if needed.
/// Returns null by default.
@riverpod
String? openAIOrganization(Ref ref) {
  return null; // No organization by default
}

/// Computed provider that creates OpenAIConfig from individual providers
///
/// This automatically rebuilds when any of the constituent providers change.
@riverpod
OpenAIConfig computedOpenAIConfig(Ref ref) {
  return OpenAIConfig(
    apiKey: ref.watch(openAIApiKeyProvider),
    baseUrl: ref.watch(openAIBaseUrlProvider),
    model: ref.watch(openAIModelProvider),
    organization: ref.watch(openAIOrganizationProvider),
  );
}
