// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bloc responsible for a single message's lifecycle (processing, saving updates, etc.)

@ProviderFor(MessageBloc)
const messageBlocProvider = MessageBlocFamily._();

/// Bloc responsible for a single message's lifecycle (processing, saving updates, etc.)
final class MessageBlocProvider
    extends $NotifierProvider<MessageBloc, MessageState> {
  /// Bloc responsible for a single message's lifecycle (processing, saving updates, etc.)
  const MessageBlocProvider._(
      {required MessageBlocFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'messageBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$messageBlocHash();

  @override
  String toString() {
    return r'messageBlocProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MessageBloc create() => MessageBloc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MessageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MessageState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MessageBlocProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$messageBlocHash() => r'8dc4b16c1a20af89c28ba5328c2b44fa99f05647';

/// Bloc responsible for a single message's lifecycle (processing, saving updates, etc.)

final class MessageBlocFamily extends $Family
    with
        $ClassFamilyOverride<MessageBloc, MessageState, MessageState,
            MessageState, int> {
  const MessageBlocFamily._()
      : super(
          retry: null,
          name: r'messageBlocProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Bloc responsible for a single message's lifecycle (processing, saving updates, etc.)

  MessageBlocProvider call(
    int messageId,
  ) =>
      MessageBlocProvider._(argument: messageId, from: this);

  @override
  String toString() => r'messageBlocProvider';
}

/// Bloc responsible for a single message's lifecycle (processing, saving updates, etc.)

abstract class _$MessageBloc extends $Notifier<MessageState> {
  late final _$args = ref.$arg as int;
  int get messageId => _$args;

  MessageState build(
    int messageId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<MessageState, MessageState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<MessageState, MessageState>,
        MessageState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
