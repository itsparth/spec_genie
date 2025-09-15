// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'message.dart';

class MessageTypeMapper extends EnumMapper<MessageType> {
  MessageTypeMapper._();

  static MessageTypeMapper? _instance;
  static MessageTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MessageTypeMapper._());
    }
    return _instance!;
  }

  static MessageType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MessageType decode(dynamic value) {
    switch (value) {
      case r'text':
        return MessageType.text;
      case r'audio':
        return MessageType.audio;
      case r'image':
        return MessageType.image;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MessageType self) {
    switch (self) {
      case MessageType.text:
        return r'text';
      case MessageType.audio:
        return r'audio';
      case MessageType.image:
        return r'image';
    }
  }
}

extension MessageTypeMapperExtension on MessageType {
  String toValue() {
    MessageTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MessageType>(this) as String;
  }
}

class MessageMapper extends ClassMapperBase<Message> {
  MessageMapper._();

  static MessageMapper? _instance;
  static MessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MessageMapper._());
      MessageTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Message';

  static int _$id(Message v) => v.id;
  static const Field<Message, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
    def: Isar.autoIncrement,
  );
  static String _$content(Message v) => v.content;
  static const Field<Message, String> _f$content = Field(
    'content',
    _$content,
    opt: true,
    def: '',
  );
  static DateTime _$timestamp(Message v) => v.timestamp;
  static const Field<Message, DateTime> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
  );
  static MessageType _$type(Message v) => v.type;
  static const Field<Message, MessageType> _f$type = Field(
    'type',
    _$type,
    opt: true,
    def: MessageType.text,
  );
  static bool _$isAttachment(Message v) => v.isAttachment;
  static const Field<Message, bool> _f$isAttachment = Field(
    'isAttachment',
    _$isAttachment,
    mode: FieldMode.member,
  );
  static String? _$filePath(Message v) => v.filePath;
  static const Field<Message, String> _f$filePath = Field(
    'filePath',
    _$filePath,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<Message> fields = const {
    #id: _f$id,
    #content: _f$content,
    #timestamp: _f$timestamp,
    #type: _f$type,
    #isAttachment: _f$isAttachment,
    #filePath: _f$filePath,
  };

  static Message _instantiate(DecodingData data) {
    return Message(
      id: data.dec(_f$id),
      content: data.dec(_f$content),
      timestamp: data.dec(_f$timestamp),
      type: data.dec(_f$type),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Message fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Message>(map);
  }

  static Message fromJson(String json) {
    return ensureInitialized().decodeJson<Message>(json);
  }
}

mixin MessageMappable {
  String toJson() {
    return MessageMapper.ensureInitialized().encodeJson<Message>(
      this as Message,
    );
  }

  Map<String, dynamic> toMap() {
    return MessageMapper.ensureInitialized().encodeMap<Message>(
      this as Message,
    );
  }

  MessageCopyWith<Message, Message, Message> get copyWith =>
      _MessageCopyWithImpl<Message, Message>(
        this as Message,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MessageMapper.ensureInitialized().stringifyValue(this as Message);
  }

  @override
  bool operator ==(Object other) {
    return MessageMapper.ensureInitialized().equalsValue(
      this as Message,
      other,
    );
  }

  @override
  int get hashCode {
    return MessageMapper.ensureInitialized().hashValue(this as Message);
  }
}

extension MessageValueCopy<$R, $Out> on ObjectCopyWith<$R, Message, $Out> {
  MessageCopyWith<$R, Message, $Out> get $asMessage =>
      $base.as((v, t, t2) => _MessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MessageCopyWith<$R, $In extends Message, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? content, DateTime? timestamp, MessageType? type});
  MessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Message, $Out>
    implements MessageCopyWith<$R, Message, $Out> {
  _MessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Message> $mapper =
      MessageMapper.ensureInitialized();
  @override
  $R call({int? id, String? content, DateTime? timestamp, MessageType? type}) =>
      $apply(
        FieldCopyWithData({
          if (id != null) #id: id,
          if (content != null) #content: content,
          if (timestamp != null) #timestamp: timestamp,
          if (type != null) #type: type,
        }),
      );
  @override
  Message $make(CopyWithData data) => Message(
    id: data.get(#id, or: $value.id),
    content: data.get(#content, or: $value.content),
    timestamp: data.get(#timestamp, or: $value.timestamp),
    type: data.get(#type, or: $value.type),
  );

  @override
  MessageCopyWith<$R2, Message, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

