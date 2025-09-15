// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetConfigurationCollection on Isar {
  IsarCollection<Configuration> get configurations => this.collection();
}

const ConfigurationSchema = CollectionSchema(
  name: r'Configuration',
  id: -1441735911786269971,
  properties: {
    r'allowedAudioTypes': PropertySchema(
      id: 0,
      name: r'allowedAudioTypes',
      type: IsarType.stringList,
    ),
    r'allowedFileTypes': PropertySchema(
      id: 1,
      name: r'allowedFileTypes',
      type: IsarType.stringList,
    ),
    r'allowedImageTypes': PropertySchema(
      id: 2,
      name: r'allowedImageTypes',
      type: IsarType.stringList,
    ),
    r'availableSttModels': PropertySchema(
      id: 3,
      name: r'availableSttModels',
      type: IsarType.stringList,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'defaultModel': PropertySchema(
      id: 5,
      name: r'defaultModel',
      type: IsarType.string,
    ),
    r'effectiveSttModel': PropertySchema(
      id: 6,
      name: r'effectiveSttModel',
      type: IsarType.string,
    ),
    r'enableAudioTranscription': PropertySchema(
      id: 7,
      name: r'enableAudioTranscription',
      type: IsarType.bool,
    ),
    r'enableFileProcessing': PropertySchema(
      id: 8,
      name: r'enableFileProcessing',
      type: IsarType.bool,
    ),
    r'enableImageProcessing': PropertySchema(
      id: 9,
      name: r'enableImageProcessing',
      type: IsarType.bool,
    ),
    r'enableOutputCaching': PropertySchema(
      id: 10,
      name: r'enableOutputCaching',
      type: IsarType.bool,
    ),
    r'enableSpeechToText': PropertySchema(
      id: 11,
      name: r'enableSpeechToText',
      type: IsarType.bool,
    ),
    r'hasSttModel': PropertySchema(
      id: 12,
      name: r'hasSttModel',
      type: IsarType.bool,
    ),
    r'hasValidApiKey': PropertySchema(
      id: 13,
      name: r'hasValidApiKey',
      type: IsarType.bool,
    ),
    r'isSttEnabled': PropertySchema(
      id: 14,
      name: r'isSttEnabled',
      type: IsarType.bool,
    ),
    r'isValid': PropertySchema(
      id: 15,
      name: r'isValid',
      type: IsarType.bool,
    ),
    r'maxCachedOutputs': PropertySchema(
      id: 16,
      name: r'maxCachedOutputs',
      type: IsarType.long,
    ),
    r'maxFileSizeBytes': PropertySchema(
      id: 17,
      name: r'maxFileSizeBytes',
      type: IsarType.long,
    ),
    r'maxFileSizeMB': PropertySchema(
      id: 18,
      name: r'maxFileSizeMB',
      type: IsarType.double,
    ),
    r'maxRecordingDurationSeconds': PropertySchema(
      id: 19,
      name: r'maxRecordingDurationSeconds',
      type: IsarType.long,
    ),
    r'maxTokens': PropertySchema(
      id: 20,
      name: r'maxTokens',
      type: IsarType.long,
    ),
    r'openAIApiKey': PropertySchema(
      id: 21,
      name: r'openAIApiKey',
      type: IsarType.string,
    ),
    r'sttModel': PropertySchema(
      id: 22,
      name: r'sttModel',
      type: IsarType.string,
    ),
    r'systemPrompt': PropertySchema(
      id: 23,
      name: r'systemPrompt',
      type: IsarType.string,
    ),
    r'temperature': PropertySchema(
      id: 24,
      name: r'temperature',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 25,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _configurationEstimateSize,
  serialize: _configurationSerialize,
  deserialize: _configurationDeserialize,
  deserializeProp: _configurationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _configurationGetId,
  getLinks: _configurationGetLinks,
  attach: _configurationAttach,
  version: '3.3.0-dev.2',
);

int _configurationEstimateSize(
  Configuration object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.allowedAudioTypes.length * 3;
  {
    for (var i = 0; i < object.allowedAudioTypes.length; i++) {
      final value = object.allowedAudioTypes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.allowedFileTypes.length * 3;
  {
    for (var i = 0; i < object.allowedFileTypes.length; i++) {
      final value = object.allowedFileTypes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.allowedImageTypes.length * 3;
  {
    for (var i = 0; i < object.allowedImageTypes.length; i++) {
      final value = object.allowedImageTypes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.availableSttModels.length * 3;
  {
    for (var i = 0; i < object.availableSttModels.length; i++) {
      final value = object.availableSttModels[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.defaultModel.length * 3;
  bytesCount += 3 + object.effectiveSttModel.length * 3;
  bytesCount += 3 + object.openAIApiKey.length * 3;
  {
    final value = object.sttModel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.systemPrompt.length * 3;
  return bytesCount;
}

void _configurationSerialize(
  Configuration object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.allowedAudioTypes);
  writer.writeStringList(offsets[1], object.allowedFileTypes);
  writer.writeStringList(offsets[2], object.allowedImageTypes);
  writer.writeStringList(offsets[3], object.availableSttModels);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.defaultModel);
  writer.writeString(offsets[6], object.effectiveSttModel);
  writer.writeBool(offsets[7], object.enableAudioTranscription);
  writer.writeBool(offsets[8], object.enableFileProcessing);
  writer.writeBool(offsets[9], object.enableImageProcessing);
  writer.writeBool(offsets[10], object.enableOutputCaching);
  writer.writeBool(offsets[11], object.enableSpeechToText);
  writer.writeBool(offsets[12], object.hasSttModel);
  writer.writeBool(offsets[13], object.hasValidApiKey);
  writer.writeBool(offsets[14], object.isSttEnabled);
  writer.writeBool(offsets[15], object.isValid);
  writer.writeLong(offsets[16], object.maxCachedOutputs);
  writer.writeLong(offsets[17], object.maxFileSizeBytes);
  writer.writeDouble(offsets[18], object.maxFileSizeMB);
  writer.writeLong(offsets[19], object.maxRecordingDurationSeconds);
  writer.writeLong(offsets[20], object.maxTokens);
  writer.writeString(offsets[21], object.openAIApiKey);
  writer.writeString(offsets[22], object.sttModel);
  writer.writeString(offsets[23], object.systemPrompt);
  writer.writeDouble(offsets[24], object.temperature);
  writer.writeDateTime(offsets[25], object.updatedAt);
}

Configuration _configurationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Configuration(
    allowedAudioTypes:
        reader.readStringList(offsets[0]) ?? const ['mp3', 'wav', 'm4a', 'aac'],
    allowedFileTypes: reader.readStringList(offsets[1]) ??
        const ['pdf', 'txt', 'md', 'doc', 'docx'],
    allowedImageTypes: reader.readStringList(offsets[2]) ??
        const ['jpg', 'jpeg', 'png', 'gif', 'bmp'],
    createdAt: reader.readDateTimeOrNull(offsets[4]),
    defaultModel: reader.readStringOrNull(offsets[5]) ?? 'gpt-4',
    enableAudioTranscription: reader.readBoolOrNull(offsets[7]) ?? true,
    enableFileProcessing: reader.readBoolOrNull(offsets[8]) ?? true,
    enableImageProcessing: reader.readBoolOrNull(offsets[9]) ?? true,
    enableOutputCaching: reader.readBoolOrNull(offsets[10]) ?? true,
    enableSpeechToText: reader.readBoolOrNull(offsets[11]) ?? true,
    id: id,
    maxCachedOutputs: reader.readLongOrNull(offsets[16]) ?? 100,
    maxFileSizeBytes: reader.readLongOrNull(offsets[17]) ?? 10485760,
    maxRecordingDurationSeconds: reader.readLongOrNull(offsets[19]) ?? 30,
    maxTokens: reader.readLongOrNull(offsets[20]) ?? 4000,
    openAIApiKey: reader.readStringOrNull(offsets[21]) ?? '',
    sttModel: reader.readStringOrNull(offsets[22]),
    systemPrompt: reader.readStringOrNull(offsets[23]) ??
        'You are a helpful assistant that processes user inputs and generates comprehensive outputs.',
    temperature: reader.readDoubleOrNull(offsets[24]) ?? 0.7,
    updatedAt: reader.readDateTimeOrNull(offsets[25]),
  );
  return object;
}

P _configurationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ??
          const ['mp3', 'wav', 'm4a', 'aac']) as P;
    case 1:
      return (reader.readStringList(offset) ??
          const ['pdf', 'txt', 'md', 'doc', 'docx']) as P;
    case 2:
      return (reader.readStringList(offset) ??
          const ['jpg', 'jpeg', 'png', 'gif', 'bmp']) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset) ?? 'gpt-4') as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 8:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 9:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 10:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 11:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset) ?? 100) as P;
    case 17:
      return (reader.readLongOrNull(offset) ?? 10485760) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset) ?? 30) as P;
    case 20:
      return (reader.readLongOrNull(offset) ?? 4000) as P;
    case 21:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset) ??
              'You are a helpful assistant that processes user inputs and generates comprehensive outputs.')
          as P;
    case 24:
      return (reader.readDoubleOrNull(offset) ?? 0.7) as P;
    case 25:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _configurationGetId(Configuration object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _configurationGetLinks(Configuration object) {
  return [];
}

void _configurationAttach(
    IsarCollection<dynamic> col, Id id, Configuration object) {}

extension ConfigurationQueryWhereSort
    on QueryBuilder<Configuration, Configuration, QWhere> {
  QueryBuilder<Configuration, Configuration, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ConfigurationQueryWhere
    on QueryBuilder<Configuration, Configuration, QWhereClause> {
  QueryBuilder<Configuration, Configuration, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ConfigurationQueryFilter
    on QueryBuilder<Configuration, Configuration, QFilterCondition> {
  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowedAudioTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowedAudioTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowedAudioTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowedAudioTypes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'allowedAudioTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'allowedAudioTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'allowedAudioTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'allowedAudioTypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowedAudioTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'allowedAudioTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedAudioTypes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedAudioTypes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedAudioTypes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedAudioTypes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedAudioTypes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedAudioTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedAudioTypes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowedFileTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowedFileTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowedFileTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowedFileTypes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'allowedFileTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'allowedFileTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'allowedFileTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'allowedFileTypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowedFileTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'allowedFileTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedFileTypes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedFileTypes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedFileTypes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedFileTypes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedFileTypes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedFileTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedFileTypes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowedImageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowedImageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowedImageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowedImageTypes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'allowedImageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'allowedImageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'allowedImageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'allowedImageTypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowedImageTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'allowedImageTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedImageTypes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedImageTypes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedImageTypes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedImageTypes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedImageTypes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      allowedImageTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allowedImageTypes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'availableSttModels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'availableSttModels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'availableSttModels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'availableSttModels',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'availableSttModels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'availableSttModels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'availableSttModels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'availableSttModels',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'availableSttModels',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'availableSttModels',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableSttModels',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableSttModels',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableSttModels',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableSttModels',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableSttModels',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      availableSttModelsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableSttModels',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      defaultModelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      defaultModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defaultModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      defaultModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defaultModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      defaultModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defaultModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      defaultModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'defaultModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      defaultModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'defaultModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      defaultModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defaultModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      defaultModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defaultModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      defaultModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultModel',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      defaultModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defaultModel',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveSttModelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveSttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveSttModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveSttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveSttModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveSttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveSttModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveSttModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveSttModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'effectiveSttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveSttModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'effectiveSttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveSttModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'effectiveSttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveSttModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'effectiveSttModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveSttModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveSttModel',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveSttModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'effectiveSttModel',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      enableAudioTranscriptionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableAudioTranscription',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      enableFileProcessingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableFileProcessing',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      enableImageProcessingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableImageProcessing',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      enableOutputCachingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableOutputCaching',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      enableSpeechToTextEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableSpeechToText',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      hasSttModelEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasSttModel',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      hasValidApiKeyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasValidApiKey',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      isSttEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSttEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      isValidEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isValid',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxCachedOutputsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxCachedOutputs',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxCachedOutputsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxCachedOutputs',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxCachedOutputsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxCachedOutputs',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxCachedOutputsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxCachedOutputs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxFileSizeBytesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxFileSizeBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxFileSizeBytesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxFileSizeBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxFileSizeBytesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxFileSizeBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxFileSizeBytesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxFileSizeBytes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxFileSizeMBEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxFileSizeMB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxFileSizeMBGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxFileSizeMB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxFileSizeMBLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxFileSizeMB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxFileSizeMBBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxFileSizeMB',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxRecordingDurationSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxRecordingDurationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxRecordingDurationSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxRecordingDurationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxRecordingDurationSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxRecordingDurationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxRecordingDurationSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxRecordingDurationSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxTokensEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxTokens',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxTokensGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxTokens',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxTokensLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxTokens',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      maxTokensBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxTokens',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      openAIApiKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openAIApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      openAIApiKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'openAIApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      openAIApiKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'openAIApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      openAIApiKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'openAIApiKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      openAIApiKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'openAIApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      openAIApiKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'openAIApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      openAIApiKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'openAIApiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      openAIApiKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'openAIApiKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      openAIApiKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openAIApiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      openAIApiKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'openAIApiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sttModel',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sttModel',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sttModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sttModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sttModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sttModel',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      sttModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sttModel',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      systemPromptEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemPrompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      systemPromptGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemPrompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      systemPromptLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemPrompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      systemPromptBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemPrompt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      systemPromptStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemPrompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      systemPromptEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemPrompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      systemPromptContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemPrompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      systemPromptMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemPrompt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      systemPromptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemPrompt',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      systemPromptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemPrompt',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      temperatureEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      temperatureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      temperatureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      temperatureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ConfigurationQueryObject
    on QueryBuilder<Configuration, Configuration, QFilterCondition> {}

extension ConfigurationQueryLinks
    on QueryBuilder<Configuration, Configuration, QFilterCondition> {}

extension ConfigurationQuerySortBy
    on QueryBuilder<Configuration, Configuration, QSortBy> {
  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByDefaultModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultModel', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByDefaultModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultModel', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEffectiveSttModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveSttModel', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEffectiveSttModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveSttModel', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEnableAudioTranscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAudioTranscription', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEnableAudioTranscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAudioTranscription', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEnableFileProcessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableFileProcessing', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEnableFileProcessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableFileProcessing', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEnableImageProcessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableImageProcessing', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEnableImageProcessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableImageProcessing', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEnableOutputCaching() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableOutputCaching', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEnableOutputCachingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableOutputCaching', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEnableSpeechToText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSpeechToText', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEnableSpeechToTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSpeechToText', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByHasSttModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSttModel', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByHasSttModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSttModel', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByHasValidApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasValidApiKey', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByHasValidApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasValidApiKey', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByIsSttEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSttEnabled', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByIsSttEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSttEnabled', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByIsValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByMaxCachedOutputs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCachedOutputs', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByMaxCachedOutputsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCachedOutputs', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByMaxFileSizeBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxFileSizeBytes', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByMaxFileSizeBytesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxFileSizeBytes', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByMaxFileSizeMB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxFileSizeMB', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByMaxFileSizeMBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxFileSizeMB', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByMaxRecordingDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRecordingDurationSeconds', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByMaxRecordingDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRecordingDurationSeconds', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByMaxTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTokens', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByMaxTokensDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTokens', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByOpenAIApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openAIApiKey', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByOpenAIApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openAIApiKey', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortBySttModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sttModel', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortBySttModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sttModel', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortBySystemPrompt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPrompt', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortBySystemPromptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPrompt', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ConfigurationQuerySortThenBy
    on QueryBuilder<Configuration, Configuration, QSortThenBy> {
  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByDefaultModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultModel', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByDefaultModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultModel', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEffectiveSttModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveSttModel', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEffectiveSttModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveSttModel', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEnableAudioTranscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAudioTranscription', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEnableAudioTranscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableAudioTranscription', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEnableFileProcessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableFileProcessing', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEnableFileProcessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableFileProcessing', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEnableImageProcessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableImageProcessing', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEnableImageProcessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableImageProcessing', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEnableOutputCaching() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableOutputCaching', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEnableOutputCachingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableOutputCaching', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEnableSpeechToText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSpeechToText', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEnableSpeechToTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSpeechToText', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByHasSttModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSttModel', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByHasSttModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSttModel', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByHasValidApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasValidApiKey', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByHasValidApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasValidApiKey', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByIsSttEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSttEnabled', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByIsSttEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSttEnabled', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByIsValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByMaxCachedOutputs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCachedOutputs', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByMaxCachedOutputsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCachedOutputs', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByMaxFileSizeBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxFileSizeBytes', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByMaxFileSizeBytesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxFileSizeBytes', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByMaxFileSizeMB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxFileSizeMB', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByMaxFileSizeMBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxFileSizeMB', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByMaxRecordingDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRecordingDurationSeconds', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByMaxRecordingDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRecordingDurationSeconds', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByMaxTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTokens', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByMaxTokensDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTokens', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByOpenAIApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openAIApiKey', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByOpenAIApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openAIApiKey', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenBySttModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sttModel', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenBySttModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sttModel', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenBySystemPrompt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPrompt', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenBySystemPromptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPrompt', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ConfigurationQueryWhereDistinct
    on QueryBuilder<Configuration, Configuration, QDistinct> {
  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByAllowedAudioTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowedAudioTypes');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByAllowedFileTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowedFileTypes');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByAllowedImageTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowedImageTypes');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByAvailableSttModels() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'availableSttModels');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct> distinctByDefaultModel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultModel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByEffectiveSttModel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveSttModel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByEnableAudioTranscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableAudioTranscription');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByEnableFileProcessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableFileProcessing');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByEnableImageProcessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableImageProcessing');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByEnableOutputCaching() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableOutputCaching');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByEnableSpeechToText() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableSpeechToText');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByHasSttModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasSttModel');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByHasValidApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasValidApiKey');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByIsSttEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSttEnabled');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct> distinctByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isValid');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByMaxCachedOutputs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxCachedOutputs');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByMaxFileSizeBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxFileSizeBytes');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByMaxFileSizeMB() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxFileSizeMB');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByMaxRecordingDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxRecordingDurationSeconds');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct> distinctByMaxTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxTokens');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct> distinctByOpenAIApiKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openAIApiKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct> distinctBySttModel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sttModel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct> distinctBySystemPrompt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemPrompt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ConfigurationQueryProperty
    on QueryBuilder<Configuration, Configuration, QQueryProperty> {
  QueryBuilder<Configuration, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Configuration, List<String>, QQueryOperations>
      allowedAudioTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowedAudioTypes');
    });
  }

  QueryBuilder<Configuration, List<String>, QQueryOperations>
      allowedFileTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowedFileTypes');
    });
  }

  QueryBuilder<Configuration, List<String>, QQueryOperations>
      allowedImageTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowedImageTypes');
    });
  }

  QueryBuilder<Configuration, List<String>, QQueryOperations>
      availableSttModelsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'availableSttModels');
    });
  }

  QueryBuilder<Configuration, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Configuration, String, QQueryOperations> defaultModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultModel');
    });
  }

  QueryBuilder<Configuration, String, QQueryOperations>
      effectiveSttModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveSttModel');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations>
      enableAudioTranscriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableAudioTranscription');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations>
      enableFileProcessingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableFileProcessing');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations>
      enableImageProcessingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableImageProcessing');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations>
      enableOutputCachingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableOutputCaching');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations>
      enableSpeechToTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableSpeechToText');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations> hasSttModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasSttModel');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations> hasValidApiKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasValidApiKey');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations> isSttEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSttEnabled');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations> isValidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isValid');
    });
  }

  QueryBuilder<Configuration, int, QQueryOperations>
      maxCachedOutputsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxCachedOutputs');
    });
  }

  QueryBuilder<Configuration, int, QQueryOperations>
      maxFileSizeBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxFileSizeBytes');
    });
  }

  QueryBuilder<Configuration, double, QQueryOperations>
      maxFileSizeMBProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxFileSizeMB');
    });
  }

  QueryBuilder<Configuration, int, QQueryOperations>
      maxRecordingDurationSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxRecordingDurationSeconds');
    });
  }

  QueryBuilder<Configuration, int, QQueryOperations> maxTokensProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxTokens');
    });
  }

  QueryBuilder<Configuration, String, QQueryOperations> openAIApiKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openAIApiKey');
    });
  }

  QueryBuilder<Configuration, String?, QQueryOperations> sttModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sttModel');
    });
  }

  QueryBuilder<Configuration, String, QQueryOperations> systemPromptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemPrompt');
    });
  }

  QueryBuilder<Configuration, double, QQueryOperations> temperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature');
    });
  }

  QueryBuilder<Configuration, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
