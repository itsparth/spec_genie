// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'configuration.dart';

class ConfigurationMapper extends ClassMapperBase<Configuration> {
  ConfigurationMapper._();

  static ConfigurationMapper? _instance;
  static ConfigurationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfigurationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Configuration';

  static int _$id(Configuration v) => v.id;
  static const Field<Configuration, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
    def: Isar.autoIncrement,
  );
  static String _$openAIApiKey(Configuration v) => v.openAIApiKey;
  static const Field<Configuration, String> _f$openAIApiKey = Field(
    'openAIApiKey',
    _$openAIApiKey,
    opt: true,
    def: '',
  );
  static String _$defaultModel(Configuration v) => v.defaultModel;
  static const Field<Configuration, String> _f$defaultModel = Field(
    'defaultModel',
    _$defaultModel,
    opt: true,
    def: 'gpt-4',
  );
  static int _$maxTokens(Configuration v) => v.maxTokens;
  static const Field<Configuration, int> _f$maxTokens = Field(
    'maxTokens',
    _$maxTokens,
    opt: true,
    def: 4000,
  );
  static double _$temperature(Configuration v) => v.temperature;
  static const Field<Configuration, double> _f$temperature = Field(
    'temperature',
    _$temperature,
    opt: true,
    def: 0.7,
  );
  static String _$systemPrompt(Configuration v) => v.systemPrompt;
  static const Field<Configuration, String> _f$systemPrompt = Field(
    'systemPrompt',
    _$systemPrompt,
    opt: true,
    def:
        'You are a helpful assistant that processes user inputs and generates comprehensive outputs.',
  );
  static bool _$enableAudioTranscription(Configuration v) =>
      v.enableAudioTranscription;
  static const Field<Configuration, bool> _f$enableAudioTranscription = Field(
    'enableAudioTranscription',
    _$enableAudioTranscription,
    opt: true,
    def: true,
  );
  static bool _$enableSpeechToText(Configuration v) => v.enableSpeechToText;
  static const Field<Configuration, bool> _f$enableSpeechToText = Field(
    'enableSpeechToText',
    _$enableSpeechToText,
    opt: true,
    def: true,
  );
  static String? _$sttModel(Configuration v) => v.sttModel;
  static const Field<Configuration, String> _f$sttModel = Field(
    'sttModel',
    _$sttModel,
    opt: true,
  );
  static bool _$enableImageProcessing(Configuration v) =>
      v.enableImageProcessing;
  static const Field<Configuration, bool> _f$enableImageProcessing = Field(
    'enableImageProcessing',
    _$enableImageProcessing,
    opt: true,
    def: true,
  );
  static bool _$enableFileProcessing(Configuration v) => v.enableFileProcessing;
  static const Field<Configuration, bool> _f$enableFileProcessing = Field(
    'enableFileProcessing',
    _$enableFileProcessing,
    opt: true,
    def: true,
  );
  static int _$maxFileSizeBytes(Configuration v) => v.maxFileSizeBytes;
  static const Field<Configuration, int> _f$maxFileSizeBytes = Field(
    'maxFileSizeBytes',
    _$maxFileSizeBytes,
    opt: true,
    def: 10485760,
  );
  static List<String> _$allowedFileTypes(Configuration v) => v.allowedFileTypes;
  static const Field<Configuration, List<String>> _f$allowedFileTypes = Field(
    'allowedFileTypes',
    _$allowedFileTypes,
    opt: true,
    def: const ['pdf', 'txt', 'md', 'doc', 'docx'],
  );
  static List<String> _$allowedImageTypes(Configuration v) =>
      v.allowedImageTypes;
  static const Field<Configuration, List<String>> _f$allowedImageTypes = Field(
    'allowedImageTypes',
    _$allowedImageTypes,
    opt: true,
    def: const ['jpg', 'jpeg', 'png', 'gif', 'bmp'],
  );
  static List<String> _$allowedAudioTypes(Configuration v) =>
      v.allowedAudioTypes;
  static const Field<Configuration, List<String>> _f$allowedAudioTypes = Field(
    'allowedAudioTypes',
    _$allowedAudioTypes,
    opt: true,
    def: const ['mp3', 'wav', 'm4a', 'aac'],
  );
  static int _$maxRecordingDurationSeconds(Configuration v) =>
      v.maxRecordingDurationSeconds;
  static const Field<Configuration, int> _f$maxRecordingDurationSeconds = Field(
    'maxRecordingDurationSeconds',
    _$maxRecordingDurationSeconds,
    opt: true,
    def: 30,
  );
  static bool _$enableOutputCaching(Configuration v) => v.enableOutputCaching;
  static const Field<Configuration, bool> _f$enableOutputCaching = Field(
    'enableOutputCaching',
    _$enableOutputCaching,
    opt: true,
    def: true,
  );
  static int _$maxCachedOutputs(Configuration v) => v.maxCachedOutputs;
  static const Field<Configuration, int> _f$maxCachedOutputs = Field(
    'maxCachedOutputs',
    _$maxCachedOutputs,
    opt: true,
    def: 100,
  );
  static DateTime? _$createdAt(Configuration v) => v.createdAt;
  static const Field<Configuration, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(Configuration v) => v.updatedAt;
  static const Field<Configuration, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static bool _$isValid(Configuration v) => v.isValid;
  static const Field<Configuration, bool> _f$isValid = Field(
    'isValid',
    _$isValid,
    mode: FieldMode.member,
  );
  static bool _$hasValidApiKey(Configuration v) => v.hasValidApiKey;
  static const Field<Configuration, bool> _f$hasValidApiKey = Field(
    'hasValidApiKey',
    _$hasValidApiKey,
    mode: FieldMode.member,
  );
  static double _$maxFileSizeMB(Configuration v) => v.maxFileSizeMB;
  static const Field<Configuration, double> _f$maxFileSizeMB = Field(
    'maxFileSizeMB',
    _$maxFileSizeMB,
    mode: FieldMode.member,
  );
  static bool _$isSttEnabled(Configuration v) => v.isSttEnabled;
  static const Field<Configuration, bool> _f$isSttEnabled = Field(
    'isSttEnabled',
    _$isSttEnabled,
    mode: FieldMode.member,
  );
  static String _$effectiveSttModel(Configuration v) => v.effectiveSttModel;
  static const Field<Configuration, String> _f$effectiveSttModel = Field(
    'effectiveSttModel',
    _$effectiveSttModel,
    mode: FieldMode.member,
  );
  static List<String> _$availableSttModels(Configuration v) =>
      v.availableSttModels;
  static const Field<Configuration, List<String>> _f$availableSttModels = Field(
    'availableSttModels',
    _$availableSttModels,
    mode: FieldMode.member,
  );
  static bool _$hasSttModel(Configuration v) => v.hasSttModel;
  static const Field<Configuration, bool> _f$hasSttModel = Field(
    'hasSttModel',
    _$hasSttModel,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<Configuration> fields = const {
    #id: _f$id,
    #openAIApiKey: _f$openAIApiKey,
    #defaultModel: _f$defaultModel,
    #maxTokens: _f$maxTokens,
    #temperature: _f$temperature,
    #systemPrompt: _f$systemPrompt,
    #enableAudioTranscription: _f$enableAudioTranscription,
    #enableSpeechToText: _f$enableSpeechToText,
    #sttModel: _f$sttModel,
    #enableImageProcessing: _f$enableImageProcessing,
    #enableFileProcessing: _f$enableFileProcessing,
    #maxFileSizeBytes: _f$maxFileSizeBytes,
    #allowedFileTypes: _f$allowedFileTypes,
    #allowedImageTypes: _f$allowedImageTypes,
    #allowedAudioTypes: _f$allowedAudioTypes,
    #maxRecordingDurationSeconds: _f$maxRecordingDurationSeconds,
    #enableOutputCaching: _f$enableOutputCaching,
    #maxCachedOutputs: _f$maxCachedOutputs,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #isValid: _f$isValid,
    #hasValidApiKey: _f$hasValidApiKey,
    #maxFileSizeMB: _f$maxFileSizeMB,
    #isSttEnabled: _f$isSttEnabled,
    #effectiveSttModel: _f$effectiveSttModel,
    #availableSttModels: _f$availableSttModels,
    #hasSttModel: _f$hasSttModel,
  };

  static Configuration _instantiate(DecodingData data) {
    return Configuration(
      id: data.dec(_f$id),
      openAIApiKey: data.dec(_f$openAIApiKey),
      defaultModel: data.dec(_f$defaultModel),
      maxTokens: data.dec(_f$maxTokens),
      temperature: data.dec(_f$temperature),
      systemPrompt: data.dec(_f$systemPrompt),
      enableAudioTranscription: data.dec(_f$enableAudioTranscription),
      enableSpeechToText: data.dec(_f$enableSpeechToText),
      sttModel: data.dec(_f$sttModel),
      enableImageProcessing: data.dec(_f$enableImageProcessing),
      enableFileProcessing: data.dec(_f$enableFileProcessing),
      maxFileSizeBytes: data.dec(_f$maxFileSizeBytes),
      allowedFileTypes: data.dec(_f$allowedFileTypes),
      allowedImageTypes: data.dec(_f$allowedImageTypes),
      allowedAudioTypes: data.dec(_f$allowedAudioTypes),
      maxRecordingDurationSeconds: data.dec(_f$maxRecordingDurationSeconds),
      enableOutputCaching: data.dec(_f$enableOutputCaching),
      maxCachedOutputs: data.dec(_f$maxCachedOutputs),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Configuration fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Configuration>(map);
  }

  static Configuration fromJson(String json) {
    return ensureInitialized().decodeJson<Configuration>(json);
  }
}

mixin ConfigurationMappable {
  String toJson() {
    return ConfigurationMapper.ensureInitialized().encodeJson<Configuration>(
      this as Configuration,
    );
  }

  Map<String, dynamic> toMap() {
    return ConfigurationMapper.ensureInitialized().encodeMap<Configuration>(
      this as Configuration,
    );
  }

  ConfigurationCopyWith<Configuration, Configuration, Configuration>
  get copyWith => _ConfigurationCopyWithImpl<Configuration, Configuration>(
    this as Configuration,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ConfigurationMapper.ensureInitialized().stringifyValue(
      this as Configuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return ConfigurationMapper.ensureInitialized().equalsValue(
      this as Configuration,
      other,
    );
  }

  @override
  int get hashCode {
    return ConfigurationMapper.ensureInitialized().hashValue(
      this as Configuration,
    );
  }
}

extension ConfigurationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Configuration, $Out> {
  ConfigurationCopyWith<$R, Configuration, $Out> get $asConfiguration =>
      $base.as((v, t, t2) => _ConfigurationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ConfigurationCopyWith<$R, $In extends Configuration, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get allowedFileTypes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get allowedImageTypes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get allowedAudioTypes;
  $R call({
    int? id,
    String? openAIApiKey,
    String? defaultModel,
    int? maxTokens,
    double? temperature,
    String? systemPrompt,
    bool? enableAudioTranscription,
    bool? enableSpeechToText,
    String? sttModel,
    bool? enableImageProcessing,
    bool? enableFileProcessing,
    int? maxFileSizeBytes,
    List<String>? allowedFileTypes,
    List<String>? allowedImageTypes,
    List<String>? allowedAudioTypes,
    int? maxRecordingDurationSeconds,
    bool? enableOutputCaching,
    int? maxCachedOutputs,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  ConfigurationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConfigurationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Configuration, $Out>
    implements ConfigurationCopyWith<$R, Configuration, $Out> {
  _ConfigurationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Configuration> $mapper =
      ConfigurationMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get allowedFileTypes => ListCopyWith(
    $value.allowedFileTypes,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(allowedFileTypes: v),
  );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get allowedImageTypes => ListCopyWith(
    $value.allowedImageTypes,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(allowedImageTypes: v),
  );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get allowedAudioTypes => ListCopyWith(
    $value.allowedAudioTypes,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(allowedAudioTypes: v),
  );
  @override
  $R call({
    int? id,
    String? openAIApiKey,
    String? defaultModel,
    int? maxTokens,
    double? temperature,
    String? systemPrompt,
    bool? enableAudioTranscription,
    bool? enableSpeechToText,
    Object? sttModel = $none,
    bool? enableImageProcessing,
    bool? enableFileProcessing,
    int? maxFileSizeBytes,
    List<String>? allowedFileTypes,
    List<String>? allowedImageTypes,
    List<String>? allowedAudioTypes,
    int? maxRecordingDurationSeconds,
    bool? enableOutputCaching,
    int? maxCachedOutputs,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (openAIApiKey != null) #openAIApiKey: openAIApiKey,
      if (defaultModel != null) #defaultModel: defaultModel,
      if (maxTokens != null) #maxTokens: maxTokens,
      if (temperature != null) #temperature: temperature,
      if (systemPrompt != null) #systemPrompt: systemPrompt,
      if (enableAudioTranscription != null)
        #enableAudioTranscription: enableAudioTranscription,
      if (enableSpeechToText != null) #enableSpeechToText: enableSpeechToText,
      if (sttModel != $none) #sttModel: sttModel,
      if (enableImageProcessing != null)
        #enableImageProcessing: enableImageProcessing,
      if (enableFileProcessing != null)
        #enableFileProcessing: enableFileProcessing,
      if (maxFileSizeBytes != null) #maxFileSizeBytes: maxFileSizeBytes,
      if (allowedFileTypes != null) #allowedFileTypes: allowedFileTypes,
      if (allowedImageTypes != null) #allowedImageTypes: allowedImageTypes,
      if (allowedAudioTypes != null) #allowedAudioTypes: allowedAudioTypes,
      if (maxRecordingDurationSeconds != null)
        #maxRecordingDurationSeconds: maxRecordingDurationSeconds,
      if (enableOutputCaching != null)
        #enableOutputCaching: enableOutputCaching,
      if (maxCachedOutputs != null) #maxCachedOutputs: maxCachedOutputs,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  Configuration $make(CopyWithData data) => Configuration(
    id: data.get(#id, or: $value.id),
    openAIApiKey: data.get(#openAIApiKey, or: $value.openAIApiKey),
    defaultModel: data.get(#defaultModel, or: $value.defaultModel),
    maxTokens: data.get(#maxTokens, or: $value.maxTokens),
    temperature: data.get(#temperature, or: $value.temperature),
    systemPrompt: data.get(#systemPrompt, or: $value.systemPrompt),
    enableAudioTranscription: data.get(
      #enableAudioTranscription,
      or: $value.enableAudioTranscription,
    ),
    enableSpeechToText: data.get(
      #enableSpeechToText,
      or: $value.enableSpeechToText,
    ),
    sttModel: data.get(#sttModel, or: $value.sttModel),
    enableImageProcessing: data.get(
      #enableImageProcessing,
      or: $value.enableImageProcessing,
    ),
    enableFileProcessing: data.get(
      #enableFileProcessing,
      or: $value.enableFileProcessing,
    ),
    maxFileSizeBytes: data.get(#maxFileSizeBytes, or: $value.maxFileSizeBytes),
    allowedFileTypes: data.get(#allowedFileTypes, or: $value.allowedFileTypes),
    allowedImageTypes: data.get(
      #allowedImageTypes,
      or: $value.allowedImageTypes,
    ),
    allowedAudioTypes: data.get(
      #allowedAudioTypes,
      or: $value.allowedAudioTypes,
    ),
    maxRecordingDurationSeconds: data.get(
      #maxRecordingDurationSeconds,
      or: $value.maxRecordingDurationSeconds,
    ),
    enableOutputCaching: data.get(
      #enableOutputCaching,
      or: $value.enableOutputCaching,
    ),
    maxCachedOutputs: data.get(#maxCachedOutputs, or: $value.maxCachedOutputs),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  ConfigurationCopyWith<$R2, Configuration, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ConfigurationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

