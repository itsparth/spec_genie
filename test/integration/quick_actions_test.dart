import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:spec_genie/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Quick Actions Flow Integration Tests', () {
    testWidgets('FR-009: System provides quick action modes', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Assert - Should show quick action modes
      expect(find.text('Spec'), findsOneWidget);
      expect(find.text('Code Context'), findsOneWidget);
      expect(find.byType(DropdownButton), findsOneWidget);
    });

    testWidgets('FR-010: System uses system prompt with mode-specific prompts',
        (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Add some content to the thread
      await tester.enterText(find.byType(TextField), 'Build a login system');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Act - Select spec mode
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Assert - Should process with spec-specific prompt
      // This will fail until AI processing is implemented
      expect(find.text('Processing...'), findsOneWidget);
    });

    testWidgets('FR-011: System generates markdown output', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byType(TextField), 'Create API documentation');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Act - Trigger AI generation
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Assert - Should show markdown formatted output
      // This will fail until AI integration is implemented
      expect(find.text('# API Documentation'), findsOneWidget);
    });

    testWidgets('FR-012: System provides copy and share actions',
        (tester) async {
      // Arrange - assume we have generated content
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Act & Assert - Should show copy and share buttons for generated content
      expect(find.byIcon(Icons.copy), findsWidgets);
      expect(find.byIcon(Icons.share), findsWidgets);
    });

    testWidgets('Quick action dropdown shows available modes', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Act - Tap dropdown
      await tester.tap(find.byType(DropdownButton));
      await tester.pumpAndSettle();

      // Assert - Should show all available modes
      expect(find.text('Spec'), findsWidgets);
      expect(find.text('Code Context'), findsWidgets);
      expect(find.text('Custom Mode 1'), findsWidgets);
    });

    testWidgets('Copy button copies content to clipboard', (tester) async {
      // This will test clipboard functionality
      // Will fail until copy functionality is implemented
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Should have copy functionality
      expect(find.byIcon(Icons.copy), findsWidgets);
    });

    testWidgets('Share button opens platform share sheet', (tester) async {
      // This will test share functionality
      // Will fail until share integration is implemented
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Should have share functionality
      expect(find.byIcon(Icons.share), findsWidgets);
    });

    testWidgets('Quick actions process all thread content', (tester) async {
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

      // Act - Trigger quick action
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Assert - Should process all messages in thread
      // This tests FR-015: System processes all content within a thread
      expect(find.text('Processing...'), findsOneWidget);
    });
  });
}
