// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode_output_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages mode outputs for a specific thread and mode combination

@ProviderFor(ModeOutputBloc)
const modeOutputBlocProvider = ModeOutputBlocFamily._();

/// Manages mode outputs for a specific thread and mode combination
final class ModeOutputBlocProvider
    extends $NotifierProvider<ModeOutputBloc, ModeOutputState> {
  /// Manages mode outputs for a specific thread and mode combination
  const ModeOutputBlocProvider._(
      {required ModeOutputBlocFamily super.from,
      required (
        int,
        int,
      )
          super.argument})
      : super(
          retry: null,
          name: r'modeOutputBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$modeOutputBlocHash();

  @override
  String toString() {
    return r'modeOutputBlocProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ModeOutputBloc create() => ModeOutputBloc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModeOutputState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeOutputState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ModeOutputBlocProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$modeOutputBlocHash() => r'8b82b2530bf10b80339325466af85a7a097f61a6';

/// Manages mode outputs for a specific thread and mode combination

final class ModeOutputBlocFamily extends $Family
    with
        $ClassFamilyOverride<
            ModeOutputBloc,
            ModeOutputState,
            ModeOutputState,
            ModeOutputState,
            (
              int,
              int,
            )> {
  const ModeOutputBlocFamily._()
      : super(
          retry: null,
          name: r'modeOutputBlocProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Manages mode outputs for a specific thread and mode combination

  ModeOutputBlocProvider call(
    int threadId,
    int modeId,
  ) =>
      ModeOutputBlocProvider._(argument: (
        threadId,
        modeId,
      ), from: this);

  @override
  String toString() => r'modeOutputBlocProvider';
}

/// Manages mode outputs for a specific thread and mode combination

abstract class _$ModeOutputBloc extends $Notifier<ModeOutputState> {
  late final _$args = ref.$arg as (
    int,
    int,
  );
  int get threadId => _$args.$1;
  int get modeId => _$args.$2;

  ModeOutputState build(
    int threadId,
    int modeId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args.$1,
      _$args.$2,
    );
    final ref = this.ref as $Ref<ModeOutputState, ModeOutputState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ModeOutputState, ModeOutputState>,
        ModeOutputState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
