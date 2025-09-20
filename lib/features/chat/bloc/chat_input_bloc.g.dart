// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_input_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages chat input state for a specific thread

@ProviderFor(ChatInputBloc)
const chatInputBlocProvider = ChatInputBlocFamily._();

/// Manages chat input state for a specific thread
final class ChatInputBlocProvider
    extends $NotifierProvider<ChatInputBloc, ChatInputState> {
  /// Manages chat input state for a specific thread
  const ChatInputBlocProvider._(
      {required ChatInputBlocFamily super.from, required bool super.argument})
      : super(
          retry: null,
          name: r'chatInputBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$chatInputBlocHash();

  @override
  String toString() {
    return r'chatInputBlocProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChatInputBloc create() => ChatInputBloc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatInputState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatInputState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChatInputBlocProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chatInputBlocHash() => r'a5b9c1046769a85aa80b844a9c119b17f1010868';

/// Manages chat input state for a specific thread

final class ChatInputBlocFamily extends $Family
    with
        $ClassFamilyOverride<ChatInputBloc, ChatInputState, ChatInputState,
            ChatInputState, bool> {
  const ChatInputBlocFamily._()
      : super(
          retry: null,
          name: r'chatInputBlocProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Manages chat input state for a specific thread

  ChatInputBlocProvider call({
    bool autoStartRecording = false,
  }) =>
      ChatInputBlocProvider._(argument: autoStartRecording, from: this);

  @override
  String toString() => r'chatInputBlocProvider';
}

/// Manages chat input state for a specific thread

abstract class _$ChatInputBloc extends $Notifier<ChatInputState> {
  late final _$args = ref.$arg as bool;
  bool get autoStartRecording => _$args;

  ChatInputState build({
    bool autoStartRecording = false,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      autoStartRecording: _$args,
    );
    final ref = this.ref as $Ref<ChatInputState, ChatInputState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ChatInputState, ChatInputState>,
        ChatInputState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
