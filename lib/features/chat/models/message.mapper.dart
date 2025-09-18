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
    }
    return _instance!;
  }

  @override
  final String id = 'Message';

  static int _$id(Message v) => v.id;
  static const Field<Message, int> _f$id = Field('id', _$id, opt: true, def: 0);
  static String _$text(Message v) => v.text;
  static const Field<Message, String> _f$text = Field(
    'text',
    _$text,
    opt: true,
    def: '',
  );
  static DateTime _$timestamp(Message v) => v.timestamp;
  static const Field<Message, DateTime> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
  );
  static int _$type(Message v) => v.type;
  static const Field<Message, int> _f$type = Field(
    'type',
    _$type,
    opt: true,
    def: 0,
  );
  static String _$description(Message v) => v.description;
  static const Field<Message, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static List<int>? _$fileData(Message v) => v.fileData;
  static const Field<Message, List<int>> _f$fileData = Field(
    'fileData',
    _$fileData,
    opt: true,
  );
  static String? _$mimeType(Message v) => v.mimeType;
  static const Field<Message, String> _f$mimeType = Field(
    'mimeType',
    _$mimeType,
    opt: true,
  );
  static String? _$transcript(Message v) => v.transcript;
  static const Field<Message, String> _f$transcript = Field(
    'transcript',
    _$transcript,
    opt: true,
  );
  static String? _$fileName(Message v) => v.fileName;
  static const Field<Message, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    opt: true,
  );
  static ToOne<Thread> _$thread(Message v) => v.thread;
  static const Field<Message, ToOne<Thread>> _f$thread = Field(
    'thread',
    _$thread,
    mode: FieldMode.member,
  );
  static ToMany<Tag> _$tags(Message v) => v.tags;
  static const Field<Message, ToMany<Tag>> _f$tags = Field(
    'tags',
    _$tags,
    mode: FieldMode.member,
  );
  static MessageType _$messageType(Message v) => v.messageType;
  static const Field<Message, MessageType> _f$messageType = Field(
    'messageType',
    _$messageType,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<Message> fields = const {
    #id: _f$id,
    #text: _f$text,
    #timestamp: _f$timestamp,
    #type: _f$type,
    #description: _f$description,
    #fileData: _f$fileData,
    #mimeType: _f$mimeType,
    #transcript: _f$transcript,
    #fileName: _f$fileName,
    #thread: _f$thread,
    #tags: _f$tags,
    #messageType: _f$messageType,
  };

  static Message _instantiate(DecodingData data) {
    return Message(
      id: data.dec(_f$id),
      text: data.dec(_f$text),
      timestamp: data.dec(_f$timestamp),
      type: data.dec(_f$type),
      description: data.dec(_f$description),
      fileData: data.dec(_f$fileData),
      mimeType: data.dec(_f$mimeType),
      transcript: data.dec(_f$transcript),
      fileName: data.dec(_f$fileName),
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
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get fileData;
  $R call({
    int? id,
    String? text,
    DateTime? timestamp,
    int? type,
    String? description,
    List<int>? fileData,
    String? mimeType,
    String? transcript,
    String? fileName,
  });
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
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get fileData =>
      $value.fileData != null
      ? ListCopyWith(
          $value.fileData!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(fileData: v),
        )
      : null;
  @override
  $R call({
    int? id,
    String? text,
    DateTime? timestamp,
    int? type,
    String? description,
    Object? fileData = $none,
    Object? mimeType = $none,
    Object? transcript = $none,
    Object? fileName = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (text != null) #text: text,
      if (timestamp != null) #timestamp: timestamp,
      if (type != null) #type: type,
      if (description != null) #description: description,
      if (fileData != $none) #fileData: fileData,
      if (mimeType != $none) #mimeType: mimeType,
      if (transcript != $none) #transcript: transcript,
      if (fileName != $none) #fileName: fileName,
    }),
  );
  @override
  Message $make(CopyWithData data) => Message(
    id: data.get(#id, or: $value.id),
    text: data.get(#text, or: $value.text),
    timestamp: data.get(#timestamp, or: $value.timestamp),
    type: data.get(#type, or: $value.type),
    description: data.get(#description, or: $value.description),
    fileData: data.get(#fileData, or: $value.fileData),
    mimeType: data.get(#mimeType, or: $value.mimeType),
    transcript: data.get(#transcript, or: $value.transcript),
    fileName: data.get(#fileName, or: $value.fileName),
  );

  @override
  MessageCopyWith<$R2, Message, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

