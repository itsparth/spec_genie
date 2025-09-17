// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_state.dart';

class ChatStateMapper extends ClassMapperBase<ChatState> {
  ChatStateMapper._();

  static ChatStateMapper? _instance;
  static ChatStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatStateMapper._());
      MessageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChatState';

  static IList<Message> _$messages(ChatState v) => v.messages;
  static const Field<ChatState, IList<Message>> _f$messages = Field(
    'messages',
    _$messages,
    opt: true,
    def: const IListConst([]),
  );
  static bool _$isLoading(ChatState v) => v.isLoading;
  static const Field<ChatState, bool> _f$isLoading = Field(
    'isLoading',
    _$isLoading,
    opt: true,
    def: false,
  );
  static bool _$isSaving(ChatState v) => v.isSaving;
  static const Field<ChatState, bool> _f$isSaving = Field(
    'isSaving',
    _$isSaving,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<ChatState> fields = const {
    #messages: _f$messages,
    #isLoading: _f$isLoading,
    #isSaving: _f$isSaving,
  };

  static ChatState _instantiate(DecodingData data) {
    return ChatState(
      messages: data.dec(_f$messages),
      isLoading: data.dec(_f$isLoading),
      isSaving: data.dec(_f$isSaving),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatState>(map);
  }

  static ChatState fromJson(String json) {
    return ensureInitialized().decodeJson<ChatState>(json);
  }
}

mixin ChatStateMappable {
  String toJson() {
    return ChatStateMapper.ensureInitialized().encodeJson<ChatState>(
      this as ChatState,
    );
  }

  Map<String, dynamic> toMap() {
    return ChatStateMapper.ensureInitialized().encodeMap<ChatState>(
      this as ChatState,
    );
  }

  ChatStateCopyWith<ChatState, ChatState, ChatState> get copyWith =>
      _ChatStateCopyWithImpl<ChatState, ChatState>(
        this as ChatState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChatStateMapper.ensureInitialized().stringifyValue(
      this as ChatState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatStateMapper.ensureInitialized().equalsValue(
      this as ChatState,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatStateMapper.ensureInitialized().hashValue(this as ChatState);
  }
}

extension ChatStateValueCopy<$R, $Out> on ObjectCopyWith<$R, ChatState, $Out> {
  ChatStateCopyWith<$R, ChatState, $Out> get $asChatState =>
      $base.as((v, t, t2) => _ChatStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatStateCopyWith<$R, $In extends ChatState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({IList<Message>? messages, bool? isLoading, bool? isSaving});
  ChatStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatState, $Out>
    implements ChatStateCopyWith<$R, ChatState, $Out> {
  _ChatStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatState> $mapper =
      ChatStateMapper.ensureInitialized();
  @override
  $R call({IList<Message>? messages, bool? isLoading, bool? isSaving}) =>
      $apply(
        FieldCopyWithData({
          if (messages != null) #messages: messages,
          if (isLoading != null) #isLoading: isLoading,
          if (isSaving != null) #isSaving: isSaving,
        }),
      );
  @override
  ChatState $make(CopyWithData data) => ChatState(
    messages: data.get(#messages, or: $value.messages),
    isLoading: data.get(#isLoading, or: $value.isLoading),
    isSaving: data.get(#isSaving, or: $value.isSaving),
  );

  @override
  ChatStateCopyWith<$R2, ChatState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

