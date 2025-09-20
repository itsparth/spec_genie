// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode_outputs_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Riverpod provider for the repository

@ProviderFor(modeOutputsRepository)
const modeOutputsRepositoryProvider = ModeOutputsRepositoryProvider._();

/// Riverpod provider for the repository

final class ModeOutputsRepositoryProvider extends $FunctionalProvider<
    ModeOutputsRepository,
    ModeOutputsRepository,
    ModeOutputsRepository> with $Provider<ModeOutputsRepository> {
  /// Riverpod provider for the repository
  const ModeOutputsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'modeOutputsRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$modeOutputsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ModeOutputsRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ModeOutputsRepository create(Ref ref) {
    return modeOutputsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModeOutputsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeOutputsRepository>(value),
    );
  }
}

String _$modeOutputsRepositoryHash() =>
    r'048ed7a23d47331867efffea8802d70603e604ee';
