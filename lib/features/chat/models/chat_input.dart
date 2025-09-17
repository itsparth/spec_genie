import 'dart:typed_data';
import 'package:dart_mappable/dart_mappable.dart';

part 'chat_input.mapper.dart';

/// Base class for all chat input types
@MappableClass()
abstract class ChatInput with ChatInputMappable {
  final String id;
  final DateTime createdAt;
  final ChatInputType type;

  const ChatInput({
    required this.id,
    required this.createdAt,
    required this.type,
  });
}

/// Text input for chat messages
@MappableClass()
class TextChatInput extends ChatInput with TextChatInputMappable {
  final String text;

  const TextChatInput({
    required super.id,
    required super.createdAt,
    required this.text,
  }) : super(type: ChatInputType.text);
}

/// Image input for chat messages
@MappableClass()
class ImageChatInput extends ChatInput with ImageChatInputMappable {
  final String filePath;
  final String? fileName;
  final int? fileSize;
  final Uint8List? imageData;
  final String? mimeType;
  final String? caption;

  const ImageChatInput({
    required super.id,
    required super.createdAt,
    required this.filePath,
    this.fileName,
    this.fileSize,
    this.imageData,
    this.mimeType,
    this.caption,
  }) : super(type: ChatInputType.image);
}

/// Audio input for chat messages
@MappableClass()
class AudioChatInput extends ChatInput with AudioChatInputMappable {
  final String filePath;
  final String? fileName;
  final int? fileSize;
  final Uint8List? audioData;
  final String? mimeType;
  final Duration? duration;
  final String? transcript;
  final AudioInputSource source;

  const AudioChatInput({
    required super.id,
    required super.createdAt,
    required this.filePath,
    this.fileName,
    this.fileSize,
    this.audioData,
    this.mimeType,
    this.duration,
    this.transcript,
    this.source = AudioInputSource.recording,
  }) : super(type: ChatInputType.audio);
}

/// File input for chat messages (audio and image files)
@MappableClass()
class FileChatInput extends ChatInput with FileChatInputMappable {
  final String filePath;
  final String fileName;
  final int fileSize;
  final Uint8List? fileData;
  final String mimeType;
  final FileInputType fileType;

  const FileChatInput({
    required super.id,
    required super.createdAt,
    required this.filePath,
    required this.fileName,
    required this.fileSize,
    this.fileData,
    required this.mimeType,
    required this.fileType,
  }) : super(type: ChatInputType.file);
}

/// Recording configuration for audio inputs
@MappableClass()
class AudioRecordingConfig with AudioRecordingConfigMappable {
  final String encoder;
  final int sampleRate;
  final int bitRate;
  final int numChannels;
  final bool enableBackgroundRecording;
  final bool enableNoiseReduction;
  final bool enableEchoCancellation;

  const AudioRecordingConfig({
    this.encoder = 'aacLc',
    this.sampleRate = 44100,
    this.bitRate = 128000,
    this.numChannels = 1,
    this.enableBackgroundRecording = true,
    this.enableNoiseReduction = true,
    this.enableEchoCancellation = true,
  });
}

/// Enums
@MappableEnum()
enum ChatInputType {
  text,
  image,
  audio,
  file,
}

@MappableEnum()
enum AudioInputSource {
  recording,
  file,
}

@MappableEnum()
enum FileInputType {
  audio,
  image,
}

@MappableEnum()
enum ImageSource {
  camera,
  gallery,
  file,
}
