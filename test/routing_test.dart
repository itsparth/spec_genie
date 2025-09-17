import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:spec_genie/features/shared/isar/isar_provider.dart';
import 'package:spec_genie/features/tags/models/tag.dart';
import 'package:spec_genie/main.dart';
import 'package:spec_genie/routing/routes/app_routes.dart';
import 'package:spec_genie/features/configuration/models/configuration.dart';
import 'package:spec_genie/features/chat/models/message.dart';
import 'package:spec_genie/features/threads/models/thread.dart';
import 'package:spec_genie/features/modes/models/mode.dart';
import 'package:spec_genie/features/mode_output/models/mode_output.dart';

void main() {
  group('Routing Tests', () {
    late Isar isar;

    setUp(() async {
      // Initialize in-memory Isar for testing
      isar = await Isar.open(
        [
          ConfigurationSchema,
          MessageSchema,
          ThreadSchema,
          ModeSchema,
          ModeOutputSchema,
          TagSchema,
        ],
        directory: '',
      );
    });

    tearDown(() async {
      await isar.close();
    });

    testWidgets('Navigate to model configuration when no config exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            isarProvider.overrideWith((ref) => isar),
          ],
          child: const MyApp(),
        ),
      );

      // Wait for navigation to occur
      await tester.pumpAndSettle();

      // Should navigate to model configuration page since no config exists
      expect(find.text('Model Configuration'), findsOneWidget);
      expect(find.text('API Key *'), findsOneWidget);
    });

    testWidgets('Navigate to threads page when config exists',
        (WidgetTester tester) async {
      // Set up a configuration first
      await isar.writeTxn(() async {
        await isar.configurations.put(const Configuration(
          apiKey: 'test-api-key',
          modelName: 'gpt-4o-mini',
        ));
      });

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            isarProvider.overrideWith((ref) => isar),
          ],
          child: const MyApp(),
        ),
      );

      // Wait for navigation to occur
      await tester.pumpAndSettle();

      // Should navigate to threads page since config exists
      expect(find.text('Threads'), findsOneWidget);
    });

    testWidgets('Can navigate between routes', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            isarProvider.overrideWith((ref) => isar),
          ],
          child: const MyApp(),
        ),
      );

      // Wait for initial navigation
      await tester.pumpAndSettle();

      // Should be on model configuration page
      expect(find.text('Model Configuration'), findsOneWidget);
    });
  });
}
