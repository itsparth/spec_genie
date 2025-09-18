import 'dart:io';

import 'package:test/test.dart';
import 'package:spec_genie/features/shared/openai/openai.dart';

import 'test_config.dart';

void main() {
  group('OpenAI Utility Simple Tests', () {
    late OpenAIUtil openAI;

    setUpAll(() {
      // Configuration for Google Gemini API via OpenAI-compatible endpoint
      final config = OpenAIConfig(
        apiKey: TestConfig.get('OPENAI_API_KEY'),
        baseUrl: TestConfig.get('OPENAI_BASE_URL'),
        model: TestConfig.get('OPENAI_MODEL'),
      );

      openAI = OpenAIUtil(config);
    });

    tearDownAll(() {
      openAI.dispose();
    });

    test('should respond with exactly "123" when prompted', () async {
      // Arrange
      const systemPrompt =
          'You are a helpful assistant that follows instructions precisely.';
      final parts = [
        TextPart('Respond 123, do not output anything else'),
      ];

      // Act
      final response = await openAI.generate(systemPrompt, parts);

      // Assert
      print('Response received: "$response"');
      expect(response.trim(), equals('123'),
          reason: 'Model should respond with exactly "123" as requested');
    });

    test('should respond with "Delhi" when asked about capital of India',
        () async {
      // Arrange
      const systemPrompt =
          'You are a helpful assistant that responds with only one word.';
      final parts = [
        TextPart('What is the capital of India? Only one word.'),
      ];

      // Act
      final response = await openAI.generate(systemPrompt, parts);

      // Assert
      print('Response received: "$response"');
      expect(response.trim(), equals('Delhi'),
          reason:
              'Model should respond with exactly "Delhi" when asked about capital of India');
    });

    test('should transcribe WAV audio file correctly', () async {
      // Arrange
      final audioFile = File('test/features/shared/assets/tts_output.wav');
      expect(audioFile.existsSync(), isTrue,
          reason: 'WAV audio file should exist');

      final audioBytes = await audioFile.readAsBytes();
      final audioPart = AudioPart(audioBytes, 'audio/wav');

      // Act
      final transcription = await openAI.transcribeAudio(audioPart);

      // Assert
      print('WAV Transcription received: "$transcription"');
      final normalizedTranscription = transcription
          .toLowerCase()
          .replaceAll(RegExp(r'[^\w\s]'), '') // Remove punctuation
          .trim();
      final expectedText = 'hello this is a test audio file to test the api';

      expect(normalizedTranscription, equals(expectedText),
          reason: 'WAV audio should be transcribed as expected text');
    });

    test('should transcribe MP3 audio file correctly', () async {
      // Arrange
      final audioFile = File('test/features/shared/assets/tts_output.mp3');
      expect(audioFile.existsSync(), isTrue,
          reason: 'MP3 audio file should exist');

      final audioBytes = await audioFile.readAsBytes();
      final audioPart = AudioPart(audioBytes, 'audio/mp3');

      // Act
      final transcription = await openAI.transcribeAudio(audioPart);

      // Assert
      print('MP3 Transcription received: "$transcription"');
      final normalizedTranscription = transcription
          .toLowerCase()
          .replaceAll(RegExp(r'[^\w\s]'), '') // Remove punctuation
          .trim();
      final expectedText = 'hello this is a test audio file to test the api';

      expect(normalizedTranscription, equals(expectedText),
          reason: 'MP3 audio should be transcribed as expected text');
    });

    test('should recognize text on rock image correctly', () async {
      // Arrange
      final imageFile = File('test/features/shared/assets/rock_image_0.jpg');
      expect(imageFile.existsSync(), isTrue,
          reason: 'Rock image file should exist');

      final imageBytes = await imageFile.readAsBytes();
      final imagePart = ImagePart(imageBytes, 'image/jpeg');

      const systemPrompt =
          'You are a helpful assistant that can read text in images. '
          'Extract and return only the text you see in the image, without any additional formatting or comments.';

      final parts = [
        TextPart('What text do you see on the rock in this image?'),
        imagePart,
      ];

      // Act
      final response = await openAI.generate(systemPrompt, parts);

      // Assert
      print('Image text recognition response: "$response"');
      final normalizedResponse = response
          .toLowerCase()
          .replaceAll(RegExp(r'[^\w\s]'), '') // Remove punctuation
          .replaceAll(RegExp(r'\s+'), ' ') // Normalize whitespace
          .trim();
      final expectedText = 'this is a test image';

      expect(normalizedResponse, equals(expectedText),
          reason: 'Model should recognize the text on the rock image');
    });

    test('should stream response incrementally', () async {
      // Arrange
      const systemPrompt =
          'You are a helpful assistant that responds with complete sentences.';
      final parts = [
        TextPart('Write a short story about a cat in exactly 3 sentences.'),
      ];

      // Act & Assert
      print('Starting streaming test...');
      final streamResults = <String>[];

      await for (final chunk in openAI.generateStream(systemPrompt, parts)) {
        streamResults.add(chunk);
        print('Stream chunk ${streamResults.length}: "$chunk"');
      }

      // Validate streaming behavior
      expect(streamResults.length, greaterThan(1),
          reason: 'Should receive multiple stream chunks');

      // Each chunk should be longer than the previous (or equal in case of final chunk)
      for (int i = 1; i < streamResults.length; i++) {
        expect(streamResults[i].length,
            greaterThanOrEqualTo(streamResults[i - 1].length),
            reason: 'Each stream chunk should contain cumulative content');
      }

      // Final result should be a complete response
      final finalResult = streamResults.last;
      expect(finalResult.trim().isNotEmpty, isTrue,
          reason: 'Final streamed result should not be empty');

      print('Final streamed result: "$finalResult"');
      print('Total stream chunks received: ${streamResults.length}');

      // Validate that it looks like a story about a cat
      final normalizedFinal = finalResult.toLowerCase();
      expect(normalizedFinal.contains('cat'), isTrue,
          reason: 'Story should mention a cat');
    });
  });
}
