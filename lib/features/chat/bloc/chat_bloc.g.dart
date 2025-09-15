// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatBloc)
const chatBlocProvider = ChatBlocFamily._();

final class ChatBlocProvider
    extends $NotifierProvider<ChatBloc, List<Message>> {
  const ChatBlocProvider._(
      {required ChatBlocFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'chatBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$chatBlocHash();

  @override
  String toString() {
    return r'chatBlocProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChatBloc create() => ChatBloc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Message> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Message>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChatBlocProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chatBlocHash() => r'986dfc3cec70aac42a1ea575a08b9ddc622869d0';

final class ChatBlocFamily extends $Family
    with
        $ClassFamilyOverride<ChatBloc, List<Message>, List<Message>,
            List<Message>, int> {
  const ChatBlocFamily._()
      : super(
          retry: null,
          name: r'chatBlocProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ChatBlocProvider call(
    int threadId,
  ) =>
      ChatBlocProvider._(argument: threadId, from: this);

  @override
  String toString() => r'chatBlocProvider';
}

abstract class _$ChatBloc extends $Notifier<List<Message>> {
  late final _$args = ref.$arg as int;
  int get threadId => _$args;

  List<Message> build(
    int threadId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<List<Message>, List<Message>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Message>, List<Message>>,
        List<Message>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
