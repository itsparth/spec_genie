import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:spec_genie/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Quick Actions Output Caching Integration Tests', () {
    testWidgets(
        'FR-018: Quick actions outputs are cached and only recalculated when needed',
        (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Add initial content
      await tester.enterText(
          find.byType(TextField), 'Create a user login system');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Act - Run quick action for first time
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Assert - Should generate new output
      expect(find.text('Processing...'), findsOneWidget);

      // Wait for processing to complete
      await tester.pumpAndSettle();

      // Run the same quick action again without changes
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Assert - Should use cached output (no processing)
      expect(find.text('Processing...'), findsNothing);
      expect(find.text('Using cached output...'), findsOneWidget);
    });

    testWidgets('Cache invalidation when new message is added', (tester) async {
      // Arrange - setup cached output
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Initial message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Act - Add new message
      await tester.enterText(
          find.byType(TextField), 'Additional requirement: two-factor auth');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Run quick action again
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Assert - Should recalculate (not use cache)
      expect(find.text('Processing...'), findsOneWidget);
    });

    testWidgets('Cache invalidation when audio is added', (tester) async {
      // Arrange - setup cached output
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Voice note test');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Act - Add audio message
      await tester.tap(find.byIcon(Icons.mic));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.stop));
      await tester.pumpAndSettle();

      // Run quick action again
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Assert - Should recalculate (not use cache)
      expect(find.text('Processing...'), findsOneWidget);
    });

    testWidgets('Manual recalculation button forces cache refresh',
        (tester) async {
      // Arrange - setup cached output
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Test message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Act - Press recalculate button (even without new content)
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      // Assert - Should recalculate despite having cached result
      expect(find.text('Processing...'), findsOneWidget);
    });

    testWidgets('Cache invalidation when mode prompt is changed',
        (tester) async {
      // Arrange - setup cached output with custom mode
      app.main();
      await tester.pumpAndSettle();

      // Create custom mode
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Custom Mode'));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('mode_name_field')), 'Test Mode');
      await tester.enterText(
          find.byKey(const Key('system_prompt_field')), 'Original prompt');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Navigate back and use custom mode
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Test message');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButton));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Test Mode'));
      await tester.pumpAndSettle();

      // Act - Modify the mode prompt
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(const Key('system_prompt_field')), 'Updated prompt');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Navigate back and run quick action again
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Test Mode'));
      await tester.pumpAndSettle();

      // Assert - Should recalculate with updated prompt
      expect(find.text('Processing...'), findsOneWidget);
    });

    testWidgets('Cache persists across app sessions', (tester) async {
      // Arrange - generate cached output
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Persistent cache test');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(); // Wait for processing

      // Simulate app restart
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/platform',
        null,
        (data) {},
      );

      // Act - restart app and access same thread
      app.main();
      await tester.pumpAndSettle();

      // Navigate to the same thread (this would be through thread list)
      await tester.tap(find.text('Persistent cache test'));
      await tester.pumpAndSettle();

      // Run quick action
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Assert - Should use cached output from previous session
      expect(find.text('Using cached output...'), findsOneWidget);
    });

    testWidgets('Different modes have separate caches', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Multi-mode cache test');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Generate output for Spec mode
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Act - Switch to Code Context mode
      await tester.tap(find.byType(DropdownButton));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Code Context'));
      await tester.pumpAndSettle();

      // Assert - Should process for new mode (separate cache)
      expect(find.text('Processing...'), findsOneWidget);

      // Switch back to Spec mode
      await tester.tap(find.byType(DropdownButton));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Spec'));
      await tester.pumpAndSettle();

      // Assert - Should use cached Spec output
      expect(find.text('Using cached output...'), findsOneWidget);
    });

    testWidgets('Cache size limits and cleanup', (tester) async {
      // This tests that cache doesn't grow indefinitely
      // Will fail until cache management is implemented
      app.main();
      await tester.pumpAndSettle();

      // Should have cache management functionality
      expect(find.text('Cache Status: '), findsOneWidget);
    });
  });
}
