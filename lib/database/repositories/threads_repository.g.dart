// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threads_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(threadsRepository)
const threadsRepositoryProvider = ThreadsRepositoryProvider._();

final class ThreadsRepositoryProvider extends $FunctionalProvider<
    ThreadsRepository,
    ThreadsRepository,
    ThreadsRepository> with $Provider<ThreadsRepository> {
  const ThreadsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'threadsRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$threadsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ThreadsRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThreadsRepository create(Ref ref) {
    return threadsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThreadsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThreadsRepository>(value),
    );
  }
}

String _$threadsRepositoryHash() => r'76d1bb076048f31063867573208970a709ea6b37';
