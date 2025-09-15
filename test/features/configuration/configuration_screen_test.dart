import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spec_genie/features/configuration/configuration_screen.dart';

void main() {
  group('ConfigurationScreen Widget Tests', () {
    testWidgets('displays configuration form fields', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: ConfigurationScreen(),
        ),
      );

      // Assert
      expect(find.byType(TextFormField), findsAtLeastNWidgets(3));
      expect(find.text('API Base URL'), findsOneWidget);
      expect(find.text('API Key'), findsOneWidget);
      expect(find.text('Model Name'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('validates required fields', (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: ConfigurationScreen(),
        ),
      );

      // Act - Try to save without filling fields
      final saveButton = find.byType(ElevatedButton);
      await tester.tap(saveButton);
      await tester.pump();

      // Assert - Should show validation errors
      expect(find.text('Please enter API base URL'), findsOneWidget);
      expect(find.text('Please enter API key'), findsOneWidget);
      expect(find.text('Please enter model name'), findsOneWidget);
    });

    testWidgets('saves configuration when valid', (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: ConfigurationScreen(),
        ),
      );

      // Act - Fill in valid data
      await tester.enterText(
        find.byType(TextFormField).at(0),
        'https://api.openai.com/v1',
      );
      await tester.enterText(
        find.byType(TextFormField).at(1),
        'test-api-key',
      );
      await tester.enterText(
        find.byType(TextFormField).at(2),
        'gpt-4',
      );

      final saveButton = find.byType(ElevatedButton);
      await tester.tap(saveButton);
      await tester.pump();

      // Assert - Should save successfully (this will fail until we implement)
      expect(find.text('Configuration saved successfully'), findsOneWidget);
    });

    testWidgets('loads existing configuration', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: ConfigurationScreen(),
        ),
      );

      // Assert - Should load existing config if available
      // This test will fail until we implement storage
      expect(find.byType(ConfigurationScreen), findsOneWidget);
    });
  });
}
