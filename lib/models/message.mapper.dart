// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'message.dart';

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
  static MessageType _$type(Message v) => v.type;
  static const Field<Message, MessageType> _f$type = Field(
    'type',
    _$type,
    opt: true,
    def: MessageType.text,
  );
  static DateTime _$timestamp(Message v) => v.timestamp;
  static const Field<Message, DateTime> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
  );
  static bool _$isUser(Message v) => v.isUser;
  static const Field<Message, bool> _f$isUser = Field(
    'isUser',
    _$isUser,
    opt: true,
    def: true,
  );
  static String _$threadId(Message v) => v.threadId;
  static const Field<Message, String> _f$threadId = Field(
    'threadId',
    _$threadId,
    opt: true,
    def: '',
  );
  static String _$filePath(Message v) => v.filePath;
  static const Field<Message, String> _f$filePath = Field(
    'filePath',
    _$filePath,
    opt: true,
    def: '',
  );
  static String _$fileName(Message v) => v.fileName;
  static const Field<Message, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    opt: true,
    def: '',
  );
  static int _$fileSize(Message v) => v.fileSize;
  static const Field<Message, int> _f$fileSize = Field(
    'fileSize',
    _$fileSize,
    opt: true,
    def: 0,
  );
  static String _$mimeType(Message v) => v.mimeType;
  static const Field<Message, String> _f$mimeType = Field(
    'mimeType',
    _$mimeType,
    opt: true,
    def: '',
  );
  static String _$transcription(Message v) => v.transcription;
  static const Field<Message, String> _f$transcription = Field(
    'transcription',
    _$transcription,
    opt: true,
    def: '',
  );
  static Map<String, dynamic> _$metadata(Message v) => v.metadata;
  static const Field<Message, Map<String, dynamic>> _f$metadata = Field(
    'metadata',
    _$metadata,
    opt: true,
    def: const {},
  );
  static String _$displayContent(Message v) => v.displayContent;
  static const Field<Message, String> _f$displayContent = Field(
    'displayContent',
    _$displayContent,
    mode: FieldMode.member,
  );
  static bool _$hasFile(Message v) => v.hasFile;
  static const Field<Message, bool> _f$hasFile = Field(
    'hasFile',
    _$hasFile,
    mode: FieldMode.member,
  );
  static double _$fileSizeMB(Message v) => v.fileSizeMB;
  static const Field<Message, double> _f$fileSizeMB = Field(
    'fileSizeMB',
    _$fileSizeMB,
    mode: FieldMode.member,
  );
  static int? _$audioDuration(Message v) => v.audioDuration;
  static const Field<Message, int> _f$audioDuration = Field(
    'audioDuration',
    _$audioDuration,
    mode: FieldMode.member,
  );
  static String? _$aiMode(Message v) => v.aiMode;
  static const Field<Message, String> _f$aiMode = Field(
    'aiMode',
    _$aiMode,
    mode: FieldMode.member,
  );
  static bool _$isDeletable(Message v) => v.isDeletable;
  static const Field<Message, bool> _f$isDeletable = Field(
    'isDeletable',
    _$isDeletable,
    mode: FieldMode.member,
  );
  static String _$formattedTime(Message v) => v.formattedTime;
  static const Field<Message, String> _f$formattedTime = Field(
    'formattedTime',
    _$formattedTime,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<Message> fields = const {
    #id: _f$id,
    #content: _f$content,
    #type: _f$type,
    #timestamp: _f$timestamp,
    #isUser: _f$isUser,
    #threadId: _f$threadId,
    #filePath: _f$filePath,
    #fileName: _f$fileName,
    #fileSize: _f$fileSize,
    #mimeType: _f$mimeType,
    #transcription: _f$transcription,
    #metadata: _f$metadata,
    #displayContent: _f$displayContent,
    #hasFile: _f$hasFile,
    #fileSizeMB: _f$fileSizeMB,
    #audioDuration: _f$audioDuration,
    #aiMode: _f$aiMode,
    #isDeletable: _f$isDeletable,
    #formattedTime: _f$formattedTime,
  };

  static Message _instantiate(DecodingData data) {
    return Message(
      id: data.dec(_f$id),
      content: data.dec(_f$content),
      type: data.dec(_f$type),
      timestamp: data.dec(_f$timestamp),
      isUser: data.dec(_f$isUser),
      threadId: data.dec(_f$threadId),
      filePath: data.dec(_f$filePath),
      fileName: data.dec(_f$fileName),
      fileSize: data.dec(_f$fileSize),
      mimeType: data.dec(_f$mimeType),
      transcription: data.dec(_f$transcription),
      metadata: data.dec(_f$metadata),
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
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get metadata;
  $R call({
    int? id,
    String? content,
    MessageType? type,
    DateTime? timestamp,
    bool? isUser,
    String? threadId,
    String? filePath,
    String? fileName,
    int? fileSize,
    String? mimeType,
    String? transcription,
    Map<String, dynamic>? metadata,
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
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get metadata => MapCopyWith(
    $value.metadata,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(metadata: v),
  );
  @override
  $R call({
    int? id,
    String? content,
    MessageType? type,
    DateTime? timestamp,
    bool? isUser,
    String? threadId,
    String? filePath,
    String? fileName,
    int? fileSize,
    String? mimeType,
    String? transcription,
    Map<String, dynamic>? metadata,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (content != null) #content: content,
      if (type != null) #type: type,
      if (timestamp != null) #timestamp: timestamp,
      if (isUser != null) #isUser: isUser,
      if (threadId != null) #threadId: threadId,
      if (filePath != null) #filePath: filePath,
      if (fileName != null) #fileName: fileName,
      if (fileSize != null) #fileSize: fileSize,
      if (mimeType != null) #mimeType: mimeType,
      if (transcription != null) #transcription: transcription,
      if (metadata != null) #metadata: metadata,
    }),
  );
  @override
  Message $make(CopyWithData data) => Message(
    id: data.get(#id, or: $value.id),
    content: data.get(#content, or: $value.content),
    type: data.get(#type, or: $value.type),
    timestamp: data.get(#timestamp, or: $value.timestamp),
    isUser: data.get(#isUser, or: $value.isUser),
    threadId: data.get(#threadId, or: $value.threadId),
    filePath: data.get(#filePath, or: $value.filePath),
    fileName: data.get(#fileName, or: $value.fileName),
    fileSize: data.get(#fileSize, or: $value.fileSize),
    mimeType: data.get(#mimeType, or: $value.mimeType),
    transcription: data.get(#transcription, or: $value.transcription),
    metadata: data.get(#metadata, or: $value.metadata),
  );

  @override
  MessageCopyWith<$R2, Message, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

