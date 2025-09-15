import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:spec_genie/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Message Deletion Integration Tests', () {
    testWidgets('FR-019: Users can delete specific messages from threads',
        (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Add multiple messages
      await tester.enterText(find.byType(TextField), 'First message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Second message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Third message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Act - Long press on second message to show context menu
      await tester.longPress(find.text('Second message'));
      await tester.pumpAndSettle();

      // Tap delete option
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Assert - Second message should be gone
      expect(find.text('First message'), findsOneWidget);
      expect(find.text('Second message'), findsNothing);
      expect(find.text('Third message'), findsOneWidget);
    });

    testWidgets('Message deletion confirmation dialog', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Message to delete');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Act - Trigger deletion
      await tester.longPress(find.text('Message to delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Assert - Should show confirmation dialog
      expect(find.text('Delete Message?'), findsOneWidget);
      expect(find.text('This action cannot be undone.'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('Message deletion can be cancelled', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Keep this message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Act - Start deletion but cancel
      await tester.longPress(find.text('Keep this message'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Assert - Message should still be there
      expect(find.text('Keep this message'), findsOneWidget);
    });

    testWidgets('Can delete audio messages', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Add text message
      await tester.enterText(find.byType(TextField), 'Text message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Add audio message
      await tester.tap(find.byIcon(Icons.mic));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.stop));
      await tester.pumpAndSettle();

      // Act - Delete audio message
      await tester.longPress(find.byIcon(Icons.play_arrow));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Assert - Audio message should be gone, text message remains
      expect(find.text('Text message'), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow), findsNothing);
    });

    testWidgets('Can delete image messages', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Add image message (simulated)
      await tester.tap(find.byIcon(Icons.image));
      await tester.pumpAndSettle();
      // Simulate image selection
      await tester.tap(find.text('Gallery'));
      await tester.pumpAndSettle();

      // Act - Delete image message
      await tester.longPress(find.byType(Image));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Assert - Image should be gone
      expect(find.byType(Image), findsNothing);
    });

    testWidgets('Can delete file attachment messages', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Add file message (simulated)
      await tester.tap(find.byIcon(Icons.attach_file));
      await tester.pumpAndSettle();

      // Act - Delete file message
      await tester.longPress(find.byIcon(Icons.description));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Assert - File attachment should be gone
      expect(find.byIcon(Icons.description), findsNothing);
    });

    testWidgets('Message deletion updates thread persistence', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Persistent message 1');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Delete this one');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Delete middle message
      await tester.longPress(find.text('Delete this one'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Simulate app restart
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/platform',
        null,
        (data) {},
      );

      // Act - restart app and check thread
      app.main();
      await tester.pumpAndSettle();

      // Navigate to the thread
      await tester.tap(find.text('Persistent message 1'));
      await tester.pumpAndSettle();

      // Assert - Deleted message should not be there
      expect(find.text('Persistent message 1'), findsOneWidget);
      expect(find.text('Delete this one'), findsNothing);
    });

    testWidgets('Deleting first message in thread', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'First message to delete');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Second message stays');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Act - Delete first message
      await tester.longPress(find.text('First message to delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Assert - Thread should still exist with second message
      expect(find.text('First message to delete'), findsNothing);
      expect(find.text('Second message stays'), findsOneWidget);
    });

    testWidgets('Deleting last message in thread', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'First message stays');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Last message to delete');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Act - Delete last message
      await tester.longPress(find.text('Last message to delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Assert - Thread should still exist with first message
      expect(find.text('First message stays'), findsOneWidget);
      expect(find.text('Last message to delete'), findsNothing);
    });

    testWidgets('Deleting all messages removes thread', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Only message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Act - Delete the only message
      await tester.longPress(find.text('Only message'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Assert - Should navigate back to thread list and thread should be gone
      expect(find.text('Only message'), findsNothing);
      expect(find.text('New Thread'), findsOneWidget); // Back to empty state
    });

    testWidgets('Message deletion invalidates quick action cache',
        (tester) async {
      // This tests integration with caching functionality
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'First context message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Message to delete');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Generate cached output
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Act - Delete message
      await tester.longPress(find.text('Message to delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Run quick action again
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Assert - Should recalculate (not use cache)
      expect(find.text('Processing...'), findsOneWidget);
    });

    testWidgets('Bulk message deletion', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Add multiple messages
      for (int i = 1; i <= 5; i++) {
        await tester.enterText(find.byType(TextField), 'Message $i');
        await tester.tap(find.byIcon(Icons.send));
        await tester.pumpAndSettle();
      }

      // Act - Enter selection mode
      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Select Messages'));
      await tester.pumpAndSettle();

      // Select multiple messages
      await tester.tap(find.text('Message 2'));
      await tester.tap(find.text('Message 4'));
      await tester.pumpAndSettle();

      // Delete selected
      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Assert - Selected messages should be gone
      expect(find.text('Message 1'), findsOneWidget);
      expect(find.text('Message 2'), findsNothing);
      expect(find.text('Message 3'), findsOneWidget);
      expect(find.text('Message 4'), findsNothing);
      expect(find.text('Message 5'), findsOneWidget);
    });
  });
}
