import 'package:record/record.dart';
import '../models/chat_input.dart';

/// Utility functions for chat input processing
class InputUtils {
  // File extension constants
  static const List<String> audioExtensions = [
    'mp3',
    'm4a',
    'wav',
    'aac',
    'ogg',
    'flac',
  ];

  static const List<String> imageExtensions = [
    'jpg',
    'jpeg',
    'png',
    'gif',
    'bmp',
    'webp',
  ];

  /// Combined list of all supported file extensions
  static const List<String> allSupportedExtensions = [
    ...audioExtensions,
    ...imageExtensions,
  ];

  // MIME type constants
  static const String defaultMimeType = 'application/octet-stream';
  static const String audioMpegMimeType = 'audio/mpeg';
  static const String audioMp4MimeType = 'audio/mp4';
  static const String audioWavMimeType = 'audio/wav';
  static const String audioAacMimeType = 'audio/aac';
  static const String audioOggMimeType = 'audio/ogg';
  static const String audioFlacMimeType = 'audio/flac';
  static const String imageJpegMimeType = 'image/jpeg';
  static const String imagePngMimeType = 'image/png';
  static const String imageGifMimeType = 'image/gif';
  static const String imageBmpMimeType = 'image/bmp';
  static const String imageWebpMimeType = 'image/webp';

  // Audio encoder constants
  static const String aacLcEncoder = 'aacLc';
  static const String aacEldEncoder = 'aacEld';
  static const String aacHeEncoder = 'aacHe';
  static const String amrNbEncoder = 'amrNb';
  static const String amrWbEncoder = 'amrWb';
  static const String opusEncoder = 'opus';
  static const String wavEncoder = 'wav';
  static const String flacEncoder = 'flac';
  static const String pcm16bitsEncoder = 'pcm16bits';

  /// Converts string encoder name to AudioEncoder enum
  static AudioEncoder getAudioEncoder(String encoder) {
    switch (encoder.toLowerCase()) {
      case aacLcEncoder:
        return AudioEncoder.aacLc;
      case aacEldEncoder:
        return AudioEncoder.aacEld;
      case aacHeEncoder:
        return AudioEncoder.aacHe;
      case amrNbEncoder:
        return AudioEncoder.amrNb;
      case amrWbEncoder:
        return AudioEncoder.amrWb;
      case opusEncoder:
        return AudioEncoder.opus;
      case wavEncoder:
        return AudioEncoder.wav;
      case flacEncoder:
        return AudioEncoder.flac;
      case pcm16bitsEncoder:
        return AudioEncoder.pcm16bits;
      default:
        return AudioEncoder.aacLc;
    }
  }

  /// Determines file input type based on file extension
  static FileInputType getFileInputType(String? extension) {
    if (extension == null) return FileInputType.image;

    final ext = extension.toLowerCase();
    if (audioExtensions.contains(ext)) {
      return FileInputType.audio;
    } else if (imageExtensions.contains(ext)) {
      return FileInputType.image;
    }

    return FileInputType.image; // default
  }

  /// Gets MIME type for file extension
  static String getMimeType(String? extension) {
    if (extension == null) return defaultMimeType;

    switch (extension.toLowerCase()) {
      // Audio
      case 'mp3':
        return audioMpegMimeType;
      case 'm4a':
        return audioMp4MimeType;
      case 'wav':
        return audioWavMimeType;
      case 'aac':
        return audioAacMimeType;
      case 'ogg':
        return audioOggMimeType;
      case 'flac':
        return audioFlacMimeType;

      // Image
      case 'jpg':
      case 'jpeg':
        return imageJpegMimeType;
      case 'png':
        return imagePngMimeType;
      case 'gif':
        return imageGifMimeType;
      case 'bmp':
        return imageBmpMimeType;
      case 'webp':
        return imageWebpMimeType;

      default:
        return defaultMimeType;
    }
  }
}
