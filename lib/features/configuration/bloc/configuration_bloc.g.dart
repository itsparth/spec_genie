// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConfigurationBloc)
const configurationBlocProvider = ConfigurationBlocProvider._();

final class ConfigurationBlocProvider
    extends $NotifierProvider<ConfigurationBloc, Configuration> {
  const ConfigurationBlocProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'configurationBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$configurationBlocHash();

  @$internal
  @override
  ConfigurationBloc create() => ConfigurationBloc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Configuration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Configuration>(value),
    );
  }
}

String _$configurationBlocHash() => r'82597de9056de4ca3f522604b05c8c80930228a7';

abstract class _$ConfigurationBloc extends $Notifier<Configuration> {
  Configuration build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Configuration, Configuration>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Configuration, Configuration>,
        Configuration,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
