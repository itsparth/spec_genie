import 'package:dart_mappable/dart_mappable.dart';

part 'mode.mapper.dart';

@MappableClass()
class Mode with ModeMappable {
  String id;
  String name;
  String prompt;
  bool isDefault;

  Mode({
    required this.id,
    required this.name,
    required this.prompt,
    this.isDefault = false,
  });

  // Helper getters
  bool get isEditable => !isDefault;

  // Factory for custom modes
  static Mode custom({
    required String name,
    required String prompt,
    String? id,
  }) {
    return Mode(
      id: id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      prompt: prompt,
      isDefault: false,
    );
  }

  // Default modes factory methods
  static Mode spec() => Mode(
        id: 'spec',
        name: 'Spec',
        prompt:
            'Generate detailed technical specifications based on the given requirements. Focus on clarity, completeness, and actionable details.',
        isDefault: true,
      );

  static Mode codeContext() => Mode(
        id: 'code_context',
        name: 'Code Context',
        prompt:
            'Analyze the provided code and generate contextual information, documentation, or explanations that help understand the code\'s purpose and implementation.',
        isDefault: true,
      );
}
