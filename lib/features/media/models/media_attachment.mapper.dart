// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'media_attachment.dart';

class MediaTypeMapper extends EnumMapper<MediaType> {
  MediaTypeMapper._();

  static MediaTypeMapper? _instance;
  static MediaTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MediaTypeMapper._());
    }
    return _instance!;
  }

  static MediaType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MediaType decode(dynamic value) {
    switch (value) {
      case r'audio':
        return MediaType.audio;
      case r'image':
        return MediaType.image;
      case r'file':
        return MediaType.file;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MediaType self) {
    switch (self) {
      case MediaType.audio:
        return r'audio';
      case MediaType.image:
        return r'image';
      case MediaType.file:
        return r'file';
    }
  }
}

extension MediaTypeMapperExtension on MediaType {
  String toValue() {
    MediaTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MediaType>(this) as String;
  }
}

class MediaAttachmentMapper extends ClassMapperBase<MediaAttachment> {
  MediaAttachmentMapper._();

  static MediaAttachmentMapper? _instance;
  static MediaAttachmentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MediaAttachmentMapper._());
      MediaTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MediaAttachment';

  static String _$path(MediaAttachment v) => v.path;
  static const Field<MediaAttachment, String> _f$path = Field('path', _$path);
  static MediaType _$type(MediaAttachment v) => v.type;
  static const Field<MediaAttachment, MediaType> _f$type = Field(
    'type',
    _$type,
  );
  static int _$size(MediaAttachment v) => v.size;
  static const Field<MediaAttachment, int> _f$size = Field(
    'size',
    _$size,
    opt: true,
    def: 0,
  );
  static String _$extension(MediaAttachment v) => v.extension;
  static const Field<MediaAttachment, String> _f$extension = Field(
    'extension',
    _$extension,
    mode: FieldMode.member,
  );
  static String _$fileName(MediaAttachment v) => v.fileName;
  static const Field<MediaAttachment, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    mode: FieldMode.member,
  );
  static String _$sizeString(MediaAttachment v) => v.sizeString;
  static const Field<MediaAttachment, String> _f$sizeString = Field(
    'sizeString',
    _$sizeString,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<MediaAttachment> fields = const {
    #path: _f$path,
    #type: _f$type,
    #size: _f$size,
    #extension: _f$extension,
    #fileName: _f$fileName,
    #sizeString: _f$sizeString,
  };

  static MediaAttachment _instantiate(DecodingData data) {
    return MediaAttachment(
      path: data.dec(_f$path),
      type: data.dec(_f$type),
      size: data.dec(_f$size),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MediaAttachment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MediaAttachment>(map);
  }

  static MediaAttachment fromJson(String json) {
    return ensureInitialized().decodeJson<MediaAttachment>(json);
  }
}

mixin MediaAttachmentMappable {
  String toJson() {
    return MediaAttachmentMapper.ensureInitialized()
        .encodeJson<MediaAttachment>(this as MediaAttachment);
  }

  Map<String, dynamic> toMap() {
    return MediaAttachmentMapper.ensureInitialized().encodeMap<MediaAttachment>(
      this as MediaAttachment,
    );
  }

  MediaAttachmentCopyWith<MediaAttachment, MediaAttachment, MediaAttachment>
  get copyWith =>
      _MediaAttachmentCopyWithImpl<MediaAttachment, MediaAttachment>(
        this as MediaAttachment,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MediaAttachmentMapper.ensureInitialized().stringifyValue(
      this as MediaAttachment,
    );
  }

  @override
  bool operator ==(Object other) {
    return MediaAttachmentMapper.ensureInitialized().equalsValue(
      this as MediaAttachment,
      other,
    );
  }

  @override
  int get hashCode {
    return MediaAttachmentMapper.ensureInitialized().hashValue(
      this as MediaAttachment,
    );
  }
}

extension MediaAttachmentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MediaAttachment, $Out> {
  MediaAttachmentCopyWith<$R, MediaAttachment, $Out> get $asMediaAttachment =>
      $base.as((v, t, t2) => _MediaAttachmentCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MediaAttachmentCopyWith<$R, $In extends MediaAttachment, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? path, MediaType? type, int? size});
  MediaAttachmentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MediaAttachmentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MediaAttachment, $Out>
    implements MediaAttachmentCopyWith<$R, MediaAttachment, $Out> {
  _MediaAttachmentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MediaAttachment> $mapper =
      MediaAttachmentMapper.ensureInitialized();
  @override
  $R call({String? path, MediaType? type, int? size}) => $apply(
    FieldCopyWithData({
      if (path != null) #path: path,
      if (type != null) #type: type,
      if (size != null) #size: size,
    }),
  );
  @override
  MediaAttachment $make(CopyWithData data) => MediaAttachment(
    path: data.get(#path, or: $value.path),
    type: data.get(#type, or: $value.type),
    size: data.get(#size, or: $value.size),
  );

  @override
  MediaAttachmentCopyWith<$R2, MediaAttachment, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MediaAttachmentCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

