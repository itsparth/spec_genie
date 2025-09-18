// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_input.dart';

class ChatInputTypeMapper extends EnumMapper<ChatInputType> {
  ChatInputTypeMapper._();

  static ChatInputTypeMapper? _instance;
  static ChatInputTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatInputTypeMapper._());
    }
    return _instance!;
  }

  static ChatInputType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ChatInputType decode(dynamic value) {
    switch (value) {
      case r'text':
        return ChatInputType.text;
      case r'image':
        return ChatInputType.image;
      case r'audio':
        return ChatInputType.audio;
      case r'file':
        return ChatInputType.file;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ChatInputType self) {
    switch (self) {
      case ChatInputType.text:
        return r'text';
      case ChatInputType.image:
        return r'image';
      case ChatInputType.audio:
        return r'audio';
      case ChatInputType.file:
        return r'file';
    }
  }
}

extension ChatInputTypeMapperExtension on ChatInputType {
  String toValue() {
    ChatInputTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ChatInputType>(this) as String;
  }
}

class AudioInputSourceMapper extends EnumMapper<AudioInputSource> {
  AudioInputSourceMapper._();

  static AudioInputSourceMapper? _instance;
  static AudioInputSourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AudioInputSourceMapper._());
    }
    return _instance!;
  }

  static AudioInputSource fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AudioInputSource decode(dynamic value) {
    switch (value) {
      case r'recording':
        return AudioInputSource.recording;
      case r'file':
        return AudioInputSource.file;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AudioInputSource self) {
    switch (self) {
      case AudioInputSource.recording:
        return r'recording';
      case AudioInputSource.file:
        return r'file';
    }
  }
}

extension AudioInputSourceMapperExtension on AudioInputSource {
  String toValue() {
    AudioInputSourceMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AudioInputSource>(this) as String;
  }
}

class FileInputTypeMapper extends EnumMapper<FileInputType> {
  FileInputTypeMapper._();

  static FileInputTypeMapper? _instance;
  static FileInputTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileInputTypeMapper._());
    }
    return _instance!;
  }

  static FileInputType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FileInputType decode(dynamic value) {
    switch (value) {
      case r'audio':
        return FileInputType.audio;
      case r'image':
        return FileInputType.image;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FileInputType self) {
    switch (self) {
      case FileInputType.audio:
        return r'audio';
      case FileInputType.image:
        return r'image';
    }
  }
}

extension FileInputTypeMapperExtension on FileInputType {
  String toValue() {
    FileInputTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FileInputType>(this) as String;
  }
}

class ImageSourceMapper extends EnumMapper<ImageSource> {
  ImageSourceMapper._();

  static ImageSourceMapper? _instance;
  static ImageSourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImageSourceMapper._());
    }
    return _instance!;
  }

  static ImageSource fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ImageSource decode(dynamic value) {
    switch (value) {
      case r'camera':
        return ImageSource.camera;
      case r'gallery':
        return ImageSource.gallery;
      case r'file':
        return ImageSource.file;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ImageSource self) {
    switch (self) {
      case ImageSource.camera:
        return r'camera';
      case ImageSource.gallery:
        return r'gallery';
      case ImageSource.file:
        return r'file';
    }
  }
}

extension ImageSourceMapperExtension on ImageSource {
  String toValue() {
    ImageSourceMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ImageSource>(this) as String;
  }
}

class ChatInputMapper extends ClassMapperBase<ChatInput> {
  ChatInputMapper._();

  static ChatInputMapper? _instance;
  static ChatInputMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatInputMapper._());
      TextChatInputMapper.ensureInitialized();
      ImageChatInputMapper.ensureInitialized();
      AudioChatInputMapper.ensureInitialized();
      FileChatInputMapper.ensureInitialized();
      ChatInputTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChatInput';

  static String _$id(ChatInput v) => v.id;
  static const Field<ChatInput, String> _f$id = Field('id', _$id);
  static DateTime _$createdAt(ChatInput v) => v.createdAt;
  static const Field<ChatInput, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static ChatInputType _$type(ChatInput v) => v.type;
  static const Field<ChatInput, ChatInputType> _f$type = Field('type', _$type);

  @override
  final MappableFields<ChatInput> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #type: _f$type,
  };

  static ChatInput _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('ChatInput');
  }

  @override
  final Function instantiate = _instantiate;

  static ChatInput fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatInput>(map);
  }

  static ChatInput fromJson(String json) {
    return ensureInitialized().decodeJson<ChatInput>(json);
  }
}

mixin ChatInputMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ChatInputCopyWith<ChatInput, ChatInput, ChatInput> get copyWith;
}

abstract class ChatInputCopyWith<$R, $In extends ChatInput, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, DateTime? createdAt});
  ChatInputCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class TextChatInputMapper extends ClassMapperBase<TextChatInput> {
  TextChatInputMapper._();

  static TextChatInputMapper? _instance;
  static TextChatInputMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextChatInputMapper._());
      ChatInputMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TextChatInput';

  static String _$id(TextChatInput v) => v.id;
  static const Field<TextChatInput, String> _f$id = Field('id', _$id);
  static DateTime _$createdAt(TextChatInput v) => v.createdAt;
  static const Field<TextChatInput, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static String _$text(TextChatInput v) => v.text;
  static const Field<TextChatInput, String> _f$text = Field('text', _$text);
  static ChatInputType _$type(TextChatInput v) => v.type;
  static const Field<TextChatInput, ChatInputType> _f$type = Field(
    'type',
    _$type,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<TextChatInput> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #text: _f$text,
    #type: _f$type,
  };

  static TextChatInput _instantiate(DecodingData data) {
    return TextChatInput(
      id: data.dec(_f$id),
      createdAt: data.dec(_f$createdAt),
      text: data.dec(_f$text),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TextChatInput fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextChatInput>(map);
  }

  static TextChatInput fromJson(String json) {
    return ensureInitialized().decodeJson<TextChatInput>(json);
  }
}

mixin TextChatInputMappable {
  String toJson() {
    return TextChatInputMapper.ensureInitialized().encodeJson<TextChatInput>(
      this as TextChatInput,
    );
  }

  Map<String, dynamic> toMap() {
    return TextChatInputMapper.ensureInitialized().encodeMap<TextChatInput>(
      this as TextChatInput,
    );
  }

  TextChatInputCopyWith<TextChatInput, TextChatInput, TextChatInput>
      get copyWith => _TextChatInputCopyWithImpl<TextChatInput, TextChatInput>(
            this as TextChatInput,
            $identity,
            $identity,
          );
  @override
  String toString() {
    return TextChatInputMapper.ensureInitialized().stringifyValue(
      this as TextChatInput,
    );
  }

  @override
  bool operator ==(Object other) {
    return TextChatInputMapper.ensureInitialized().equalsValue(
      this as TextChatInput,
      other,
    );
  }

  @override
  int get hashCode {
    return TextChatInputMapper.ensureInitialized().hashValue(
      this as TextChatInput,
    );
  }
}

extension TextChatInputValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextChatInput, $Out> {
  TextChatInputCopyWith<$R, TextChatInput, $Out> get $asTextChatInput =>
      $base.as((v, t, t2) => _TextChatInputCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TextChatInputCopyWith<$R, $In extends TextChatInput, $Out>
    implements ChatInputCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, DateTime? createdAt, String? text});
  TextChatInputCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TextChatInputCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextChatInput, $Out>
    implements TextChatInputCopyWith<$R, TextChatInput, $Out> {
  _TextChatInputCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextChatInput> $mapper =
      TextChatInputMapper.ensureInitialized();
  @override
  $R call({String? id, DateTime? createdAt, String? text}) => $apply(
        FieldCopyWithData({
          if (id != null) #id: id,
          if (createdAt != null) #createdAt: createdAt,
          if (text != null) #text: text,
        }),
      );
  @override
  TextChatInput $make(CopyWithData data) => TextChatInput(
        id: data.get(#id, or: $value.id),
        createdAt: data.get(#createdAt, or: $value.createdAt),
        text: data.get(#text, or: $value.text),
      );

  @override
  TextChatInputCopyWith<$R2, TextChatInput, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _TextChatInputCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ImageChatInputMapper extends ClassMapperBase<ImageChatInput> {
  ImageChatInputMapper._();

  static ImageChatInputMapper? _instance;
  static ImageChatInputMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImageChatInputMapper._());
      ChatInputMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ImageChatInput';

  static String _$id(ImageChatInput v) => v.id;
  static const Field<ImageChatInput, String> _f$id = Field('id', _$id);
  static DateTime _$createdAt(ImageChatInput v) => v.createdAt;
  static const Field<ImageChatInput, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static String _$filePath(ImageChatInput v) => v.filePath;
  static const Field<ImageChatInput, String> _f$filePath = Field(
    'filePath',
    _$filePath,
  );
  static String? _$fileName(ImageChatInput v) => v.fileName;
  static const Field<ImageChatInput, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    opt: true,
  );
  static int? _$fileSize(ImageChatInput v) => v.fileSize;
  static const Field<ImageChatInput, int> _f$fileSize = Field(
    'fileSize',
    _$fileSize,
    opt: true,
  );
  static Uint8List? _$imageData(ImageChatInput v) => v.imageData;
  static const Field<ImageChatInput, Uint8List> _f$imageData = Field(
    'imageData',
    _$imageData,
    opt: true,
  );
  static String? _$mimeType(ImageChatInput v) => v.mimeType;
  static const Field<ImageChatInput, String> _f$mimeType = Field(
    'mimeType',
    _$mimeType,
    opt: true,
  );
  static String? _$caption(ImageChatInput v) => v.caption;
  static const Field<ImageChatInput, String> _f$caption = Field(
    'caption',
    _$caption,
    opt: true,
  );
  static ChatInputType _$type(ImageChatInput v) => v.type;
  static const Field<ImageChatInput, ChatInputType> _f$type = Field(
    'type',
    _$type,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ImageChatInput> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #filePath: _f$filePath,
    #fileName: _f$fileName,
    #fileSize: _f$fileSize,
    #imageData: _f$imageData,
    #mimeType: _f$mimeType,
    #caption: _f$caption,
    #type: _f$type,
  };

  static ImageChatInput _instantiate(DecodingData data) {
    return ImageChatInput(
      id: data.dec(_f$id),
      createdAt: data.dec(_f$createdAt),
      filePath: data.dec(_f$filePath),
      fileName: data.dec(_f$fileName),
      fileSize: data.dec(_f$fileSize),
      imageData: data.dec(_f$imageData),
      mimeType: data.dec(_f$mimeType),
      caption: data.dec(_f$caption),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ImageChatInput fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImageChatInput>(map);
  }

  static ImageChatInput fromJson(String json) {
    return ensureInitialized().decodeJson<ImageChatInput>(json);
  }
}

mixin ImageChatInputMappable {
  String toJson() {
    return ImageChatInputMapper.ensureInitialized().encodeJson<ImageChatInput>(
      this as ImageChatInput,
    );
  }

  Map<String, dynamic> toMap() {
    return ImageChatInputMapper.ensureInitialized().encodeMap<ImageChatInput>(
      this as ImageChatInput,
    );
  }

  ImageChatInputCopyWith<ImageChatInput, ImageChatInput, ImageChatInput>
      get copyWith =>
          _ImageChatInputCopyWithImpl<ImageChatInput, ImageChatInput>(
            this as ImageChatInput,
            $identity,
            $identity,
          );
  @override
  String toString() {
    return ImageChatInputMapper.ensureInitialized().stringifyValue(
      this as ImageChatInput,
    );
  }

  @override
  bool operator ==(Object other) {
    return ImageChatInputMapper.ensureInitialized().equalsValue(
      this as ImageChatInput,
      other,
    );
  }

  @override
  int get hashCode {
    return ImageChatInputMapper.ensureInitialized().hashValue(
      this as ImageChatInput,
    );
  }
}

extension ImageChatInputValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImageChatInput, $Out> {
  ImageChatInputCopyWith<$R, ImageChatInput, $Out> get $asImageChatInput =>
      $base.as((v, t, t2) => _ImageChatInputCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ImageChatInputCopyWith<$R, $In extends ImageChatInput, $Out>
    implements ChatInputCopyWith<$R, $In, $Out> {
  @override
  $R call({
    String? id,
    DateTime? createdAt,
    String? filePath,
    String? fileName,
    int? fileSize,
    Uint8List? imageData,
    String? mimeType,
    String? caption,
  });
  ImageChatInputCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ImageChatInputCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImageChatInput, $Out>
    implements ImageChatInputCopyWith<$R, ImageChatInput, $Out> {
  _ImageChatInputCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImageChatInput> $mapper =
      ImageChatInputMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    DateTime? createdAt,
    String? filePath,
    Object? fileName = $none,
    Object? fileSize = $none,
    Object? imageData = $none,
    Object? mimeType = $none,
    Object? caption = $none,
  }) =>
      $apply(
        FieldCopyWithData({
          if (id != null) #id: id,
          if (createdAt != null) #createdAt: createdAt,
          if (filePath != null) #filePath: filePath,
          if (fileName != $none) #fileName: fileName,
          if (fileSize != $none) #fileSize: fileSize,
          if (imageData != $none) #imageData: imageData,
          if (mimeType != $none) #mimeType: mimeType,
          if (caption != $none) #caption: caption,
        }),
      );
  @override
  ImageChatInput $make(CopyWithData data) => ImageChatInput(
        id: data.get(#id, or: $value.id),
        createdAt: data.get(#createdAt, or: $value.createdAt),
        filePath: data.get(#filePath, or: $value.filePath),
        fileName: data.get(#fileName, or: $value.fileName),
        fileSize: data.get(#fileSize, or: $value.fileSize),
        imageData: data.get(#imageData, or: $value.imageData),
        mimeType: data.get(#mimeType, or: $value.mimeType),
        caption: data.get(#caption, or: $value.caption),
      );

  @override
  ImageChatInputCopyWith<$R2, ImageChatInput, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _ImageChatInputCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AudioChatInputMapper extends ClassMapperBase<AudioChatInput> {
  AudioChatInputMapper._();

  static AudioChatInputMapper? _instance;
  static AudioChatInputMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AudioChatInputMapper._());
      ChatInputMapper.ensureInitialized();
      AudioInputSourceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AudioChatInput';

  static String _$id(AudioChatInput v) => v.id;
  static const Field<AudioChatInput, String> _f$id = Field('id', _$id);
  static DateTime _$createdAt(AudioChatInput v) => v.createdAt;
  static const Field<AudioChatInput, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static String _$filePath(AudioChatInput v) => v.filePath;
  static const Field<AudioChatInput, String> _f$filePath = Field(
    'filePath',
    _$filePath,
  );
  static String? _$fileName(AudioChatInput v) => v.fileName;
  static const Field<AudioChatInput, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    opt: true,
  );
  static int? _$fileSize(AudioChatInput v) => v.fileSize;
  static const Field<AudioChatInput, int> _f$fileSize = Field(
    'fileSize',
    _$fileSize,
    opt: true,
  );
  static Uint8List? _$audioData(AudioChatInput v) => v.audioData;
  static const Field<AudioChatInput, Uint8List> _f$audioData = Field(
    'audioData',
    _$audioData,
    opt: true,
  );
  static String? _$mimeType(AudioChatInput v) => v.mimeType;
  static const Field<AudioChatInput, String> _f$mimeType = Field(
    'mimeType',
    _$mimeType,
    opt: true,
  );
  static Duration? _$duration(AudioChatInput v) => v.duration;
  static const Field<AudioChatInput, Duration> _f$duration = Field(
    'duration',
    _$duration,
    opt: true,
  );
  static String? _$transcript(AudioChatInput v) => v.transcript;
  static const Field<AudioChatInput, String> _f$transcript = Field(
    'transcript',
    _$transcript,
    opt: true,
  );
  static AudioInputSource _$source(AudioChatInput v) => v.source;
  static const Field<AudioChatInput, AudioInputSource> _f$source = Field(
    'source',
    _$source,
    opt: true,
    def: AudioInputSource.recording,
  );
  static ChatInputType _$type(AudioChatInput v) => v.type;
  static const Field<AudioChatInput, ChatInputType> _f$type = Field(
    'type',
    _$type,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<AudioChatInput> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #filePath: _f$filePath,
    #fileName: _f$fileName,
    #fileSize: _f$fileSize,
    #audioData: _f$audioData,
    #mimeType: _f$mimeType,
    #duration: _f$duration,
    #transcript: _f$transcript,
    #source: _f$source,
    #type: _f$type,
  };

  static AudioChatInput _instantiate(DecodingData data) {
    return AudioChatInput(
      id: data.dec(_f$id),
      createdAt: data.dec(_f$createdAt),
      filePath: data.dec(_f$filePath),
      fileName: data.dec(_f$fileName),
      fileSize: data.dec(_f$fileSize),
      audioData: data.dec(_f$audioData),
      mimeType: data.dec(_f$mimeType),
      duration: data.dec(_f$duration),
      transcript: data.dec(_f$transcript),
      source: data.dec(_f$source),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AudioChatInput fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AudioChatInput>(map);
  }

  static AudioChatInput fromJson(String json) {
    return ensureInitialized().decodeJson<AudioChatInput>(json);
  }
}

mixin AudioChatInputMappable {
  String toJson() {
    return AudioChatInputMapper.ensureInitialized().encodeJson<AudioChatInput>(
      this as AudioChatInput,
    );
  }

  Map<String, dynamic> toMap() {
    return AudioChatInputMapper.ensureInitialized().encodeMap<AudioChatInput>(
      this as AudioChatInput,
    );
  }

  AudioChatInputCopyWith<AudioChatInput, AudioChatInput, AudioChatInput>
      get copyWith =>
          _AudioChatInputCopyWithImpl<AudioChatInput, AudioChatInput>(
            this as AudioChatInput,
            $identity,
            $identity,
          );
  @override
  String toString() {
    return AudioChatInputMapper.ensureInitialized().stringifyValue(
      this as AudioChatInput,
    );
  }

  @override
  bool operator ==(Object other) {
    return AudioChatInputMapper.ensureInitialized().equalsValue(
      this as AudioChatInput,
      other,
    );
  }

  @override
  int get hashCode {
    return AudioChatInputMapper.ensureInitialized().hashValue(
      this as AudioChatInput,
    );
  }
}

extension AudioChatInputValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AudioChatInput, $Out> {
  AudioChatInputCopyWith<$R, AudioChatInput, $Out> get $asAudioChatInput =>
      $base.as((v, t, t2) => _AudioChatInputCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AudioChatInputCopyWith<$R, $In extends AudioChatInput, $Out>
    implements ChatInputCopyWith<$R, $In, $Out> {
  @override
  $R call({
    String? id,
    DateTime? createdAt,
    String? filePath,
    String? fileName,
    int? fileSize,
    Uint8List? audioData,
    String? mimeType,
    Duration? duration,
    String? transcript,
    AudioInputSource? source,
  });
  AudioChatInputCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AudioChatInputCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AudioChatInput, $Out>
    implements AudioChatInputCopyWith<$R, AudioChatInput, $Out> {
  _AudioChatInputCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AudioChatInput> $mapper =
      AudioChatInputMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    DateTime? createdAt,
    String? filePath,
    Object? fileName = $none,
    Object? fileSize = $none,
    Object? audioData = $none,
    Object? mimeType = $none,
    Object? duration = $none,
    Object? transcript = $none,
    AudioInputSource? source,
  }) =>
      $apply(
        FieldCopyWithData({
          if (id != null) #id: id,
          if (createdAt != null) #createdAt: createdAt,
          if (filePath != null) #filePath: filePath,
          if (fileName != $none) #fileName: fileName,
          if (fileSize != $none) #fileSize: fileSize,
          if (audioData != $none) #audioData: audioData,
          if (mimeType != $none) #mimeType: mimeType,
          if (duration != $none) #duration: duration,
          if (transcript != $none) #transcript: transcript,
          if (source != null) #source: source,
        }),
      );
  @override
  AudioChatInput $make(CopyWithData data) => AudioChatInput(
        id: data.get(#id, or: $value.id),
        createdAt: data.get(#createdAt, or: $value.createdAt),
        filePath: data.get(#filePath, or: $value.filePath),
        fileName: data.get(#fileName, or: $value.fileName),
        fileSize: data.get(#fileSize, or: $value.fileSize),
        audioData: data.get(#audioData, or: $value.audioData),
        mimeType: data.get(#mimeType, or: $value.mimeType),
        duration: data.get(#duration, or: $value.duration),
        transcript: data.get(#transcript, or: $value.transcript),
        source: data.get(#source, or: $value.source),
      );

  @override
  AudioChatInputCopyWith<$R2, AudioChatInput, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _AudioChatInputCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FileChatInputMapper extends ClassMapperBase<FileChatInput> {
  FileChatInputMapper._();

  static FileChatInputMapper? _instance;
  static FileChatInputMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileChatInputMapper._());
      ChatInputMapper.ensureInitialized();
      FileInputTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FileChatInput';

  static String _$id(FileChatInput v) => v.id;
  static const Field<FileChatInput, String> _f$id = Field('id', _$id);
  static DateTime _$createdAt(FileChatInput v) => v.createdAt;
  static const Field<FileChatInput, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static String _$filePath(FileChatInput v) => v.filePath;
  static const Field<FileChatInput, String> _f$filePath = Field(
    'filePath',
    _$filePath,
  );
  static String _$fileName(FileChatInput v) => v.fileName;
  static const Field<FileChatInput, String> _f$fileName = Field(
    'fileName',
    _$fileName,
  );
  static int _$fileSize(FileChatInput v) => v.fileSize;
  static const Field<FileChatInput, int> _f$fileSize = Field(
    'fileSize',
    _$fileSize,
  );
  static Uint8List? _$fileData(FileChatInput v) => v.fileData;
  static const Field<FileChatInput, Uint8List> _f$fileData = Field(
    'fileData',
    _$fileData,
    opt: true,
  );
  static String _$mimeType(FileChatInput v) => v.mimeType;
  static const Field<FileChatInput, String> _f$mimeType = Field(
    'mimeType',
    _$mimeType,
  );
  static FileInputType _$fileType(FileChatInput v) => v.fileType;
  static const Field<FileChatInput, FileInputType> _f$fileType = Field(
    'fileType',
    _$fileType,
  );
  static ChatInputType _$type(FileChatInput v) => v.type;
  static const Field<FileChatInput, ChatInputType> _f$type = Field(
    'type',
    _$type,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<FileChatInput> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #filePath: _f$filePath,
    #fileName: _f$fileName,
    #fileSize: _f$fileSize,
    #fileData: _f$fileData,
    #mimeType: _f$mimeType,
    #fileType: _f$fileType,
    #type: _f$type,
  };

  static FileChatInput _instantiate(DecodingData data) {
    return FileChatInput(
      id: data.dec(_f$id),
      createdAt: data.dec(_f$createdAt),
      filePath: data.dec(_f$filePath),
      fileName: data.dec(_f$fileName),
      fileSize: data.dec(_f$fileSize),
      fileData: data.dec(_f$fileData),
      mimeType: data.dec(_f$mimeType),
      fileType: data.dec(_f$fileType),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FileChatInput fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileChatInput>(map);
  }

  static FileChatInput fromJson(String json) {
    return ensureInitialized().decodeJson<FileChatInput>(json);
  }
}

mixin FileChatInputMappable {
  String toJson() {
    return FileChatInputMapper.ensureInitialized().encodeJson<FileChatInput>(
      this as FileChatInput,
    );
  }

  Map<String, dynamic> toMap() {
    return FileChatInputMapper.ensureInitialized().encodeMap<FileChatInput>(
      this as FileChatInput,
    );
  }

  FileChatInputCopyWith<FileChatInput, FileChatInput, FileChatInput>
      get copyWith => _FileChatInputCopyWithImpl<FileChatInput, FileChatInput>(
            this as FileChatInput,
            $identity,
            $identity,
          );
  @override
  String toString() {
    return FileChatInputMapper.ensureInitialized().stringifyValue(
      this as FileChatInput,
    );
  }

  @override
  bool operator ==(Object other) {
    return FileChatInputMapper.ensureInitialized().equalsValue(
      this as FileChatInput,
      other,
    );
  }

  @override
  int get hashCode {
    return FileChatInputMapper.ensureInitialized().hashValue(
      this as FileChatInput,
    );
  }
}

extension FileChatInputValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FileChatInput, $Out> {
  FileChatInputCopyWith<$R, FileChatInput, $Out> get $asFileChatInput =>
      $base.as((v, t, t2) => _FileChatInputCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FileChatInputCopyWith<$R, $In extends FileChatInput, $Out>
    implements ChatInputCopyWith<$R, $In, $Out> {
  @override
  $R call({
    String? id,
    DateTime? createdAt,
    String? filePath,
    String? fileName,
    int? fileSize,
    Uint8List? fileData,
    String? mimeType,
    FileInputType? fileType,
  });
  FileChatInputCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FileChatInputCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileChatInput, $Out>
    implements FileChatInputCopyWith<$R, FileChatInput, $Out> {
  _FileChatInputCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileChatInput> $mapper =
      FileChatInputMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    DateTime? createdAt,
    String? filePath,
    String? fileName,
    int? fileSize,
    Object? fileData = $none,
    String? mimeType,
    FileInputType? fileType,
  }) =>
      $apply(
        FieldCopyWithData({
          if (id != null) #id: id,
          if (createdAt != null) #createdAt: createdAt,
          if (filePath != null) #filePath: filePath,
          if (fileName != null) #fileName: fileName,
          if (fileSize != null) #fileSize: fileSize,
          if (fileData != $none) #fileData: fileData,
          if (mimeType != null) #mimeType: mimeType,
          if (fileType != null) #fileType: fileType,
        }),
      );
  @override
  FileChatInput $make(CopyWithData data) => FileChatInput(
        id: data.get(#id, or: $value.id),
        createdAt: data.get(#createdAt, or: $value.createdAt),
        filePath: data.get(#filePath, or: $value.filePath),
        fileName: data.get(#fileName, or: $value.fileName),
        fileSize: data.get(#fileSize, or: $value.fileSize),
        fileData: data.get(#fileData, or: $value.fileData),
        mimeType: data.get(#mimeType, or: $value.mimeType),
        fileType: data.get(#fileType, or: $value.fileType),
      );

  @override
  FileChatInputCopyWith<$R2, FileChatInput, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _FileChatInputCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AudioRecordingConfigMapper extends ClassMapperBase<AudioRecordingConfig> {
  AudioRecordingConfigMapper._();

  static AudioRecordingConfigMapper? _instance;
  static AudioRecordingConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AudioRecordingConfigMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AudioRecordingConfig';

  static String _$encoder(AudioRecordingConfig v) => v.encoder;
  static const Field<AudioRecordingConfig, String> _f$encoder = Field(
    'encoder',
    _$encoder,
    opt: true,
    def: 'aacLc',
  );
  static int _$sampleRate(AudioRecordingConfig v) => v.sampleRate;
  static const Field<AudioRecordingConfig, int> _f$sampleRate = Field(
    'sampleRate',
    _$sampleRate,
    opt: true,
    def: 44100,
  );
  static int _$bitRate(AudioRecordingConfig v) => v.bitRate;
  static const Field<AudioRecordingConfig, int> _f$bitRate = Field(
    'bitRate',
    _$bitRate,
    opt: true,
    def: 128000,
  );
  static int _$numChannels(AudioRecordingConfig v) => v.numChannels;
  static const Field<AudioRecordingConfig, int> _f$numChannels = Field(
    'numChannels',
    _$numChannels,
    opt: true,
    def: 1,
  );
  static bool _$enableBackgroundRecording(AudioRecordingConfig v) =>
      v.enableBackgroundRecording;
  static const Field<AudioRecordingConfig, bool> _f$enableBackgroundRecording =
      Field(
    'enableBackgroundRecording',
    _$enableBackgroundRecording,
    opt: true,
    def: true,
  );
  static bool _$enableNoiseReduction(AudioRecordingConfig v) =>
      v.enableNoiseReduction;
  static const Field<AudioRecordingConfig, bool> _f$enableNoiseReduction =
      Field(
    'enableNoiseReduction',
    _$enableNoiseReduction,
    opt: true,
    def: true,
  );
  static bool _$enableEchoCancellation(AudioRecordingConfig v) =>
      v.enableEchoCancellation;
  static const Field<AudioRecordingConfig, bool> _f$enableEchoCancellation =
      Field(
    'enableEchoCancellation',
    _$enableEchoCancellation,
    opt: true,
    def: true,
  );

  @override
  final MappableFields<AudioRecordingConfig> fields = const {
    #encoder: _f$encoder,
    #sampleRate: _f$sampleRate,
    #bitRate: _f$bitRate,
    #numChannels: _f$numChannels,
    #enableBackgroundRecording: _f$enableBackgroundRecording,
    #enableNoiseReduction: _f$enableNoiseReduction,
    #enableEchoCancellation: _f$enableEchoCancellation,
  };

  static AudioRecordingConfig _instantiate(DecodingData data) {
    return AudioRecordingConfig(
      encoder: data.dec(_f$encoder),
      sampleRate: data.dec(_f$sampleRate),
      bitRate: data.dec(_f$bitRate),
      numChannels: data.dec(_f$numChannels),
      enableBackgroundRecording: data.dec(_f$enableBackgroundRecording),
      enableNoiseReduction: data.dec(_f$enableNoiseReduction),
      enableEchoCancellation: data.dec(_f$enableEchoCancellation),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AudioRecordingConfig fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AudioRecordingConfig>(map);
  }

  static AudioRecordingConfig fromJson(String json) {
    return ensureInitialized().decodeJson<AudioRecordingConfig>(json);
  }
}

mixin AudioRecordingConfigMappable {
  String toJson() {
    return AudioRecordingConfigMapper.ensureInitialized()
        .encodeJson<AudioRecordingConfig>(this as AudioRecordingConfig);
  }

  Map<String, dynamic> toMap() {
    return AudioRecordingConfigMapper.ensureInitialized()
        .encodeMap<AudioRecordingConfig>(this as AudioRecordingConfig);
  }

  AudioRecordingConfigCopyWith<AudioRecordingConfig, AudioRecordingConfig,
      AudioRecordingConfig> get copyWith => _AudioRecordingConfigCopyWithImpl<
          AudioRecordingConfig, AudioRecordingConfig>(
      this as AudioRecordingConfig, $identity, $identity);
  @override
  String toString() {
    return AudioRecordingConfigMapper.ensureInitialized().stringifyValue(
      this as AudioRecordingConfig,
    );
  }

  @override
  bool operator ==(Object other) {
    return AudioRecordingConfigMapper.ensureInitialized().equalsValue(
      this as AudioRecordingConfig,
      other,
    );
  }

  @override
  int get hashCode {
    return AudioRecordingConfigMapper.ensureInitialized().hashValue(
      this as AudioRecordingConfig,
    );
  }
}

extension AudioRecordingConfigValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AudioRecordingConfig, $Out> {
  AudioRecordingConfigCopyWith<$R, AudioRecordingConfig, $Out>
      get $asAudioRecordingConfig => $base.as(
            (v, t, t2) => _AudioRecordingConfigCopyWithImpl<$R, $Out>(v, t, t2),
          );
}

abstract class AudioRecordingConfigCopyWith<
    $R,
    $In extends AudioRecordingConfig,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? encoder,
    int? sampleRate,
    int? bitRate,
    int? numChannels,
    bool? enableBackgroundRecording,
    bool? enableNoiseReduction,
    bool? enableEchoCancellation,
  });
  AudioRecordingConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AudioRecordingConfigCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AudioRecordingConfig, $Out>
    implements AudioRecordingConfigCopyWith<$R, AudioRecordingConfig, $Out> {
  _AudioRecordingConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AudioRecordingConfig> $mapper =
      AudioRecordingConfigMapper.ensureInitialized();
  @override
  $R call({
    String? encoder,
    int? sampleRate,
    int? bitRate,
    int? numChannels,
    bool? enableBackgroundRecording,
    bool? enableNoiseReduction,
    bool? enableEchoCancellation,
  }) =>
      $apply(
        FieldCopyWithData({
          if (encoder != null) #encoder: encoder,
          if (sampleRate != null) #sampleRate: sampleRate,
          if (bitRate != null) #bitRate: bitRate,
          if (numChannels != null) #numChannels: numChannels,
          if (enableBackgroundRecording != null)
            #enableBackgroundRecording: enableBackgroundRecording,
          if (enableNoiseReduction != null)
            #enableNoiseReduction: enableNoiseReduction,
          if (enableEchoCancellation != null)
            #enableEchoCancellation: enableEchoCancellation,
        }),
      );
  @override
  AudioRecordingConfig $make(CopyWithData data) => AudioRecordingConfig(
        encoder: data.get(#encoder, or: $value.encoder),
        sampleRate: data.get(#sampleRate, or: $value.sampleRate),
        bitRate: data.get(#bitRate, or: $value.bitRate),
        numChannels: data.get(#numChannels, or: $value.numChannels),
        enableBackgroundRecording: data.get(
          #enableBackgroundRecording,
          or: $value.enableBackgroundRecording,
        ),
        enableNoiseReduction: data.get(
          #enableNoiseReduction,
          or: $value.enableNoiseReduction,
        ),
        enableEchoCancellation: data.get(
          #enableEchoCancellation,
          or: $value.enableEchoCancellation,
        ),
      );

  @override
  AudioRecordingConfigCopyWith<$R2, AudioRecordingConfig, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AudioRecordingConfigCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
