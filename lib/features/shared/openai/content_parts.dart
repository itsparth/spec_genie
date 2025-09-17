import 'dart:convert';
import 'dart:typed_data';

/// Supported MIME types for images
const _supportedImageTypes = {
  'image/jpeg',
  'image/jpg',
  'image/png',
  'image/gif',
  'image/webp',
};

/// Supported MIME types for audio
const _supportedAudioTypes = {
  'audio/wav',
  'audio/mp3',
  'audio/mpeg',
  'audio/m4a',
  'audio/ogg',
};

/// Exception for unsupported MIME types
class UnsupportedMimeTypeException implements Exception {
  final String message;
  UnsupportedMimeTypeException(this.message);

  @override
  String toString() => 'UnsupportedMimeTypeException: $message';
}

/// Base class for content parts
sealed class ContentPart {}

/// Text content part
class TextPart extends ContentPart {
  final String text;
  TextPart(this.text);
}

/// Image content part with validation
class ImagePart extends ContentPart {
  final Uint8List bytes;
  final String mimeType;

  ImagePart(this.bytes, this.mimeType) {
    if (!_supportedImageTypes.contains(mimeType.toLowerCase())) {
      throw UnsupportedMimeTypeException(
        'Image MIME type "$mimeType" not supported. Use: ${_supportedImageTypes.join(", ")}',
      );
    }
  }

  String get dataUrl => 'data:$mimeType;base64,${base64Encode(bytes)}';
}

/// Audio content part with validation
class AudioPart extends ContentPart {
  final Uint8List bytes;
  final String mimeType;

  AudioPart(this.bytes, this.mimeType) {
    if (!_supportedAudioTypes.contains(mimeType.toLowerCase())) {
      throw UnsupportedMimeTypeException(
        'Audio MIME type "$mimeType" not supported. Use: ${_supportedAudioTypes.join(", ")}',
      );
    }
  }

  String get base64Data => base64Encode(bytes);
}
