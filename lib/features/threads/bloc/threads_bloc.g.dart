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
    extends $NotifierProvider<ThreadsBloc, List<Thread>> {
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
  Override overrideWithValue(List<Thread> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Thread>>(value),
    );
  }
}

String _$threadsBlocHash() => r'59b9134ef11e4333de71b143551c082cccbc7ac9';

abstract class _$ThreadsBloc extends $Notifier<List<Thread>> {
  List<Thread> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Thread>, List<Thread>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Thread>, List<Thread>>,
        List<Thread>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
