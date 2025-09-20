// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages chat messages for a specific thread

@ProviderFor(ChatBloc)
const chatBlocProvider = ChatBlocFamily._();

/// Manages chat messages for a specific thread
final class ChatBlocProvider extends $NotifierProvider<ChatBloc, ChatState> {
  /// Manages chat messages for a specific thread
  const ChatBlocProvider._(
      {required ChatBlocFamily super.from, required int? super.argument})
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
  Override overrideWithValue(ChatState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatState>(value),
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

String _$chatBlocHash() => r'39f41f8e1fbab5e9a5cf974407b6f281a3ce9e91';

/// Manages chat messages for a specific thread

final class ChatBlocFamily extends $Family
    with $ClassFamilyOverride<ChatBloc, ChatState, ChatState, ChatState, int?> {
  const ChatBlocFamily._()
      : super(
          retry: null,
          name: r'chatBlocProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Manages chat messages for a specific thread

  ChatBlocProvider call(
    int? threadId,
  ) =>
      ChatBlocProvider._(argument: threadId, from: this);

  @override
  String toString() => r'chatBlocProvider';
}

/// Manages chat messages for a specific thread

abstract class _$ChatBloc extends $Notifier<ChatState> {
  late final _$args = ref.$arg as int?;
  int? get threadId => _$args;

  ChatState build(
    int? threadId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<ChatState, ChatState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ChatState, ChatState>, ChatState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
