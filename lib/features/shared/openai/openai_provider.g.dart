// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for OpenAI utility instance
///
/// This provider watches the OpenAI configuration and automatically
/// recreates the utility when the configuration changes.
///
/// The utility instance is automatically disposed when no longer needed.

@ProviderFor(openAIUtil)
const openAIUtilProvider = OpenAIUtilProvider._();

/// Provider for OpenAI utility instance
///
/// This provider watches the OpenAI configuration and automatically
/// recreates the utility when the configuration changes.
///
/// The utility instance is automatically disposed when no longer needed.

final class OpenAIUtilProvider
    extends $FunctionalProvider<OpenAIUtil, OpenAIUtil, OpenAIUtil>
    with $Provider<OpenAIUtil> {
  /// Provider for OpenAI utility instance
  ///
  /// This provider watches the OpenAI configuration and automatically
  /// recreates the utility when the configuration changes.
  ///
  /// The utility instance is automatically disposed when no longer needed.
  const OpenAIUtilProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'openAIUtilProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$openAIUtilHash();

  @$internal
  @override
  $ProviderElement<OpenAIUtil> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OpenAIUtil create(Ref ref) {
    return openAIUtil(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OpenAIUtil value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OpenAIUtil>(value),
    );
  }
}

String _$openAIUtilHash() => r'aaf18e8d225280f17623db2f1e8556043e174f0f';
