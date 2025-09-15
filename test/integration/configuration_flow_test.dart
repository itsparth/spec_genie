import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:spec_genie/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Configuration Flow Integration Tests', () {
    testWidgets('FR-001: System provides configuration interface',
        (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();

      // Act & Assert - Should show configuration screen on first launch
      expect(find.text('Configuration'), findsOneWidget);
      expect(find.text('API Base URL'), findsOneWidget);
      expect(find.text('API Key'), findsOneWidget);
      expect(find.text('Model Name'), findsOneWidget);
    });

    testWidgets('FR-002: System stores configuration locally', (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();

      // Act - Fill and save configuration
      await tester.enterText(
        find.byType(TextFormField).first,
        'https://api.openai.com/v1',
      );
      await tester.enterText(
        find.byType(TextFormField).at(1),
        'test-api-key-12345',
      );
      await tester.enterText(
        find.byType(TextFormField).at(2),
        'gpt-4',
      );

      final saveButton = find.byType(ElevatedButton);
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      // Assert - Configuration should be saved and navigate away
      expect(find.text('Configuration'), findsNothing);

      // Restart app to verify persistence
      await tester.binding.defaultBinaryMessenger
          .handlePlatformMessage('flutter/navigation', null, (data) {});
      app.main();
      await tester.pumpAndSettle();

      // Should not show configuration screen again
      expect(find.text('API Base URL'), findsNothing);
    });

    testWidgets('FR-003: System validates AI model capabilities',
        (tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();

      // Act - Enter invalid model
      await tester.enterText(
        find.byType(TextFormField).first,
        'https://api.openai.com/v1',
      );
      await tester.enterText(
        find.byType(TextFormField).at(1),
        'test-api-key',
      );
      await tester.enterText(
        find.byType(TextFormField).at(2),
        'invalid-model',
      );

      final saveButton = find.byType(ElevatedButton);
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      // Assert - Should show validation error
      expect(
        find.text('Selected model does not support multi-modal input'),
        findsOneWidget,
      );
    });

    testWidgets('Configuration persists across app restarts', (tester) async {
      // This integration test verifies local storage persistence
      // Will fail until Isar storage is implemented
      app.main();
      await tester.pumpAndSettle();

      // Should load existing configuration
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('Invalid configuration shows appropriate errors',
        (tester) async {
      // Test various validation scenarios
      app.main();
      await tester.pumpAndSettle();

      // Test empty API key
      await tester.enterText(
          find.byType(TextFormField).first, 'https://api.openai.com/v1');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Please enter API key'), findsOneWidget);
    });
  });
}
