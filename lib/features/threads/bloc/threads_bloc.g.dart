// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threads_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThreadsBloc)
const threadsBlocProvider = ThreadsBlocProvider._();

final class ThreadsBlocProvider
    extends $NotifierProvider<ThreadsBloc, ThreadsState> {
  const ThreadsBlocProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'threadsBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$threadsBlocHash();

  @$internal
  @override
  ThreadsBloc create() => ThreadsBloc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThreadsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThreadsState>(value),
    );
  }
}

String _$threadsBlocHash() => r'afb7665a95ad1adf0424ebd0067a2e1549a405b1';

abstract class _$ThreadsBloc extends $Notifier<ThreadsState> {
  ThreadsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThreadsState, ThreadsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ThreadsState, ThreadsState>,
        ThreadsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
