// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for OpenAI configuration
///
/// This provider should be overridden in your app initialization
/// with the actual configuration values.

@ProviderFor(openAIConfig)
const openAIConfigProvider = OpenAIConfigProvider._();

/// Provider for OpenAI configuration
///
/// This provider should be overridden in your app initialization
/// with the actual configuration values.

final class OpenAIConfigProvider
    extends $FunctionalProvider<OpenAIConfig, OpenAIConfig, OpenAIConfig>
    with $Provider<OpenAIConfig> {
  /// Provider for OpenAI configuration
  ///
  /// This provider should be overridden in your app initialization
  /// with the actual configuration values.
  const OpenAIConfigProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'openAIConfigProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$openAIConfigHash();

  @$internal
  @override
  $ProviderElement<OpenAIConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OpenAIConfig create(Ref ref) {
    return openAIConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OpenAIConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OpenAIConfig>(value),
    );
  }
}

String _$openAIConfigHash() => r'095fc6d50e04ac4285e787c21758bbc485e7c7e3';

/// Provider for OpenAI API key
///
/// Override this to provide the API key from secure storage,
/// environment variables, or user settings.

@ProviderFor(openAIApiKey)
const openAIApiKeyProvider = OpenAIApiKeyProvider._();

/// Provider for OpenAI API key
///
/// Override this to provide the API key from secure storage,
/// environment variables, or user settings.

final class OpenAIApiKeyProvider
    extends $FunctionalProvider<String, String, String> with $Provider<String> {
  /// Provider for OpenAI API key
  ///
  /// Override this to provide the API key from secure storage,
  /// environment variables, or user settings.
  const OpenAIApiKeyProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'openAIApiKeyProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$openAIApiKeyHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return openAIApiKey(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$openAIApiKeyHash() => r'9603211f0c12ced5a39d2ca46b98f93d6419080f';

/// Provider for OpenAI base URL
///
/// Override this to provide a custom base URL.
/// Returns null for default OpenAI API endpoint.

@ProviderFor(openAIBaseUrl)
const openAIBaseUrlProvider = OpenAIBaseUrlProvider._();

/// Provider for OpenAI base URL
///
/// Override this to provide a custom base URL.
/// Returns null for default OpenAI API endpoint.

final class OpenAIBaseUrlProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  /// Provider for OpenAI base URL
  ///
  /// Override this to provide a custom base URL.
  /// Returns null for default OpenAI API endpoint.
  const OpenAIBaseUrlProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'openAIBaseUrlProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$openAIBaseUrlHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return openAIBaseUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$openAIBaseUrlHash() => r'cf9ee41c33d4e93a5f76f2c1fb479508cb22e0cb';

/// Provider for OpenAI model name
///
/// Override this to provide a custom model name.
/// Defaults to 'gpt-4'.

@ProviderFor(openAIModel)
const openAIModelProvider = OpenAIModelProvider._();

/// Provider for OpenAI model name
///
/// Override this to provide a custom model name.
/// Defaults to 'gpt-4'.

final class OpenAIModelProvider
    extends $FunctionalProvider<String, String, String> with $Provider<String> {
  /// Provider for OpenAI model name
  ///
  /// Override this to provide a custom model name.
  /// Defaults to 'gpt-4'.
  const OpenAIModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'openAIModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$openAIModelHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return openAIModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$openAIModelHash() => r'39a9eec55d31c119d1b9683299add271f320888c';

/// Provider for OpenAI organization ID
///
/// Override this to provide an organization ID if needed.
/// Returns null by default.

@ProviderFor(openAIOrganization)
const openAIOrganizationProvider = OpenAIOrganizationProvider._();

/// Provider for OpenAI organization ID
///
/// Override this to provide an organization ID if needed.
/// Returns null by default.

final class OpenAIOrganizationProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  /// Provider for OpenAI organization ID
  ///
  /// Override this to provide an organization ID if needed.
  /// Returns null by default.
  const OpenAIOrganizationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'openAIOrganizationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$openAIOrganizationHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return openAIOrganization(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$openAIOrganizationHash() =>
    r'85c0363a0b46b76a25733a1ff733e21980cf1474';

/// Computed provider that creates OpenAIConfig from individual providers
///
/// This automatically rebuilds when any of the constituent providers change.

@ProviderFor(computedOpenAIConfig)
const computedOpenAIConfigProvider = ComputedOpenAIConfigProvider._();

/// Computed provider that creates OpenAIConfig from individual providers
///
/// This automatically rebuilds when any of the constituent providers change.

final class ComputedOpenAIConfigProvider
    extends $FunctionalProvider<OpenAIConfig, OpenAIConfig, OpenAIConfig>
    with $Provider<OpenAIConfig> {
  /// Computed provider that creates OpenAIConfig from individual providers
  ///
  /// This automatically rebuilds when any of the constituent providers change.
  const ComputedOpenAIConfigProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'computedOpenAIConfigProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$computedOpenAIConfigHash();

  @$internal
  @override
  $ProviderElement<OpenAIConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OpenAIConfig create(Ref ref) {
    return computedOpenAIConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OpenAIConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OpenAIConfig>(value),
    );
  }
}

String _$computedOpenAIConfigHash() =>
    r'263c155eeed742a94fd2943a06482bdca46dcb2d';
