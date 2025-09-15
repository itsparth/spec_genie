import 'package:dart_mappable/dart_mappable.dart';

part 'media_attachment.mapper.dart';

@MappableClass()
class MediaAttachment with MediaAttachmentMappable {
  final String path;
  @MappableField()
  final MediaType type;
  final int size;

  const MediaAttachment({
    required this.path,
    required this.type,
    this.size = 0,
  });

  /// Create an audio attachment
  factory MediaAttachment.audio(String path, {int size = 0}) {
    return MediaAttachment(
      path: path,
      type: MediaType.audio,
      size: size,
    );
  }

  /// Create an image attachment
  factory MediaAttachment.image(String path, {int size = 0}) {
    return MediaAttachment(
      path: path,
      type: MediaType.image,
      size: size,
    );
  }

  /// Create a file attachment
  factory MediaAttachment.file(String path, {int size = 0}) {
    return MediaAttachment(
      path: path,
      type: MediaType.file,
      size: size,
    );
  }

  /// Get file extension
  String get extension {
    return path.split('.').last.toLowerCase();
  }

  /// Get file name without path
  String get fileName {
    return path.split('/').last;
  }

  /// Get human readable file size
  String get sizeString {
    if (size < 1024) return '${size}B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)}KB';
    return '${(size / (1024 * 1024)).toStringAsFixed(1)}MB';
  }
}

@MappableEnum()
enum MediaType {
  audio,
  image,
  file,
}
