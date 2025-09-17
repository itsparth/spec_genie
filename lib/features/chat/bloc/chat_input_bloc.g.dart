// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_input_bloc.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages chat input state for a specific thread

@ProviderFor(ChatInputBloc)
const chatInputBlocProvider = ChatInputBlocProvider._();

/// Manages chat input state for a specific thread
final class ChatInputBlocProvider
    extends $NotifierProvider<ChatInputBloc, ChatInputState> {
  /// Manages chat input state for a specific thread
  const ChatInputBlocProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'chatInputBlocProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$chatInputBlocHash();

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
}

String _$chatInputBlocHash() => r'621e921e96f3060c425f28ce2a2d022440d31725';

/// Manages chat input state for a specific thread

abstract class _$ChatInputBloc extends $Notifier<ChatInputState> {
  ChatInputState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ChatInputState, ChatInputState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ChatInputState, ChatInputState>,
        ChatInputState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
