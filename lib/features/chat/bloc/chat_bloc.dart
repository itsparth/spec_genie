import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:openai_dart/openai_dart.dart';
import '../models/message.dart';
import '../../configuration/bloc/configuration_bloc.dart';

part 'chat_bloc.g.dart';

@riverpod
class ChatBloc extends _$ChatBloc {
  @override
  List<Message> build(int threadId) {
    // Return empty list for now
    // TODO: Load messages from Isar database when integrated
    return [];
  }

  /// Add a new message to the chat
  void addMessage(Message message) {
    state = [...state, message];
  }

  /// Send a text message and get AI response
  Future<void> sendTextMessage(String content) async {
    // Add user message
    final userMessage = Message.text(content);
    addMessage(userMessage);

    try {
      // Get AI response
      final aiResponse = await _getAIResponse(content);
      final aiMessage = Message.text(aiResponse);
      addMessage(aiMessage);
    } catch (e) {
      // Add error message
      final errorMessage = Message.text('Error: Failed to get AI response');
      addMessage(errorMessage);
    }
  }

  /// Send an audio message and get AI response
  Future<void> sendAudioMessage(String filePath) async {
    // Add user audio message
    final userMessage = Message.audio(filePath);
    addMessage(userMessage);

    try {
      final config = ref.read(configurationBlocProvider);

      if (config.transcribeAudioFirst) {
        // First transcribe audio to text
        final transcription = await _transcribeAudio(filePath);

        // Then process with AI
        final aiResponse = await _getAIResponse(transcription);
        final aiMessage = Message.text(aiResponse);
        addMessage(aiMessage);
      } else {
        // Send audio directly to AI (multi-modal)
        final aiResponse = await _getAudioAIResponse(filePath);
        final aiMessage = Message.text(aiResponse);
        addMessage(aiMessage);
      }
    } catch (e) {
      final errorMessage =
          Message.text('Error: Failed to process audio message');
      addMessage(errorMessage);
    }
  }

  /// Send an image message and get AI response
  Future<void> sendImageMessage(String filePath) async {
    // Add user image message
    final userMessage = Message.image(filePath);
    addMessage(userMessage);

    try {
      // Process image with AI
      final aiResponse = await _getImageAIResponse(filePath);
      final aiMessage = Message.text(aiResponse);
      addMessage(aiMessage);
    } catch (e) {
      final errorMessage = Message.text('Error: Failed to process image');
      addMessage(errorMessage);
    }
  }

  /// Delete a message
  void deleteMessage(int messageId) {
    state = state.where((message) => message.id != messageId).toList();
  }

  /// Clear all messages
  void clearMessages() {
    state = [];
  }

  // Private methods for AI integration

  Future<String> _getAIResponse(String content) async {
    final config = ref.read(configurationBlocProvider);

    if (!config.hasValidApiKey) {
      throw Exception('No valid API key configured');
    }

    final client = OpenAIClient(
      apiKey: config.apiKey,
      baseUrl: config.effectiveBaseUrl,
    );

    final request = CreateChatCompletionRequest(
      model: ChatCompletionModel.modelId(config.modelName),
      messages: [
        ChatCompletionMessage.user(
          content: ChatCompletionUserMessageContent.string(content),
        ),
      ],
      maxTokens: 1000,
    );

    final response = await client.createChatCompletion(request: request);
    return response.choices.first.message.content ?? 'No response';
  }

  Future<String> _transcribeAudio(String filePath) async {
    final config = ref.read(configurationBlocProvider);

    final client = OpenAIClient(
      apiKey: config.apiKey,
      baseUrl: config.effectiveBaseUrl,
    );

    // For now, return a placeholder
    // TODO: Implement actual audio transcription
    return 'Transcribed audio content from $filePath';
  }

  Future<String> _getAudioAIResponse(String filePath) async {
    // For now, return a placeholder
    // TODO: Implement direct audio processing with multi-modal models
    return 'Audio response from $filePath';
  }

  Future<String> _getImageAIResponse(String filePath) async {
    // For now, return a placeholder
    // TODO: Implement image processing with vision models
    return 'Image analysis response from $filePath';
  }
}
