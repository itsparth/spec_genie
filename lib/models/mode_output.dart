import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar_community/isar.dart';

part 'mode_output.mapper.dart';
part 'mode_output.g.dart';

@embedded
class ModeOutputMetadata {
  String? processingModel; // Which model was used for processing
  int? processingTimeMs; // Time taken to generate output
  double? temperature; // Temperature used for generation
  int? maxTokens; // Max tokens limit used
  String? version; // Version of the mode/prompt used
  DateTime? cacheExpiry; // When this cache entry expires
  List<String>? tags; // Custom tags for categorization
  @ignore
  Map<String, String>? customFields; // Additional custom data

  ModeOutputMetadata({
    this.processingModel,
    this.processingTimeMs,
    this.temperature,
    this.maxTokens,
    this.version,
    this.cacheExpiry,
    this.tags,
    this.customFields,
  });
}

@MappableClass()
@Collection()
class ModeOutput with ModeOutputMappable {
  final Id id;
  final String threadId;
  final String modeName;
  final String output;
  final String systemPrompt;
  final List<String> inputMessageIds;
  final DateTime? generatedAt;
  final DateTime? lastAccessedAt;
  final int accessCount;
  final int outputTokens;
  final int inputTokens;
  final ModeOutputMetadata? metadata; // Type-safe metadata
  final String checksum; // Hash of input content for cache validation

  const ModeOutput({
    this.id = Isar.autoIncrement,
    this.threadId = '',
    this.modeName = '',
    this.output = '',
    this.systemPrompt = '',
    this.inputMessageIds = const [],
    this.generatedAt,
    this.lastAccessedAt,
    this.accessCount = 0,
    this.outputTokens = 0,
    this.inputTokens = 0,
    this.metadata,
    this.checksum = '',
  });

  /// Create new output cache entry
  factory ModeOutput.create({
    required String threadId,
    required String modeName,
    required String output,
    required String systemPrompt,
    required List<String> inputMessageIds,
    required String checksum,
    int? outputTokens,
    int? inputTokens,
    ModeOutputMetadata? metadata,
  }) {
    final now = DateTime.now();
    return ModeOutput(
      threadId: threadId,
      modeName: modeName,
      output: output,
      systemPrompt: systemPrompt,
      inputMessageIds: inputMessageIds,
      checksum: checksum,
      generatedAt: now,
      lastAccessedAt: now,
      accessCount: 1,
      outputTokens: outputTokens ?? 0,
      inputTokens: inputTokens ?? 0,
      metadata: metadata,
    );
  }

  /// Check if cache is valid for given input
  bool isValidFor(List<String> messageIds, String currentChecksum) {
    // Check if message IDs match and checksum matches
    return _listsEqual(inputMessageIds, messageIds) &&
        checksum == currentChecksum;
  }

  /// Check if cache is expired (based on time or other factors)
  bool get isExpired {
    final now = DateTime.now();
    final age = now.difference(generatedAt ?? now);

    // Check if explicit cache expiry is set in metadata
    if (metadata?.cacheExpiry != null) {
      return now.isAfter(metadata!.cacheExpiry!);
    }

    // Cache expires after 24 hours for now
    return age.inHours > 24;
  }

  /// Mark output as accessed (update last accessed time and increment counter)
  ModeOutput markAsAccessed() {
    return copyWith(
      lastAccessedAt: DateTime.now(),
      accessCount: accessCount + 1,
    );
  }

  /// Update metadata
  ModeOutput updateMetadata({
    String? processingModel,
    int? processingTimeMs,
    double? temperature,
    int? maxTokens,
    String? version,
    DateTime? cacheExpiry,
    List<String>? tags,
    Map<String, String>? customFields,
  }) {
    final currentMetadata = metadata ?? ModeOutputMetadata();
    final updatedMetadata = ModeOutputMetadata(
      processingModel: processingModel ?? currentMetadata.processingModel,
      processingTimeMs: processingTimeMs ?? currentMetadata.processingTimeMs,
      temperature: temperature ?? currentMetadata.temperature,
      maxTokens: maxTokens ?? currentMetadata.maxTokens,
      version: version ?? currentMetadata.version,
      cacheExpiry: cacheExpiry ?? currentMetadata.cacheExpiry,
      tags: tags ?? currentMetadata.tags,
      customFields: customFields ?? currentMetadata.customFields,
    );
    return copyWith(metadata: updatedMetadata);
  }

  /// Get age in hours
  int get ageInHours {
    if (generatedAt == null) return 0;
    return DateTime.now().difference(generatedAt!).inHours;
  }

  /// Get age in minutes
  int get ageInMinutes {
    if (generatedAt == null) return 0;
    return DateTime.now().difference(generatedAt!).inMinutes;
  }

  /// Get formatted generation time
  String get formattedTime {
    if (generatedAt == null) return 'Unknown';

    final now = DateTime.now();
    final difference = now.difference(generatedAt!);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  /// Get output length in characters
  int get outputLength {
    return output.length;
  }

  /// Get output length in words (approximation)
  int get outputWordCount {
    return output.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length;
  }

  /// Check if output is substantial (more than just a short response)
  bool get isSubstantial {
    return outputLength > 100 && outputWordCount > 20;
  }

  /// Get cache efficiency (access count vs age)
  double get cacheEfficiency {
    if (ageInHours == 0) return accessCount.toDouble();
    return accessCount / ageInHours;
  }

  /// Get token usage info
  @ignore
  Map<String, int> get tokenUsage {
    return {
      'input': inputTokens,
      'output': outputTokens,
      'total': inputTokens + outputTokens,
    };
  }

  /// Get estimated cost (rough approximation)
  double get estimatedCost {
    // Rough cost estimation for GPT-4 (as of 2023)
    const inputCostPer1k = 0.03; // $0.03 per 1K input tokens
    const outputCostPer1k = 0.06; // $0.06 per 1K output tokens

    final inputCost = (inputTokens / 1000) * inputCostPer1k;
    final outputCost = (outputTokens / 1000) * outputCostPer1k;

    return inputCost + outputCost;
  }

  /// Get savings from using cache (based on access count)
  double get cacheSavings {
    if (accessCount <= 1) return 0.0;
    return estimatedCost * (accessCount - 1);
  }

  /// Check if this output is for a specific mode
  bool isForMode(String modeName) {
    return this.modeName.toLowerCase() == modeName.toLowerCase();
  }

  /// Get preview of output (first few lines)
  String get preview {
    final lines = output.split('\n');
    final previewLines = lines.take(3).join('\n');

    if (lines.length > 3) {
      return '$previewLines...';
    }
    return previewLines;
  }

  /// Helper method to compare lists
  bool _listsEqual(List<String> list1, List<String> list2) {
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }
    return true;
  }

  /// Check if cache entry is stale and should be cleaned up
  bool get shouldCleanup {
    return isExpired && accessCount <= 1 && ageInHours > 48;
  }

  /// Get custom field from metadata
  String? getCustomField(String key) {
    return metadata?.customFields?[key];
  }

  /// Check if has specific custom field in metadata
  bool hasCustomField(String key) {
    return metadata?.customFields?.containsKey(key) ?? false;
  }

  /// Get processing model used for generation
  String? get processingModel => metadata?.processingModel;

  /// Get processing time in milliseconds
  int? get processingTimeMs => metadata?.processingTimeMs;

  /// Get temperature used for generation
  double? get temperature => metadata?.temperature;

  /// Get max tokens limit used
  int? get maxTokens => metadata?.maxTokens;

  /// Get version of mode/prompt used
  String? get version => metadata?.version;

  /// Get cache expiry time
  DateTime? get cacheExpiry => metadata?.cacheExpiry;

  /// Get custom tags
  List<String>? get tags => metadata?.tags;
}
