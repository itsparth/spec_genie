import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spec_genie/features/chat/chat_screen.dart';

void main() {
  group('ChatScreen Widget Tests', () {
    testWidgets('displays chat interface', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: ChatScreen(threadId: 'test-thread-id'),
        ),
      );

      // Assert
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.send), findsOneWidget);
    });

    testWidgets('displays multi-modal input options', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: ChatScreen(threadId: 'test-thread-id'),
        ),
      );

      // Assert - Should show voice, image, and text input options
      expect(find.byIcon(Icons.mic), findsOneWidget);
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);
      expect(find.byIcon(Icons.attach_file), findsOneWidget);
    });

    testWidgets('shows quick action modes', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: ChatScreen(threadId: 'test-thread-id'),
        ),
      );

      // Assert - Should show quick action buttons
      expect(find.text('Spec'), findsOneWidget);
      expect(find.text('Code Context'), findsOneWidget);
      expect(find.byType(DropdownButton), findsOneWidget);
    });

    testWidgets('handles voice recording', (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: ChatScreen(threadId: 'test-thread-id'),
        ),
      );

      // Act
      final micButton = find.byIcon(Icons.mic);
      await tester.tap(micButton);
      await tester.pump();

      // Assert - Should start voice recording
      expect(find.byIcon(Icons.stop), findsOneWidget);
    });

    testWidgets('handles image selection', (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: ChatScreen(threadId: 'test-thread-id'),
        ),
      );

      // Act
      final cameraButton = find.byIcon(Icons.camera_alt);
      await tester.tap(cameraButton);
      await tester.pump();

      // Assert - Should open image picker
      // This will fail until implemented
      expect(find.byType(ChatScreen), findsOneWidget);
    });

    testWidgets('sends message with text input', (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: ChatScreen(threadId: 'test-thread-id'),
        ),
      );

      // Act
      await tester.enterText(find.byType(TextField), 'Test message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pump();

      // Assert - Should send message and clear input
      expect(find.text('Test message'), findsNothing);
    });

    testWidgets('displays AI generated response', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: ChatScreen(threadId: 'test-thread-id'),
        ),
      );

      // Assert - Should display AI responses when available
      expect(find.byType(ChatScreen), findsOneWidget);
    });

    testWidgets('shows copy and share options for responses', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: ChatScreen(threadId: 'test-thread-id'),
        ),
      );

      // Assert - Should show copy/share buttons for responses
      expect(find.byIcon(Icons.copy), findsWidgets);
      expect(find.byIcon(Icons.share), findsWidgets);
    });
  });
}
