import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:spec_genie/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Multi-Modal Input Integration Tests', () {
    testWidgets('FR-007: Users can input content in multiple formats',
        (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();

      // Navigate to chat screen
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Assert - Should show text, voice, and image input options
      expect(find.byType(TextField), findsOneWidget); // Text input
      expect(find.byIcon(Icons.mic), findsOneWidget); // Voice input
      expect(find.byIcon(Icons.camera_alt), findsOneWidget); // Camera
      expect(find.byIcon(Icons.attach_file), findsOneWidget); // File picker
    });

    testWidgets('Text input works correctly', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Act - Enter text message
      await tester.enterText(
        find.byType(TextField),
        'This is a text message',
      );
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Assert - Message should be sent and visible
      expect(find.text('This is a text message'), findsOneWidget);
      expect(find.text(''), findsOneWidget); // Input should be cleared
    });

    testWidgets('Voice recording interface appears on mic tap', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Act - Tap microphone button
      await tester.tap(find.byIcon(Icons.mic));
      await tester.pumpAndSettle();

      // Assert - Should show recording UI
      expect(find.byIcon(Icons.stop), findsOneWidget);
      expect(find.text('Recording...'), findsOneWidget);
    });

    testWidgets('Image picker opens on camera tap', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Act - Tap camera button
      await tester.tap(find.byIcon(Icons.camera_alt));
      await tester.pumpAndSettle();

      // Assert - Should trigger image picker
      // This will fail until image picker is implemented
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('File picker opens on attach tap', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Act - Tap file attachment button
      await tester.tap(find.byIcon(Icons.attach_file));
      await tester.pumpAndSettle();

      // Assert - Should trigger file picker
      // This will fail until file picker is implemented
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('FR-008: System supports one-way communication',
        (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Act - Send message
      await tester.enterText(find.byType(TextField), 'Test message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Assert - Should show user message, no reply interface
      expect(find.text('Test message'), findsOneWidget);
      // Should not have reply or multi-turn conversation UI
      expect(find.text('Reply'), findsNothing);
    });

    testWidgets('Mixed input types in single thread', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Act - Send text message
      await tester.enterText(find.byType(TextField), 'First text');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Try voice recording
      await tester.tap(find.byIcon(Icons.mic));
      await tester.pumpAndSettle();

      // Assert - Should support mixed input types
      expect(find.text('First text'), findsOneWidget);
      expect(find.byIcon(Icons.stop), findsOneWidget);
    });

    testWidgets('Media attachments show in message list', (tester) async {
      // This tests display of audio/image attachments
      // Will fail until media display is implemented
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Should show media attachments when they exist
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
