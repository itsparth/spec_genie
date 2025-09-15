import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

part 'mode.mapper.dart';
part 'mode.g.dart';

@MappableClass()
@Collection()
class Mode with ModeMappable {
  final Id id;
  final String name;
  final String systemPrompt;
  final bool isBuiltIn;
  final bool isEnabled;
  final int sortOrder;
  final String description;
  final String icon; // Icon name or emoji
  @Ignore()
  final Map<String, dynamic> settings;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Mode({
    this.id = Isar.autoIncrement,
    this.name = '',
    this.systemPrompt = '',
    this.isBuiltIn = false,
    this.isEnabled = true,
    this.sortOrder = 0,
    this.description = '',
    this.icon = '',
    this.settings = const {},
    this.createdAt,
    this.updatedAt,
  });

  /// Built-in Spec mode
  factory Mode.spec() {
    final now = DateTime.now();
    return Mode(
      name: 'Spec',
      systemPrompt:
          '''You are a software specification assistant. Process all the user inputs (text, audio transcripts, images, files) in this thread and generate a comprehensive technical specification document in markdown format.

Include:
- Project overview and objectives
- Functional requirements
- Technical requirements
- User stories
- Acceptance criteria
- Implementation notes

Format as proper markdown with headers, bullet points, and clear structure.''',
      isBuiltIn: true,
      sortOrder: 1,
      description: 'Generate technical specifications',
      icon: '📋',
      createdAt: now,
      updatedAt: now,
    );
  }

  /// Built-in Code Context mode
  factory Mode.codeContext() {
    final now = DateTime.now();
    return Mode(
      name: 'Code Context',
      systemPrompt:
          '''You are a code analysis and documentation assistant. Process all the user inputs (text, audio transcripts, images, files) in this thread and generate comprehensive code context documentation in markdown format.

Include:
- Code analysis and structure overview
- Key components and their relationships
- Implementation patterns used
- Dependencies and integrations
- Potential improvements or issues
- Documentation gaps

Format as proper markdown with code blocks, headers, and clear explanations.''',
      isBuiltIn: true,
      sortOrder: 2,
      description: 'Analyze and document code context',
      icon: '💻',
      createdAt: now,
      updatedAt: now,
    );
  }

  /// Create custom mode
  factory Mode.custom({
    required String name,
    required String systemPrompt,
    String? description,
    String? icon,
    Map<String, dynamic>? settings,
  }) {
    final now = DateTime.now();
    return Mode(
      name: name,
      systemPrompt: systemPrompt,
      description: description ?? '',
      icon: icon ?? '⚙️',
      isBuiltIn: false,
      sortOrder: 99,
      settings: settings ?? {},
      createdAt: now,
      updatedAt: now,
    );
  }

  /// Get built-in modes
  static List<Mode> get builtInModes => [
        Mode.spec(),
        Mode.codeContext(),
      ];

  /// Update mode details
  Mode updateDetails({
    String? name,
    String? systemPrompt,
    String? description,
    String? icon,
    bool? isEnabled,
    int? sortOrder,
    Map<String, dynamic>? settings,
  }) {
    return copyWith(
      name: name ?? this.name,
      systemPrompt: systemPrompt ?? this.systemPrompt,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      isEnabled: isEnabled ?? this.isEnabled,
      sortOrder: sortOrder ?? this.sortOrder,
      settings: settings ?? this.settings,
      updatedAt: DateTime.now(),
    );
  }

  /// Toggle enabled status
  Mode toggleEnabled() {
    return copyWith(
      isEnabled: !isEnabled,
      updatedAt: DateTime.now(),
    );
  }

  /// Update system prompt
  Mode updatePrompt(String newPrompt) {
    return copyWith(
      systemPrompt: newPrompt,
      updatedAt: DateTime.now(),
    );
  }

  /// Add or update setting
  Mode updateSetting(String key, dynamic value) {
    final updatedSettings = Map<String, dynamic>.from(settings);
    updatedSettings[key] = value;
    return copyWith(
      settings: updatedSettings,
      updatedAt: DateTime.now(),
    );
  }

  /// Remove setting
  Mode removeSetting(String key) {
    final updatedSettings = Map<String, dynamic>.from(settings);
    updatedSettings.remove(key);
    return copyWith(
      settings: updatedSettings,
      updatedAt: DateTime.now(),
    );
  }

  /// Get display icon
  String get displayIcon {
    return icon.isNotEmpty ? icon : '⚙️';
  }

  /// Check if mode can be deleted (only custom modes)
  bool get isDeletable {
    return !isBuiltIn;
  }

  /// Check if mode can be edited (all modes can be edited, but built-ins have restrictions)
  bool get isEditable {
    return true;
  }

  /// Get setting value
  T? getSetting<T>(String key) {
    return settings[key] as T?;
  }

  /// Check if mode has specific setting
  bool hasSetting(String key) {
    return settings.containsKey(key);
  }

  /// Get mode summary for display
  String get summary {
    if (description.isNotEmpty) {
      return description;
    }

    // Generate summary from system prompt
    final lines =
        systemPrompt.split('\n').where((line) => line.trim().isNotEmpty);
    if (lines.isNotEmpty) {
      return lines.first.trim();
    }

    return 'Custom mode';
  }

  /// Validate mode configuration
  bool get isValid {
    return name.isNotEmpty && systemPrompt.isNotEmpty;
  }
}
