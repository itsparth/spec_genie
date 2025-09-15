// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode_output.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModeOutputCollection on Isar {
  IsarCollection<ModeOutput> get modeOutputs => this.collection();
}

const ModeOutputSchema = CollectionSchema(
  name: r'ModeOutput',
  id: -877966663311795141,
  properties: {
    r'accessCount': PropertySchema(
      id: 0,
      name: r'accessCount',
      type: IsarType.long,
    ),
    r'ageInHours': PropertySchema(
      id: 1,
      name: r'ageInHours',
      type: IsarType.long,
    ),
    r'ageInMinutes': PropertySchema(
      id: 2,
      name: r'ageInMinutes',
      type: IsarType.long,
    ),
    r'cacheEfficiency': PropertySchema(
      id: 3,
      name: r'cacheEfficiency',
      type: IsarType.double,
    ),
    r'cacheExpiry': PropertySchema(
      id: 4,
      name: r'cacheExpiry',
      type: IsarType.dateTime,
    ),
    r'cacheSavings': PropertySchema(
      id: 5,
      name: r'cacheSavings',
      type: IsarType.double,
    ),
    r'checksum': PropertySchema(
      id: 6,
      name: r'checksum',
      type: IsarType.string,
    ),
    r'estimatedCost': PropertySchema(
      id: 7,
      name: r'estimatedCost',
      type: IsarType.double,
    ),
    r'formattedTime': PropertySchema(
      id: 8,
      name: r'formattedTime',
      type: IsarType.string,
    ),
    r'generatedAt': PropertySchema(
      id: 9,
      name: r'generatedAt',
      type: IsarType.dateTime,
    ),
    r'inputMessageIds': PropertySchema(
      id: 10,
      name: r'inputMessageIds',
      type: IsarType.stringList,
    ),
    r'inputTokens': PropertySchema(
      id: 11,
      name: r'inputTokens',
      type: IsarType.long,
    ),
    r'isExpired': PropertySchema(
      id: 12,
      name: r'isExpired',
      type: IsarType.bool,
    ),
    r'isSubstantial': PropertySchema(
      id: 13,
      name: r'isSubstantial',
      type: IsarType.bool,
    ),
    r'lastAccessedAt': PropertySchema(
      id: 14,
      name: r'lastAccessedAt',
      type: IsarType.dateTime,
    ),
    r'maxTokens': PropertySchema(
      id: 15,
      name: r'maxTokens',
      type: IsarType.long,
    ),
    r'metadata': PropertySchema(
      id: 16,
      name: r'metadata',
      type: IsarType.object,
      target: r'ModeOutputMetadata',
    ),
    r'modeName': PropertySchema(
      id: 17,
      name: r'modeName',
      type: IsarType.string,
    ),
    r'output': PropertySchema(
      id: 18,
      name: r'output',
      type: IsarType.string,
    ),
    r'outputLength': PropertySchema(
      id: 19,
      name: r'outputLength',
      type: IsarType.long,
    ),
    r'outputTokens': PropertySchema(
      id: 20,
      name: r'outputTokens',
      type: IsarType.long,
    ),
    r'outputWordCount': PropertySchema(
      id: 21,
      name: r'outputWordCount',
      type: IsarType.long,
    ),
    r'preview': PropertySchema(
      id: 22,
      name: r'preview',
      type: IsarType.string,
    ),
    r'processingModel': PropertySchema(
      id: 23,
      name: r'processingModel',
      type: IsarType.string,
    ),
    r'processingTimeMs': PropertySchema(
      id: 24,
      name: r'processingTimeMs',
      type: IsarType.long,
    ),
    r'shouldCleanup': PropertySchema(
      id: 25,
      name: r'shouldCleanup',
      type: IsarType.bool,
    ),
    r'systemPrompt': PropertySchema(
      id: 26,
      name: r'systemPrompt',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 27,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'temperature': PropertySchema(
      id: 28,
      name: r'temperature',
      type: IsarType.double,
    ),
    r'threadId': PropertySchema(
      id: 29,
      name: r'threadId',
      type: IsarType.string,
    ),
    r'version': PropertySchema(
      id: 30,
      name: r'version',
      type: IsarType.string,
    )
  },
  estimateSize: _modeOutputEstimateSize,
  serialize: _modeOutputSerialize,
  deserialize: _modeOutputDeserialize,
  deserializeProp: _modeOutputDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ModeOutputMetadata': ModeOutputMetadataSchema},
  getId: _modeOutputGetId,
  getLinks: _modeOutputGetLinks,
  attach: _modeOutputAttach,
  version: '3.3.0-dev.2',
);

int _modeOutputEstimateSize(
  ModeOutput object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.checksum.length * 3;
  bytesCount += 3 + object.formattedTime.length * 3;
  bytesCount += 3 + object.inputMessageIds.length * 3;
  {
    for (var i = 0; i < object.inputMessageIds.length; i++) {
      final value = object.inputMessageIds[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.metadata;
    if (value != null) {
      bytesCount += 3 +
          ModeOutputMetadataSchema.estimateSize(
              value, allOffsets[ModeOutputMetadata]!, allOffsets);
    }
  }
  bytesCount += 3 + object.modeName.length * 3;
  bytesCount += 3 + object.output.length * 3;
  bytesCount += 3 + object.preview.length * 3;
  {
    final value = object.processingModel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.systemPrompt.length * 3;
  {
    final list = object.tags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.threadId.length * 3;
  {
    final value = object.version;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _modeOutputSerialize(
  ModeOutput object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accessCount);
  writer.writeLong(offsets[1], object.ageInHours);
  writer.writeLong(offsets[2], object.ageInMinutes);
  writer.writeDouble(offsets[3], object.cacheEfficiency);
  writer.writeDateTime(offsets[4], object.cacheExpiry);
  writer.writeDouble(offsets[5], object.cacheSavings);
  writer.writeString(offsets[6], object.checksum);
  writer.writeDouble(offsets[7], object.estimatedCost);
  writer.writeString(offsets[8], object.formattedTime);
  writer.writeDateTime(offsets[9], object.generatedAt);
  writer.writeStringList(offsets[10], object.inputMessageIds);
  writer.writeLong(offsets[11], object.inputTokens);
  writer.writeBool(offsets[12], object.isExpired);
  writer.writeBool(offsets[13], object.isSubstantial);
  writer.writeDateTime(offsets[14], object.lastAccessedAt);
  writer.writeLong(offsets[15], object.maxTokens);
  writer.writeObject<ModeOutputMetadata>(
    offsets[16],
    allOffsets,
    ModeOutputMetadataSchema.serialize,
    object.metadata,
  );
  writer.writeString(offsets[17], object.modeName);
  writer.writeString(offsets[18], object.output);
  writer.writeLong(offsets[19], object.outputLength);
  writer.writeLong(offsets[20], object.outputTokens);
  writer.writeLong(offsets[21], object.outputWordCount);
  writer.writeString(offsets[22], object.preview);
  writer.writeString(offsets[23], object.processingModel);
  writer.writeLong(offsets[24], object.processingTimeMs);
  writer.writeBool(offsets[25], object.shouldCleanup);
  writer.writeString(offsets[26], object.systemPrompt);
  writer.writeStringList(offsets[27], object.tags);
  writer.writeDouble(offsets[28], object.temperature);
  writer.writeString(offsets[29], object.threadId);
  writer.writeString(offsets[30], object.version);
}

ModeOutput _modeOutputDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModeOutput(
    accessCount: reader.readLongOrNull(offsets[0]) ?? 0,
    checksum: reader.readStringOrNull(offsets[6]) ?? '',
    generatedAt: reader.readDateTimeOrNull(offsets[9]),
    id: id,
    inputMessageIds: reader.readStringList(offsets[10]) ?? const [],
    inputTokens: reader.readLongOrNull(offsets[11]) ?? 0,
    lastAccessedAt: reader.readDateTimeOrNull(offsets[14]),
    metadata: reader.readObjectOrNull<ModeOutputMetadata>(
      offsets[16],
      ModeOutputMetadataSchema.deserialize,
      allOffsets,
    ),
    modeName: reader.readStringOrNull(offsets[17]) ?? '',
    output: reader.readStringOrNull(offsets[18]) ?? '',
    outputTokens: reader.readLongOrNull(offsets[20]) ?? 0,
    systemPrompt: reader.readStringOrNull(offsets[26]) ?? '',
    threadId: reader.readStringOrNull(offsets[29]) ?? '',
  );
  return object;
}

P _modeOutputDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringList(offset) ?? const []) as P;
    case 11:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readObjectOrNull<ModeOutputMetadata>(
        offset,
        ModeOutputMetadataSchema.deserialize,
        allOffsets,
      )) as P;
    case 17:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 18:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 21:
      return (reader.readLong(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readLongOrNull(offset)) as P;
    case 25:
      return (reader.readBool(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 27:
      return (reader.readStringList(offset)) as P;
    case 28:
      return (reader.readDoubleOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modeOutputGetId(ModeOutput object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _modeOutputGetLinks(ModeOutput object) {
  return [];
}

void _modeOutputAttach(IsarCollection<dynamic> col, Id id, ModeOutput object) {}

extension ModeOutputQueryWhereSort
    on QueryBuilder<ModeOutput, ModeOutput, QWhere> {
  QueryBuilder<ModeOutput, ModeOutput, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModeOutputQueryWhere
    on QueryBuilder<ModeOutput, ModeOutput, QWhereClause> {
  QueryBuilder<ModeOutput, ModeOutput, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterWhereClause> idBetween(
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

extension ModeOutputQueryFilter
    on QueryBuilder<ModeOutput, ModeOutput, QFilterCondition> {
  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      accessCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      accessCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accessCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      accessCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accessCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      accessCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accessCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> ageInHoursEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ageInHours',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      ageInHoursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ageInHours',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      ageInHoursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ageInHours',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> ageInHoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ageInHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      ageInMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ageInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      ageInMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ageInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      ageInMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ageInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      ageInMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ageInMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheEfficiencyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheEfficiency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheEfficiencyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cacheEfficiency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheEfficiencyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cacheEfficiency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheEfficiencyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cacheEfficiency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cacheExpiry',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cacheExpiry',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheExpiryEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheExpiryGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cacheExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheExpiryLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cacheExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheExpiryBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cacheExpiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheSavingsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheSavings',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheSavingsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cacheSavings',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheSavingsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cacheSavings',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      cacheSavingsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cacheSavings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> checksumEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checksum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      checksumGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checksum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> checksumLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checksum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> checksumBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checksum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      checksumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checksum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> checksumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checksum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> checksumContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checksum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> checksumMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checksum',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      checksumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checksum',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      checksumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checksum',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      estimatedCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      estimatedCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      estimatedCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      estimatedCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      formattedTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      formattedTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      formattedTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      formattedTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      formattedTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      formattedTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      formattedTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      formattedTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      formattedTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedTime',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      formattedTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedTime',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      generatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generatedAt',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      generatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generatedAt',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      generatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      generatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      generatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      generatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inputMessageIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inputMessageIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inputMessageIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inputMessageIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inputMessageIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inputMessageIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inputMessageIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inputMessageIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inputMessageIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inputMessageIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inputMessageIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inputMessageIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inputMessageIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inputMessageIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inputMessageIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputMessageIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inputMessageIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputTokensEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inputTokens',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputTokensGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inputTokens',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputTokensLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inputTokens',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      inputTokensBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inputTokens',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> isExpiredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isExpired',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      isSubstantialEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSubstantial',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      lastAccessedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastAccessedAt',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      lastAccessedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastAccessedAt',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      lastAccessedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastAccessedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      lastAccessedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastAccessedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      lastAccessedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastAccessedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      lastAccessedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastAccessedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      maxTokensIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxTokens',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      maxTokensIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxTokens',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> maxTokensEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxTokens',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      maxTokensGreaterThan(
    int? value, {
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> maxTokensLessThan(
    int? value, {
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> maxTokensBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> metadataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'metadata',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      metadataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'metadata',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> modeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      modeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> modeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> modeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      modeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> modeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> modeNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> modeNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      modeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modeName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      modeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modeName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> outputEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'output',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> outputGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'output',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> outputLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'output',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> outputBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'output',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> outputStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'output',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> outputEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'output',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> outputContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'output',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> outputMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'output',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> outputIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'output',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'output',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputLengthEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outputLength',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputLengthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outputLength',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputLengthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outputLength',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outputLength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputTokensEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outputTokens',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputTokensGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outputTokens',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputTokensLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outputTokens',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputTokensBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outputTokens',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputWordCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outputWordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputWordCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outputWordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputWordCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outputWordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      outputWordCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outputWordCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> previewEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      previewGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> previewLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> previewBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preview',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> previewStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> previewEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> previewContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> previewMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preview',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> previewIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preview',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      previewIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preview',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'processingModel',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'processingModel',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'processingModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'processingModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processingModel',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'processingModel',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingTimeMsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'processingTimeMs',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingTimeMsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'processingTimeMs',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingTimeMsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processingTimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingTimeMsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'processingTimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingTimeMsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'processingTimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      processingTimeMsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'processingTimeMs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      shouldCleanupEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shouldCleanup',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      systemPromptContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemPrompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      systemPromptMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemPrompt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      systemPromptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemPrompt',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      systemPromptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemPrompt',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      temperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      temperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      temperatureEqualTo(
    double? value, {
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      temperatureGreaterThan(
    double? value, {
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      temperatureLessThan(
    double? value, {
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      temperatureBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> threadIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'threadId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      threadIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'threadId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> threadIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'threadId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> threadIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'threadId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      threadIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'threadId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> threadIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'threadId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> threadIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'threadId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> threadIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'threadId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      threadIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'threadId',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      threadIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'threadId',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> versionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      versionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> versionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      versionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> versionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> versionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> versionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> versionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> versionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> versionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'version',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> versionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition>
      versionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'version',
        value: '',
      ));
    });
  }
}

extension ModeOutputQueryObject
    on QueryBuilder<ModeOutput, ModeOutput, QFilterCondition> {
  QueryBuilder<ModeOutput, ModeOutput, QAfterFilterCondition> metadata(
      FilterQuery<ModeOutputMetadata> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'metadata');
    });
  }
}

extension ModeOutputQueryLinks
    on QueryBuilder<ModeOutput, ModeOutput, QFilterCondition> {}

extension ModeOutputQuerySortBy
    on QueryBuilder<ModeOutput, ModeOutput, QSortBy> {
  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByAccessCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessCount', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByAccessCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessCount', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByAgeInHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageInHours', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByAgeInHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageInHours', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByAgeInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageInMinutes', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByAgeInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageInMinutes', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByCacheEfficiency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheEfficiency', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy>
      sortByCacheEfficiencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheEfficiency', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByCacheExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheExpiry', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByCacheExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheExpiry', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByCacheSavings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheSavings', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByCacheSavingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheSavings', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByChecksum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checksum', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByChecksumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checksum', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByEstimatedCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCost', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByEstimatedCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCost', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByFormattedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedTime', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByFormattedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedTime', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByInputTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputTokens', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByInputTokensDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputTokens', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByIsExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByIsExpiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByIsSubstantial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubstantial', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByIsSubstantialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubstantial', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByLastAccessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessedAt', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy>
      sortByLastAccessedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessedAt', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByMaxTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTokens', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByMaxTokensDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTokens', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByModeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeName', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByModeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeName', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByOutput() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'output', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByOutputDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'output', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByOutputLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputLength', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByOutputLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputLength', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByOutputTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputTokens', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByOutputTokensDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputTokens', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByOutputWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputWordCount', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy>
      sortByOutputWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputWordCount', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByPreview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preview', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByPreviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preview', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByProcessingModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingModel', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy>
      sortByProcessingModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingModel', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByProcessingTimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTimeMs', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy>
      sortByProcessingTimeMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTimeMs', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByShouldCleanup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shouldCleanup', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByShouldCleanupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shouldCleanup', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortBySystemPrompt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPrompt', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortBySystemPromptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPrompt', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByThreadId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threadId', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByThreadIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threadId', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension ModeOutputQuerySortThenBy
    on QueryBuilder<ModeOutput, ModeOutput, QSortThenBy> {
  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByAccessCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessCount', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByAccessCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessCount', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByAgeInHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageInHours', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByAgeInHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageInHours', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByAgeInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageInMinutes', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByAgeInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageInMinutes', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByCacheEfficiency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheEfficiency', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy>
      thenByCacheEfficiencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheEfficiency', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByCacheExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheExpiry', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByCacheExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheExpiry', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByCacheSavings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheSavings', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByCacheSavingsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheSavings', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByChecksum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checksum', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByChecksumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checksum', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByEstimatedCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCost', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByEstimatedCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCost', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByFormattedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedTime', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByFormattedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedTime', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByInputTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputTokens', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByInputTokensDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputTokens', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByIsExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByIsExpiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByIsSubstantial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubstantial', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByIsSubstantialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubstantial', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByLastAccessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessedAt', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy>
      thenByLastAccessedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessedAt', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByMaxTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTokens', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByMaxTokensDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxTokens', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByModeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeName', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByModeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeName', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByOutput() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'output', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByOutputDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'output', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByOutputLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputLength', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByOutputLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputLength', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByOutputTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputTokens', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByOutputTokensDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputTokens', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByOutputWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputWordCount', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy>
      thenByOutputWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputWordCount', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByPreview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preview', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByPreviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preview', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByProcessingModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingModel', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy>
      thenByProcessingModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingModel', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByProcessingTimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTimeMs', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy>
      thenByProcessingTimeMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingTimeMs', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByShouldCleanup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shouldCleanup', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByShouldCleanupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shouldCleanup', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenBySystemPrompt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPrompt', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenBySystemPromptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPrompt', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByThreadId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threadId', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByThreadIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threadId', Sort.desc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension ModeOutputQueryWhereDistinct
    on QueryBuilder<ModeOutput, ModeOutput, QDistinct> {
  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByAccessCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accessCount');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByAgeInHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ageInHours');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByAgeInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ageInMinutes');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByCacheEfficiency() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cacheEfficiency');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByCacheExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cacheExpiry');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByCacheSavings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cacheSavings');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByChecksum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checksum', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByEstimatedCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedCost');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByFormattedTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generatedAt');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByInputMessageIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inputMessageIds');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByInputTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inputTokens');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByIsExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isExpired');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByIsSubstantial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSubstantial');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByLastAccessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastAccessedAt');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByMaxTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxTokens');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByModeName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByOutput(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'output', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByOutputLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outputLength');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByOutputTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outputTokens');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByOutputWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outputWordCount');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByPreview(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preview', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByProcessingModel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processingModel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByProcessingTimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processingTimeMs');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByShouldCleanup() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shouldCleanup');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctBySystemPrompt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemPrompt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature');
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByThreadId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'threadId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModeOutput, ModeOutput, QDistinct> distinctByVersion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version', caseSensitive: caseSensitive);
    });
  }
}

extension ModeOutputQueryProperty
    on QueryBuilder<ModeOutput, ModeOutput, QQueryProperty> {
  QueryBuilder<ModeOutput, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ModeOutput, int, QQueryOperations> accessCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accessCount');
    });
  }

  QueryBuilder<ModeOutput, int, QQueryOperations> ageInHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ageInHours');
    });
  }

  QueryBuilder<ModeOutput, int, QQueryOperations> ageInMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ageInMinutes');
    });
  }

  QueryBuilder<ModeOutput, double, QQueryOperations> cacheEfficiencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cacheEfficiency');
    });
  }

  QueryBuilder<ModeOutput, DateTime?, QQueryOperations> cacheExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cacheExpiry');
    });
  }

  QueryBuilder<ModeOutput, double, QQueryOperations> cacheSavingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cacheSavings');
    });
  }

  QueryBuilder<ModeOutput, String, QQueryOperations> checksumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checksum');
    });
  }

  QueryBuilder<ModeOutput, double, QQueryOperations> estimatedCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedCost');
    });
  }

  QueryBuilder<ModeOutput, String, QQueryOperations> formattedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedTime');
    });
  }

  QueryBuilder<ModeOutput, DateTime?, QQueryOperations> generatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generatedAt');
    });
  }

  QueryBuilder<ModeOutput, List<String>, QQueryOperations>
      inputMessageIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inputMessageIds');
    });
  }

  QueryBuilder<ModeOutput, int, QQueryOperations> inputTokensProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inputTokens');
    });
  }

  QueryBuilder<ModeOutput, bool, QQueryOperations> isExpiredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isExpired');
    });
  }

  QueryBuilder<ModeOutput, bool, QQueryOperations> isSubstantialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSubstantial');
    });
  }

  QueryBuilder<ModeOutput, DateTime?, QQueryOperations>
      lastAccessedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastAccessedAt');
    });
  }

  QueryBuilder<ModeOutput, int?, QQueryOperations> maxTokensProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxTokens');
    });
  }

  QueryBuilder<ModeOutput, ModeOutputMetadata?, QQueryOperations>
      metadataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metadata');
    });
  }

  QueryBuilder<ModeOutput, String, QQueryOperations> modeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modeName');
    });
  }

  QueryBuilder<ModeOutput, String, QQueryOperations> outputProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'output');
    });
  }

  QueryBuilder<ModeOutput, int, QQueryOperations> outputLengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outputLength');
    });
  }

  QueryBuilder<ModeOutput, int, QQueryOperations> outputTokensProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outputTokens');
    });
  }

  QueryBuilder<ModeOutput, int, QQueryOperations> outputWordCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outputWordCount');
    });
  }

  QueryBuilder<ModeOutput, String, QQueryOperations> previewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preview');
    });
  }

  QueryBuilder<ModeOutput, String?, QQueryOperations>
      processingModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processingModel');
    });
  }

  QueryBuilder<ModeOutput, int?, QQueryOperations> processingTimeMsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processingTimeMs');
    });
  }

  QueryBuilder<ModeOutput, bool, QQueryOperations> shouldCleanupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shouldCleanup');
    });
  }

  QueryBuilder<ModeOutput, String, QQueryOperations> systemPromptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemPrompt');
    });
  }

  QueryBuilder<ModeOutput, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<ModeOutput, double?, QQueryOperations> temperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature');
    });
  }

  QueryBuilder<ModeOutput, String, QQueryOperations> threadIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'threadId');
    });
  }

  QueryBuilder<ModeOutput, String?, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ModeOutputMetadataSchema = Schema(
  name: r'ModeOutputMetadata',
  id: 2880950366826628479,
  properties: {
    r'cacheExpiry': PropertySchema(
      id: 0,
      name: r'cacheExpiry',
      type: IsarType.dateTime,
    ),
    r'maxTokens': PropertySchema(
      id: 1,
      name: r'maxTokens',
      type: IsarType.long,
    ),
    r'processingModel': PropertySchema(
      id: 2,
      name: r'processingModel',
      type: IsarType.string,
    ),
    r'processingTimeMs': PropertySchema(
      id: 3,
      name: r'processingTimeMs',
      type: IsarType.long,
    ),
    r'tags': PropertySchema(
      id: 4,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'temperature': PropertySchema(
      id: 5,
      name: r'temperature',
      type: IsarType.double,
    ),
    r'version': PropertySchema(
      id: 6,
      name: r'version',
      type: IsarType.string,
    )
  },
  estimateSize: _modeOutputMetadataEstimateSize,
  serialize: _modeOutputMetadataSerialize,
  deserialize: _modeOutputMetadataDeserialize,
  deserializeProp: _modeOutputMetadataDeserializeProp,
);

int _modeOutputMetadataEstimateSize(
  ModeOutputMetadata object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.processingModel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.version;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _modeOutputMetadataSerialize(
  ModeOutputMetadata object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.cacheExpiry);
  writer.writeLong(offsets[1], object.maxTokens);
  writer.writeString(offsets[2], object.processingModel);
  writer.writeLong(offsets[3], object.processingTimeMs);
  writer.writeStringList(offsets[4], object.tags);
  writer.writeDouble(offsets[5], object.temperature);
  writer.writeString(offsets[6], object.version);
}

ModeOutputMetadata _modeOutputMetadataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModeOutputMetadata(
    cacheExpiry: reader.readDateTimeOrNull(offsets[0]),
    maxTokens: reader.readLongOrNull(offsets[1]),
    processingModel: reader.readStringOrNull(offsets[2]),
    processingTimeMs: reader.readLongOrNull(offsets[3]),
    tags: reader.readStringList(offsets[4]),
    temperature: reader.readDoubleOrNull(offsets[5]),
    version: reader.readStringOrNull(offsets[6]),
  );
  return object;
}

P _modeOutputMetadataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringList(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ModeOutputMetadataQueryFilter
    on QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QFilterCondition> {
  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      cacheExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cacheExpiry',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      cacheExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cacheExpiry',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      cacheExpiryEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      cacheExpiryGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cacheExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      cacheExpiryLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cacheExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      cacheExpiryBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cacheExpiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      maxTokensIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxTokens',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      maxTokensIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxTokens',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      maxTokensEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxTokens',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      maxTokensGreaterThan(
    int? value, {
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

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      maxTokensLessThan(
    int? value, {
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

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      maxTokensBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'processingModel',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'processingModel',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'processingModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'processingModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'processingModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processingModel',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'processingModel',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingTimeMsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'processingTimeMs',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingTimeMsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'processingTimeMs',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingTimeMsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processingTimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingTimeMsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'processingTimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingTimeMsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'processingTimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      processingTimeMsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'processingTimeMs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      temperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      temperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      temperatureEqualTo(
    double? value, {
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

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      temperatureGreaterThan(
    double? value, {
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

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      temperatureLessThan(
    double? value, {
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

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      temperatureBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'version',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: '',
      ));
    });
  }

  QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QAfterFilterCondition>
      versionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'version',
        value: '',
      ));
    });
  }
}

extension ModeOutputMetadataQueryObject
    on QueryBuilder<ModeOutputMetadata, ModeOutputMetadata, QFilterCondition> {}
