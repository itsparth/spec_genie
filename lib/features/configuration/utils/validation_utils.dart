/// Validation utilities for configuration settings
class ValidationUtils {
  static const String _openAIApiKeyPrefix = 'sk-';
  static const int _minApiKeyLength = 10;
  static const int _maxApiKeyLength = 200;

  /// Validate API key format
  static bool isValidApiKey(String apiKey) {
    if (apiKey.isEmpty) return false;
    if (apiKey.length < _minApiKeyLength || apiKey.length > _maxApiKeyLength) {
      return false;
    }
    return true;
  }

  /// Check if API key looks like an OpenAI key
  static bool isOpenAIApiKey(String apiKey) {
    return apiKey.startsWith(_openAIApiKeyPrefix);
  }

  /// Validate URL format
  static bool isValidUrl(String? url) {
    if (url == null || url.isEmpty) return true; // Optional field

    final uri = Uri.tryParse(url);
    return uri != null &&
        uri.hasScheme &&
        (uri.isScheme('http') || uri.isScheme('https'));
  }

  /// Validate model name
  static bool isValidModelName(String modelName) {
    return modelName.isNotEmpty && modelName.trim().isNotEmpty;
  }

  /// Get API key validation message
  static String? getApiKeyValidationMessage(String apiKey) {
    if (apiKey.isEmpty) {
      return 'API key is required';
    }
    if (apiKey.length < _minApiKeyLength) {
      return 'API key is too short';
    }
    if (apiKey.length > _maxApiKeyLength) {
      return 'API key is too long';
    }
    return null;
  }

  /// Get URL validation message
  static String? getUrlValidationMessage(String? url) {
    if (url == null || url.isEmpty) return null; // Optional

    if (!isValidUrl(url)) {
      return 'Please enter a valid HTTP/HTTPS URL';
    }
    return null;
  }

  /// Get model name validation message
  static String? getModelNameValidationMessage(String modelName) {
    if (!isValidModelName(modelName)) {
      return 'Please select a valid model';
    }
    return null;
  }

  /// Check if configuration is complete for basic usage
  static bool isConfigurationComplete(String apiKey, String modelName) {
    return isValidApiKey(apiKey) && isValidModelName(modelName);
  }

  /// Get suggested API base URLs for different providers
  static Map<String, String> get suggestedBaseUrls => {
        'OpenAI': 'https://api.openai.com/v1',
        'Azure OpenAI': 'https://your-resource-name.openai.azure.com/',
        'Local (Ollama)': 'http://localhost:11434/v1',
        'Local (LM Studio)': 'http://localhost:1234/v1',
      };

  /// Get suggested models for different providers
  static Map<String, List<String>> get suggestedModels => {
        'OpenAI': ['gpt-4', 'gpt-4-turbo', 'gpt-3.5-turbo'],
        'Azure OpenAI': ['gpt-4', 'gpt-35-turbo'],
        'Local': ['llama2', 'codellama', 'mistral'],
      };
}
