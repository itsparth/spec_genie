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
  static String _$apiKey(Configuration v) => v.apiKey;
  static const Field<Configuration, String> _f$apiKey = Field(
    'apiKey',
    _$apiKey,
    opt: true,
    def: '',
  );
  static String? _$baseUrl(Configuration v) => v.baseUrl;
  static const Field<Configuration, String> _f$baseUrl = Field(
    'baseUrl',
    _$baseUrl,
    opt: true,
  );
  static String _$modelName(Configuration v) => v.modelName;
  static const Field<Configuration, String> _f$modelName = Field(
    'modelName',
    _$modelName,
  );

  @override
  final MappableFields<Configuration> fields = const {
    #id: _f$id,
    #apiKey: _f$apiKey,
    #baseUrl: _f$baseUrl,
    #modelName: _f$modelName,
  };

  static Configuration _instantiate(DecodingData data) {
    return Configuration(
      id: data.dec(_f$id),
      apiKey: data.dec(_f$apiKey),
      baseUrl: data.dec(_f$baseUrl),
      modelName: data.dec(_f$modelName),
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
  $R call({int? id, String? apiKey, String? baseUrl, String? modelName});
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
  $R call({
    int? id,
    String? apiKey,
    Object? baseUrl = $none,
    String? modelName,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (apiKey != null) #apiKey: apiKey,
      if (baseUrl != $none) #baseUrl: baseUrl,
      if (modelName != null) #modelName: modelName,
    }),
  );
  @override
  Configuration $make(CopyWithData data) => Configuration(
    id: data.get(#id, or: $value.id),
    apiKey: data.get(#apiKey, or: $value.apiKey),
    baseUrl: data.get(#baseUrl, or: $value.baseUrl),
    modelName: data.get(#modelName, or: $value.modelName),
  );

  @override
  ConfigurationCopyWith<$R2, Configuration, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ConfigurationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

