import 'dart:async';

import 'package:openai_dart/openai_dart.dart';

import 'config.dart';
import 'content_parts.dart';

/// Minimal OpenAI chat utility
class OpenAIUtil {
  final OpenAIClient _client;
  final String _model;
  OpenAIConfig? config;

  OpenAIUtil._(this._client, this._model, {this.config});

  /// Create utility from configuration
  factory OpenAIUtil(OpenAIConfig config) {
    final client = OpenAIClient(
      apiKey: config.apiKey,
      baseUrl: config.baseUrl,
      organization: config.organization,
      queryParams: (config.baseUrl != null && config.baseUrl!.contains('azure'))
          ? {'api-version': '2025-01-01-preview'}
          : null,
    );
    return OpenAIUtil._(client, config.model, config: config);
  }

  /// Convert content part to OpenAI format
  ChatCompletionMessageContentPart _convertPart(ContentPart part) {
    return switch (part) {
      TextPart(:final text) =>
        ChatCompletionMessageContentPart.text(text: text),
      ImagePart(:final dataUrl) => ChatCompletionMessageContentPart.image(
          imageUrl: ChatCompletionMessageImageUrl(url: dataUrl),
        ),
      AudioPart(mimeType: final mime, base64Data: final data) =>
        ChatCompletionMessageContentPart.audio(
          inputAudio: ChatCompletionMessageInputAudio(
            data: data,
            format: mime.contains('wav')
                ? ChatCompletionMessageInputAudioFormat.wav
                : ChatCompletionMessageInputAudioFormat.mp3,
          ),
        ),
    };
  }

  /// Transcribe audio to text
  Future<String> transcribeAudio(AudioPart audioPart) async {
    final request = CreateChatCompletionRequest(
      model: ChatCompletionModel.modelId(_model),
      messages: [
        const ChatCompletionMessage.system(
          content:
              'Transcribe the following audio to text. Return only the transcribed text without any additional formatting or comments.',
        ),
        ChatCompletionMessage.user(
          content: ChatCompletionUserMessageContent.parts([
            _convertPart(audioPart),
          ]),
        ),
      ],
    );

    final response = await _client.createChatCompletion(request: request);
    return response.choices.first.message.content ?? '';
  }

  /// Generate a concise 5-6 word description of content
  Future<String> generateDescription(List<ContentPart> parts) async {
    return generate(
        "Create a concise 5-6 word description of the content provided. Return only the description without any additional formatting, quotes, or comments.",
        parts);
  }

  /// Generate a concise 3-4 word title summarizing the content
  Future<String> generateTitle(List<ContentPart> parts) async {
    return generate(
      "Provide a short 3-4 word title capturing the core idea of the provided content. Return ONLY the title, no punctuation (except needed inside a word), no quotes.",
      parts,
    );
  }

  /// Generate complete response
  Future<String> generate(String systemPrompt, List<ContentPart> parts) async {
    final request = CreateChatCompletionRequest(
      model: ChatCompletionModel.modelId(_model),
      messages: [
        ChatCompletionMessage.system(content: systemPrompt),
        ChatCompletionMessage.user(
          content: ChatCompletionUserMessageContent.parts(
            parts.map(_convertPart).toList(),
          ),
        ),
      ],
    );

    final response = await _client.createChatCompletion(request: request);
    return response.choices.first.message.content ?? '';
  }

  /// Generate streaming response (full text snapshots)
  Stream<String> generateStream(
      String systemPrompt, List<ContentPart> parts) async* {
    final request = CreateChatCompletionRequest(
      model: ChatCompletionModel.modelId(_model),
      messages: [
        ChatCompletionMessage.system(content: systemPrompt),
        ChatCompletionMessage.user(
          content: ChatCompletionUserMessageContent.parts(
            parts.map(_convertPart).toList(),
          ),
        ),
      ],
    );

    final stream = _client.createChatCompletionStream(request: request);
    String accumulated = '';

    await for (final chunk in stream) {
      final choices = chunk.choices;
      if (choices == null || choices.isEmpty) continue;

      final content = choices.first.delta?.content;
      if (content != null) {
        accumulated += content;
        yield accumulated; // Full text so far
      }

      if (choices.first.finishReason != null) break;
    }
  }

  /// Close the client
  void dispose() => _client.client.close();
}
