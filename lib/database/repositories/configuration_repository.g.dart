// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(configurationRepository)
const configurationRepositoryProvider = ConfigurationRepositoryProvider._();

final class ConfigurationRepositoryProvider extends $FunctionalProvider<
    ConfigurationRepository,
    ConfigurationRepository,
    ConfigurationRepository> with $Provider<ConfigurationRepository> {
  const ConfigurationRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'configurationRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$configurationRepositoryHash();

  @$internal
  @override
  $ProviderElement<ConfigurationRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ConfigurationRepository create(Ref ref) {
    return configurationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConfigurationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConfigurationRepository>(value),
    );
  }
}

String _$configurationRepositoryHash() =>
    r'2b18d1fed22db283e31b7ec80f2b13177cb07750';
