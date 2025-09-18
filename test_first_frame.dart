import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spec_genie/features/tags/models/tag.dart';
import 'package:spec_genie/features/tags/ui/tags_selection_widget.dart';

void main() {
  group('TagsSelectionWidget First Frame Test', () {
    testWidgets('should show initial tags on first frame without pump',
        (WidgetTester tester) async {
      final testTags = [
        Tag(
            id: 1,
            name: 'Immediate Tag',
            description: 'Should appear immediately',
            isEditable: true),
      ];

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TagsSelectionWidget(
                selectionKey: 'first_frame_test',
                initialTags: testTags,
              ),
            ),
          ),
        ),
      );

      // NO additional pump() calls - tags should be visible immediately
      expect(find.text('Immediate Tag'), findsOneWidget);
      expect(find.text('Tags'), findsNothing);
    });

    testWidgets('should show "Tags" immediately when no initial tags',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TagsSelectionWidget(
                selectionKey: 'no_initial_tags_test',
              ),
            ),
          ),
        ),
      );

      // Should show "Tags" immediately without additional pumps
      expect(find.text('Tags'), findsOneWidget);
    });
  });
}
