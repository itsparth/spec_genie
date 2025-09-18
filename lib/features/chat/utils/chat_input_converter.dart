import 'dart:io';

import '../models/chat_input.dart';

/// Utility for converting ChatInput into parameters for ChatBloc.addMessage (Drift)
class ChatInputConverter {
  static ({
    String body,
    String messageType,
    DateTime timestamp,
    List<int>? fileData,
    String? mimeType,
    String? transcript,
    String? fileName,
    String description,
  }) toAddParams(ChatInput input) {
    switch (input.type) {
      case ChatInputType.text:
        final t = input as TextChatInput;
        return (
          body: t.text,
          messageType: 'text',
          timestamp: t.createdAt,
          fileData: null,
          mimeType: null,
          transcript: null,
          fileName: null,
          description: '',
        );
      case ChatInputType.audio:
        final a = input as AudioChatInput;
        return (
          body: '',
          messageType: 'audio',
          timestamp: a.createdAt,
          fileData: a.filePath.isNotEmpty
              ? File(a.filePath).readAsBytesSync()
              : null,
          mimeType: 'audio/wav',
          transcript: a.transcript,
          fileName: a.fileName,
          description: '',
        );
      case ChatInputType.image:
        final i = input as ImageChatInput;
        return (
          body: '',
          messageType: 'image',
          timestamp: i.createdAt,
            fileData: i.filePath.isNotEmpty
              ? File(i.filePath).readAsBytesSync()
              : null,
          mimeType: i.mimeType ?? 'image/jpeg',
          transcript: null,
          fileName: i.fileName,
          description: '',
        );
      case ChatInputType.file:
        final f = input as FileChatInput;
        return (
          body: 'File: ${f.fileName}',
          messageType: 'text',
          timestamp: f.createdAt,
          fileData: f.filePath.isNotEmpty
              ? File(f.filePath).readAsBytesSync()
              : null,
          mimeType: f.mimeType,
          transcript: null,
          fileName: f.fileName,
          description: '',
        );
    }
  }

  static String getInputDescription(ChatInput input) {
    switch (input.type) {
      case ChatInputType.text:
        final t = input as TextChatInput;
        return t.text.length > 50 ? '${t.text.substring(0, 50)}...' : t.text;
      case ChatInputType.audio:
        final a = input as AudioChatInput;
        final d = a.duration;
        if (d != null) {
          final m = d.inMinutes.toString().padLeft(2, '0');
          final s = (d.inSeconds % 60).toString().padLeft(2, '0');
          return 'Audio recording ($m:$s)';
        }
        return 'Audio recording';
      case ChatInputType.image:
        return 'Image attachment';
      case ChatInputType.file:
        final f = input as FileChatInput;
        return 'File: ${f.fileName}';
    }
  }
}
