import 'dart:io';

import '../models/chat_input.dart';
import '../models/message.dart';

/// Utility functions for converting between ChatInput and Message types
class ChatInputConverter {
  /// Convert a ChatInput to a Message
  static Message convertChatInputToMessage(ChatInput input) {
    switch (input.type) {
      case ChatInputType.text:
        final textInput = input as TextChatInput;
        return Message(
          text: textInput.text,
          timestamp: textInput.createdAt,
          type: MessageType.text,
        );

      case ChatInputType.audio:
        final audioInput = input as AudioChatInput;
        return Message(
          text: '',
          timestamp: audioInput.createdAt,
          type: MessageType.audio,
          fileData: audioInput.filePath.isNotEmpty
              ? File(audioInput.filePath).readAsBytesSync()
              : null,
          mimeType: 'audio/wav',
          fileName: audioInput.fileName,
          transcript: audioInput.transcript,
        );

      case ChatInputType.image:
        final imageInput = input as ImageChatInput;
        return Message(
          text: '',
          timestamp: imageInput.createdAt,
          type: MessageType.image,
          fileData: imageInput.filePath.isNotEmpty
              ? File(imageInput.filePath).readAsBytesSync()
              : null,
          mimeType: imageInput.mimeType ?? 'image/jpeg',
          fileName: imageInput.fileName,
        );

      case ChatInputType.file:
        final fileInput = input as FileChatInput;
        // Treat files as text messages with attachment info for now
        return Message(
          text: 'File: ${fileInput.fileName}',
          timestamp: fileInput.createdAt,
          type: MessageType.text,
          fileData: fileInput.filePath.isNotEmpty
              ? File(fileInput.filePath).readAsBytesSync()
              : null,
          mimeType: fileInput.mimeType,
          fileName: fileInput.fileName,
        );
    }
  }

  /// Get a description for a chat input (for preview purposes)
  static String getInputDescription(ChatInput input) {
    switch (input.type) {
      case ChatInputType.text:
        final textInput = input as TextChatInput;
        return textInput.text.length > 50
            ? '${textInput.text.substring(0, 50)}...'
            : textInput.text;

      case ChatInputType.audio:
        final audioInput = input as AudioChatInput;
        final duration = audioInput.duration;
        if (duration != null) {
          final minutes = duration.inMinutes.toString().padLeft(2, '0');
          final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
          return 'Audio recording ($minutes:$seconds)';
        }
        return 'Audio recording';

      case ChatInputType.image:
        return 'Image attachment';

      case ChatInputType.file:
        final fileInput = input as FileChatInput;
        return 'File: ${fileInput.fileName}';
    }
  }
}
