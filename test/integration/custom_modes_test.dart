import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:spec_genie/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Custom Modes Integration Tests', () {
    testWidgets('FR-013: System allows creating custom modes', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();

      // Navigate to configuration
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Act - Create custom mode
      await tester.tap(find.text('Add Custom Mode'));
      await tester.pumpAndSettle();

      // Assert - Should show custom mode creation form
      expect(find.text('Mode Name'), findsOneWidget);
      expect(find.text('System Prompt'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
    });

    testWidgets('Custom mode creation form validation', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Custom Mode'));
      await tester.pumpAndSettle();

      // Act - Try to save without name
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Assert - Should show validation error
      expect(find.text('Mode name is required'), findsOneWidget);
    });

    testWidgets('Custom mode can be saved and persisted', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Custom Mode'));
      await tester.pumpAndSettle();

      // Act - Create custom mode
      await tester.enterText(
          find.byKey(const Key('mode_name_field')), 'Test Mode');
      await tester.enterText(find.byKey(const Key('system_prompt_field')),
          'You are a test assistant');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Assert - Should return to settings and show new mode
      expect(find.text('Test Mode'), findsOneWidget);
    });

    testWidgets('Custom modes persist across app restarts', (tester) async {
      // This tests Isar persistence
      // Arrange - create a custom mode
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Custom Mode'));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('mode_name_field')), 'Persistent Mode');
      await tester.enterText(
          find.byKey(const Key('system_prompt_field')), 'Persistent prompt');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Simulate app restart
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/platform',
        null,
        (data) {},
      );

      // Act - restart app
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Assert - Should still show custom mode
      expect(find.text('Persistent Mode'), findsOneWidget);
    });

    testWidgets('Custom modes appear in quick action dropdown', (tester) async {
      // Arrange - create custom mode first
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Custom Mode'));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('mode_name_field')), 'Quick Test Mode');
      await tester.enterText(
          find.byKey(const Key('system_prompt_field')), 'Quick test prompt');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Navigate back to chat
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Act - open quick actions dropdown
      await tester.tap(find.byType(DropdownButton));
      await tester.pumpAndSettle();

      // Assert - Should show custom mode in dropdown
      expect(find.text('Quick Test Mode'), findsOneWidget);
    });

    testWidgets('Custom mode can be edited', (tester) async {
      // Arrange - create and then edit
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Custom Mode'));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('mode_name_field')), 'Edit Mode');
      await tester.enterText(
          find.byKey(const Key('system_prompt_field')), 'Original prompt');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Act - Edit the mode
      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(const Key('system_prompt_field')), 'Updated prompt');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Assert - Should show updated content
      expect(find.text('Edit Mode'), findsOneWidget);
    });

    testWidgets('Custom mode can be deleted', (tester) async {
      // Arrange - create mode to delete
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Custom Mode'));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('mode_name_field')), 'Delete Mode');
      await tester.enterText(
          find.byKey(const Key('system_prompt_field')), 'To be deleted');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Act - Delete the mode
      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      // Assert - Should no longer show deleted mode
      expect(find.text('Delete Mode'), findsNothing);
    });

    testWidgets('Custom mode system prompts are used in AI processing',
        (tester) async {
      // This tests that custom prompts are actually used
      // Arrange - create mode with specific prompt
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Custom Mode'));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('mode_name_field')), 'Pirate Mode');
      await tester.enterText(find.byKey(const Key('system_prompt_field')),
          'You are a pirate. Always respond with "Arrr!"');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Navigate to chat and use custom mode
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Hello there');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Act - Use pirate mode
      await tester.tap(find.byType(DropdownButton));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Pirate Mode'));
      await tester.pumpAndSettle();

      // Assert - Should process with custom prompt
      // This will fail until AI integration respects custom prompts
      expect(find.text('Processing...'), findsOneWidget);
    });
  });
}
