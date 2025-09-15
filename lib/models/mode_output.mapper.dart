// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mode_output.dart';

class ModeOutputMapper extends ClassMapperBase<ModeOutput> {
  ModeOutputMapper._();

  static ModeOutputMapper? _instance;
  static ModeOutputMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ModeOutputMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ModeOutput';

  static int _$id(ModeOutput v) => v.id;
  static const Field<ModeOutput, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
    def: Isar.autoIncrement,
  );
  static String _$threadId(ModeOutput v) => v.threadId;
  static const Field<ModeOutput, String> _f$threadId = Field(
    'threadId',
    _$threadId,
    opt: true,
    def: '',
  );
  static String _$modeName(ModeOutput v) => v.modeName;
  static const Field<ModeOutput, String> _f$modeName = Field(
    'modeName',
    _$modeName,
    opt: true,
    def: '',
  );
  static String _$output(ModeOutput v) => v.output;
  static const Field<ModeOutput, String> _f$output = Field(
    'output',
    _$output,
    opt: true,
    def: '',
  );
  static String _$systemPrompt(ModeOutput v) => v.systemPrompt;
  static const Field<ModeOutput, String> _f$systemPrompt = Field(
    'systemPrompt',
    _$systemPrompt,
    opt: true,
    def: '',
  );
  static List<String> _$inputMessageIds(ModeOutput v) => v.inputMessageIds;
  static const Field<ModeOutput, List<String>> _f$inputMessageIds = Field(
    'inputMessageIds',
    _$inputMessageIds,
    opt: true,
    def: const [],
  );
  static DateTime? _$generatedAt(ModeOutput v) => v.generatedAt;
  static const Field<ModeOutput, DateTime> _f$generatedAt = Field(
    'generatedAt',
    _$generatedAt,
    opt: true,
  );
  static DateTime? _$lastAccessedAt(ModeOutput v) => v.lastAccessedAt;
  static const Field<ModeOutput, DateTime> _f$lastAccessedAt = Field(
    'lastAccessedAt',
    _$lastAccessedAt,
    opt: true,
  );
  static int _$accessCount(ModeOutput v) => v.accessCount;
  static const Field<ModeOutput, int> _f$accessCount = Field(
    'accessCount',
    _$accessCount,
    opt: true,
    def: 0,
  );
  static int _$outputTokens(ModeOutput v) => v.outputTokens;
  static const Field<ModeOutput, int> _f$outputTokens = Field(
    'outputTokens',
    _$outputTokens,
    opt: true,
    def: 0,
  );
  static int _$inputTokens(ModeOutput v) => v.inputTokens;
  static const Field<ModeOutput, int> _f$inputTokens = Field(
    'inputTokens',
    _$inputTokens,
    opt: true,
    def: 0,
  );
  static ModeOutputMetadata? _$metadata(ModeOutput v) => v.metadata;
  static const Field<ModeOutput, ModeOutputMetadata> _f$metadata = Field(
    'metadata',
    _$metadata,
    opt: true,
  );
  static String _$checksum(ModeOutput v) => v.checksum;
  static const Field<ModeOutput, String> _f$checksum = Field(
    'checksum',
    _$checksum,
    opt: true,
    def: '',
  );
  static bool _$isExpired(ModeOutput v) => v.isExpired;
  static const Field<ModeOutput, bool> _f$isExpired = Field(
    'isExpired',
    _$isExpired,
    mode: FieldMode.member,
  );
  static int _$ageInHours(ModeOutput v) => v.ageInHours;
  static const Field<ModeOutput, int> _f$ageInHours = Field(
    'ageInHours',
    _$ageInHours,
    mode: FieldMode.member,
  );
  static int _$ageInMinutes(ModeOutput v) => v.ageInMinutes;
  static const Field<ModeOutput, int> _f$ageInMinutes = Field(
    'ageInMinutes',
    _$ageInMinutes,
    mode: FieldMode.member,
  );
  static String _$formattedTime(ModeOutput v) => v.formattedTime;
  static const Field<ModeOutput, String> _f$formattedTime = Field(
    'formattedTime',
    _$formattedTime,
    mode: FieldMode.member,
  );
  static int _$outputLength(ModeOutput v) => v.outputLength;
  static const Field<ModeOutput, int> _f$outputLength = Field(
    'outputLength',
    _$outputLength,
    mode: FieldMode.member,
  );
  static int _$outputWordCount(ModeOutput v) => v.outputWordCount;
  static const Field<ModeOutput, int> _f$outputWordCount = Field(
    'outputWordCount',
    _$outputWordCount,
    mode: FieldMode.member,
  );
  static bool _$isSubstantial(ModeOutput v) => v.isSubstantial;
  static const Field<ModeOutput, bool> _f$isSubstantial = Field(
    'isSubstantial',
    _$isSubstantial,
    mode: FieldMode.member,
  );
  static double _$cacheEfficiency(ModeOutput v) => v.cacheEfficiency;
  static const Field<ModeOutput, double> _f$cacheEfficiency = Field(
    'cacheEfficiency',
    _$cacheEfficiency,
    mode: FieldMode.member,
  );
  static Map<String, int> _$tokenUsage(ModeOutput v) => v.tokenUsage;
  static const Field<ModeOutput, Map<String, int>> _f$tokenUsage = Field(
    'tokenUsage',
    _$tokenUsage,
    mode: FieldMode.member,
  );
  static double _$estimatedCost(ModeOutput v) => v.estimatedCost;
  static const Field<ModeOutput, double> _f$estimatedCost = Field(
    'estimatedCost',
    _$estimatedCost,
    mode: FieldMode.member,
  );
  static double _$cacheSavings(ModeOutput v) => v.cacheSavings;
  static const Field<ModeOutput, double> _f$cacheSavings = Field(
    'cacheSavings',
    _$cacheSavings,
    mode: FieldMode.member,
  );
  static String _$preview(ModeOutput v) => v.preview;
  static const Field<ModeOutput, String> _f$preview = Field(
    'preview',
    _$preview,
    mode: FieldMode.member,
  );
  static bool _$shouldCleanup(ModeOutput v) => v.shouldCleanup;
  static const Field<ModeOutput, bool> _f$shouldCleanup = Field(
    'shouldCleanup',
    _$shouldCleanup,
    mode: FieldMode.member,
  );
  static String? _$processingModel(ModeOutput v) => v.processingModel;
  static const Field<ModeOutput, String> _f$processingModel = Field(
    'processingModel',
    _$processingModel,
    mode: FieldMode.member,
  );
  static int? _$processingTimeMs(ModeOutput v) => v.processingTimeMs;
  static const Field<ModeOutput, int> _f$processingTimeMs = Field(
    'processingTimeMs',
    _$processingTimeMs,
    mode: FieldMode.member,
  );
  static double? _$temperature(ModeOutput v) => v.temperature;
  static const Field<ModeOutput, double> _f$temperature = Field(
    'temperature',
    _$temperature,
    mode: FieldMode.member,
  );
  static int? _$maxTokens(ModeOutput v) => v.maxTokens;
  static const Field<ModeOutput, int> _f$maxTokens = Field(
    'maxTokens',
    _$maxTokens,
    mode: FieldMode.member,
  );
  static String? _$version(ModeOutput v) => v.version;
  static const Field<ModeOutput, String> _f$version = Field(
    'version',
    _$version,
    mode: FieldMode.member,
  );
  static DateTime? _$cacheExpiry(ModeOutput v) => v.cacheExpiry;
  static const Field<ModeOutput, DateTime> _f$cacheExpiry = Field(
    'cacheExpiry',
    _$cacheExpiry,
    mode: FieldMode.member,
  );
  static List<String>? _$tags(ModeOutput v) => v.tags;
  static const Field<ModeOutput, List<String>> _f$tags = Field(
    'tags',
    _$tags,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ModeOutput> fields = const {
    #id: _f$id,
    #threadId: _f$threadId,
    #modeName: _f$modeName,
    #output: _f$output,
    #systemPrompt: _f$systemPrompt,
    #inputMessageIds: _f$inputMessageIds,
    #generatedAt: _f$generatedAt,
    #lastAccessedAt: _f$lastAccessedAt,
    #accessCount: _f$accessCount,
    #outputTokens: _f$outputTokens,
    #inputTokens: _f$inputTokens,
    #metadata: _f$metadata,
    #checksum: _f$checksum,
    #isExpired: _f$isExpired,
    #ageInHours: _f$ageInHours,
    #ageInMinutes: _f$ageInMinutes,
    #formattedTime: _f$formattedTime,
    #outputLength: _f$outputLength,
    #outputWordCount: _f$outputWordCount,
    #isSubstantial: _f$isSubstantial,
    #cacheEfficiency: _f$cacheEfficiency,
    #tokenUsage: _f$tokenUsage,
    #estimatedCost: _f$estimatedCost,
    #cacheSavings: _f$cacheSavings,
    #preview: _f$preview,
    #shouldCleanup: _f$shouldCleanup,
    #processingModel: _f$processingModel,
    #processingTimeMs: _f$processingTimeMs,
    #temperature: _f$temperature,
    #maxTokens: _f$maxTokens,
    #version: _f$version,
    #cacheExpiry: _f$cacheExpiry,
    #tags: _f$tags,
  };

  static ModeOutput _instantiate(DecodingData data) {
    return ModeOutput(
      id: data.dec(_f$id),
      threadId: data.dec(_f$threadId),
      modeName: data.dec(_f$modeName),
      output: data.dec(_f$output),
      systemPrompt: data.dec(_f$systemPrompt),
      inputMessageIds: data.dec(_f$inputMessageIds),
      generatedAt: data.dec(_f$generatedAt),
      lastAccessedAt: data.dec(_f$lastAccessedAt),
      accessCount: data.dec(_f$accessCount),
      outputTokens: data.dec(_f$outputTokens),
      inputTokens: data.dec(_f$inputTokens),
      metadata: data.dec(_f$metadata),
      checksum: data.dec(_f$checksum),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ModeOutput fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ModeOutput>(map);
  }

  static ModeOutput fromJson(String json) {
    return ensureInitialized().decodeJson<ModeOutput>(json);
  }
}

mixin ModeOutputMappable {
  String toJson() {
    return ModeOutputMapper.ensureInitialized().encodeJson<ModeOutput>(
      this as ModeOutput,
    );
  }

  Map<String, dynamic> toMap() {
    return ModeOutputMapper.ensureInitialized().encodeMap<ModeOutput>(
      this as ModeOutput,
    );
  }

  ModeOutputCopyWith<ModeOutput, ModeOutput, ModeOutput> get copyWith =>
      _ModeOutputCopyWithImpl<ModeOutput, ModeOutput>(
        this as ModeOutput,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ModeOutputMapper.ensureInitialized().stringifyValue(
      this as ModeOutput,
    );
  }

  @override
  bool operator ==(Object other) {
    return ModeOutputMapper.ensureInitialized().equalsValue(
      this as ModeOutput,
      other,
    );
  }

  @override
  int get hashCode {
    return ModeOutputMapper.ensureInitialized().hashValue(this as ModeOutput);
  }
}

extension ModeOutputValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ModeOutput, $Out> {
  ModeOutputCopyWith<$R, ModeOutput, $Out> get $asModeOutput =>
      $base.as((v, t, t2) => _ModeOutputCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ModeOutputCopyWith<$R, $In extends ModeOutput, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get inputMessageIds;
  $R call({
    int? id,
    String? threadId,
    String? modeName,
    String? output,
    String? systemPrompt,
    List<String>? inputMessageIds,
    DateTime? generatedAt,
    DateTime? lastAccessedAt,
    int? accessCount,
    int? outputTokens,
    int? inputTokens,
    ModeOutputMetadata? metadata,
    String? checksum,
  });
  ModeOutputCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ModeOutputCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ModeOutput, $Out>
    implements ModeOutputCopyWith<$R, ModeOutput, $Out> {
  _ModeOutputCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ModeOutput> $mapper =
      ModeOutputMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get inputMessageIds => ListCopyWith(
    $value.inputMessageIds,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(inputMessageIds: v),
  );
  @override
  $R call({
    int? id,
    String? threadId,
    String? modeName,
    String? output,
    String? systemPrompt,
    List<String>? inputMessageIds,
    Object? generatedAt = $none,
    Object? lastAccessedAt = $none,
    int? accessCount,
    int? outputTokens,
    int? inputTokens,
    Object? metadata = $none,
    String? checksum,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (threadId != null) #threadId: threadId,
      if (modeName != null) #modeName: modeName,
      if (output != null) #output: output,
      if (systemPrompt != null) #systemPrompt: systemPrompt,
      if (inputMessageIds != null) #inputMessageIds: inputMessageIds,
      if (generatedAt != $none) #generatedAt: generatedAt,
      if (lastAccessedAt != $none) #lastAccessedAt: lastAccessedAt,
      if (accessCount != null) #accessCount: accessCount,
      if (outputTokens != null) #outputTokens: outputTokens,
      if (inputTokens != null) #inputTokens: inputTokens,
      if (metadata != $none) #metadata: metadata,
      if (checksum != null) #checksum: checksum,
    }),
  );
  @override
  ModeOutput $make(CopyWithData data) => ModeOutput(
    id: data.get(#id, or: $value.id),
    threadId: data.get(#threadId, or: $value.threadId),
    modeName: data.get(#modeName, or: $value.modeName),
    output: data.get(#output, or: $value.output),
    systemPrompt: data.get(#systemPrompt, or: $value.systemPrompt),
    inputMessageIds: data.get(#inputMessageIds, or: $value.inputMessageIds),
    generatedAt: data.get(#generatedAt, or: $value.generatedAt),
    lastAccessedAt: data.get(#lastAccessedAt, or: $value.lastAccessedAt),
    accessCount: data.get(#accessCount, or: $value.accessCount),
    outputTokens: data.get(#outputTokens, or: $value.outputTokens),
    inputTokens: data.get(#inputTokens, or: $value.inputTokens),
    metadata: data.get(#metadata, or: $value.metadata),
    checksum: data.get(#checksum, or: $value.checksum),
  );

  @override
  ModeOutputCopyWith<$R2, ModeOutput, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ModeOutputCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

