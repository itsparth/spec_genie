// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'message_state.dart';

class MessageStateMapper extends ClassMapperBase<MessageState> {
  MessageStateMapper._();

  static MessageStateMapper? _instance;
  static MessageStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MessageStateMapper._());
      MessageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MessageState';

  static Message _$message(MessageState v) => v.message;
  static const Field<MessageState, Message> _f$message = Field(
    'message',
    _$message,
  );
  static bool _$isSaving(MessageState v) => v.isSaving;
  static const Field<MessageState, bool> _f$isSaving = Field(
    'isSaving',
    _$isSaving,
    opt: true,
    def: false,
  );
  static bool _$isProcessing(MessageState v) => v.isProcessing;
  static const Field<MessageState, bool> _f$isProcessing = Field(
    'isProcessing',
    _$isProcessing,
    opt: true,
    def: false,
  );
  static String? _$error(MessageState v) => v.error;
  static const Field<MessageState, String> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );

  @override
  final MappableFields<MessageState> fields = const {
    #message: _f$message,
    #isSaving: _f$isSaving,
    #isProcessing: _f$isProcessing,
    #error: _f$error,
  };

  static MessageState _instantiate(DecodingData data) {
    return MessageState(
      message: data.dec(_f$message),
      isSaving: data.dec(_f$isSaving),
      isProcessing: data.dec(_f$isProcessing),
      error: data.dec(_f$error),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MessageState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MessageState>(map);
  }

  static MessageState fromJson(String json) {
    return ensureInitialized().decodeJson<MessageState>(json);
  }
}

mixin MessageStateMappable {
  String toJson() {
    return MessageStateMapper.ensureInitialized().encodeJson<MessageState>(
      this as MessageState,
    );
  }

  Map<String, dynamic> toMap() {
    return MessageStateMapper.ensureInitialized().encodeMap<MessageState>(
      this as MessageState,
    );
  }

  MessageStateCopyWith<MessageState, MessageState, MessageState> get copyWith =>
      _MessageStateCopyWithImpl<MessageState, MessageState>(
        this as MessageState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MessageStateMapper.ensureInitialized().stringifyValue(
      this as MessageState,
    );
  }

  @override
  bool operator ==(Object other) {
    return MessageStateMapper.ensureInitialized().equalsValue(
      this as MessageState,
      other,
    );
  }

  @override
  int get hashCode {
    return MessageStateMapper.ensureInitialized().hashValue(
      this as MessageState,
    );
  }
}

extension MessageStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MessageState, $Out> {
  MessageStateCopyWith<$R, MessageState, $Out> get $asMessageState =>
      $base.as((v, t, t2) => _MessageStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MessageStateCopyWith<$R, $In extends MessageState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MessageCopyWith<$R, Message, Message> get message;
  $R call({
    Message? message,
    bool? isSaving,
    bool? isProcessing,
    String? error,
  });
  MessageStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MessageStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MessageState, $Out>
    implements MessageStateCopyWith<$R, MessageState, $Out> {
  _MessageStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MessageState> $mapper =
      MessageStateMapper.ensureInitialized();
  @override
  MessageCopyWith<$R, Message, Message> get message =>
      $value.message.copyWith.$chain((v) => call(message: v));
  @override
  $R call({
    Message? message,
    bool? isSaving,
    bool? isProcessing,
    Object? error = $none,
  }) =>
      $apply(
        FieldCopyWithData({
          if (message != null) #message: message,
          if (isSaving != null) #isSaving: isSaving,
          if (isProcessing != null) #isProcessing: isProcessing,
          if (error != $none) #error: error,
        }),
      );
  @override
  MessageState $make(CopyWithData data) => MessageState(
        message: data.get(#message, or: $value.message),
        isSaving: data.get(#isSaving, or: $value.isSaving),
        isProcessing: data.get(#isProcessing, or: $value.isProcessing),
        error: data.get(#error, or: $value.error),
      );

  @override
  MessageStateCopyWith<$R2, MessageState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _MessageStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
