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
    r'apiKey': PropertySchema(
      id: 0,
      name: r'apiKey',
      type: IsarType.string,
    ),
    r'baseUrl': PropertySchema(
      id: 1,
      name: r'baseUrl',
      type: IsarType.string,
    ),
    r'effectiveBaseUrl': PropertySchema(
      id: 2,
      name: r'effectiveBaseUrl',
      type: IsarType.string,
    ),
    r'hasValidApiKey': PropertySchema(
      id: 3,
      name: r'hasValidApiKey',
      type: IsarType.bool,
    ),
    r'isCustomEndpoint': PropertySchema(
      id: 4,
      name: r'isCustomEndpoint',
      type: IsarType.bool,
    ),
    r'isValid': PropertySchema(
      id: 5,
      name: r'isValid',
      type: IsarType.bool,
    ),
    r'modelName': PropertySchema(
      id: 6,
      name: r'modelName',
      type: IsarType.string,
    ),
    r'transcribeAudioFirst': PropertySchema(
      id: 7,
      name: r'transcribeAudioFirst',
      type: IsarType.bool,
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
  bytesCount += 3 + object.apiKey.length * 3;
  {
    final value = object.baseUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.effectiveBaseUrl.length * 3;
  bytesCount += 3 + object.modelName.length * 3;
  return bytesCount;
}

void _configurationSerialize(
  Configuration object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.apiKey);
  writer.writeString(offsets[1], object.baseUrl);
  writer.writeString(offsets[2], object.effectiveBaseUrl);
  writer.writeBool(offsets[3], object.hasValidApiKey);
  writer.writeBool(offsets[4], object.isCustomEndpoint);
  writer.writeBool(offsets[5], object.isValid);
  writer.writeString(offsets[6], object.modelName);
  writer.writeBool(offsets[7], object.transcribeAudioFirst);
}

Configuration _configurationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Configuration(
    apiKey: reader.readStringOrNull(offsets[0]) ?? '',
    baseUrl: reader.readStringOrNull(offsets[1]),
    id: id,
    modelName: reader.readStringOrNull(offsets[6]) ?? 'gpt-4',
    transcribeAudioFirst: reader.readBoolOrNull(offsets[7]) ?? true,
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
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? 'gpt-4') as P;
    case 7:
      return (reader.readBoolOrNull(offset) ?? true) as P;
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
      apiKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      apiKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      apiKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      apiKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apiKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      apiKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      apiKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      apiKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      apiKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apiKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      apiKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      apiKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseUrl',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseUrl',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'baseUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      baseUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'baseUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveBaseUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveBaseUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveBaseUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveBaseUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveBaseUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveBaseUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'effectiveBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveBaseUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'effectiveBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveBaseUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'effectiveBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveBaseUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'effectiveBaseUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveBaseUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveBaseUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      effectiveBaseUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'effectiveBaseUrl',
        value: '',
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
      isCustomEndpointEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCustomEndpoint',
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
      modelNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      modelNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      modelNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      modelNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modelName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      modelNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      modelNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      modelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      modelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      modelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelName',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      modelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modelName',
        value: '',
      ));
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterFilterCondition>
      transcribeAudioFirstEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transcribeAudioFirst',
        value: value,
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
  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEffectiveBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveBaseUrl', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByEffectiveBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveBaseUrl', Sort.desc);
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
      sortByIsCustomEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomEndpoint', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByIsCustomEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomEndpoint', Sort.desc);
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

  QueryBuilder<Configuration, Configuration, QAfterSortBy> sortByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByTranscribeAudioFirst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transcribeAudioFirst', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      sortByTranscribeAudioFirstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transcribeAudioFirst', Sort.desc);
    });
  }
}

extension ConfigurationQuerySortThenBy
    on QueryBuilder<Configuration, Configuration, QSortThenBy> {
  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEffectiveBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveBaseUrl', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByEffectiveBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveBaseUrl', Sort.desc);
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
      thenByIsCustomEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomEndpoint', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByIsCustomEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomEndpoint', Sort.desc);
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

  QueryBuilder<Configuration, Configuration, QAfterSortBy> thenByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByTranscribeAudioFirst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transcribeAudioFirst', Sort.asc);
    });
  }

  QueryBuilder<Configuration, Configuration, QAfterSortBy>
      thenByTranscribeAudioFirstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transcribeAudioFirst', Sort.desc);
    });
  }
}

extension ConfigurationQueryWhereDistinct
    on QueryBuilder<Configuration, Configuration, QDistinct> {
  QueryBuilder<Configuration, Configuration, QDistinct> distinctByApiKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apiKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct> distinctByBaseUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByEffectiveBaseUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveBaseUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByHasValidApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasValidApiKey');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByIsCustomEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCustomEndpoint');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct> distinctByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isValid');
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct> distinctByModelName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Configuration, Configuration, QDistinct>
      distinctByTranscribeAudioFirst() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transcribeAudioFirst');
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

  QueryBuilder<Configuration, String, QQueryOperations> apiKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apiKey');
    });
  }

  QueryBuilder<Configuration, String?, QQueryOperations> baseUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseUrl');
    });
  }

  QueryBuilder<Configuration, String, QQueryOperations>
      effectiveBaseUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveBaseUrl');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations> hasValidApiKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasValidApiKey');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations>
      isCustomEndpointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCustomEndpoint');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations> isValidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isValid');
    });
  }

  QueryBuilder<Configuration, String, QQueryOperations> modelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelName');
    });
  }

  QueryBuilder<Configuration, bool, QQueryOperations>
      transcribeAudioFirstProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transcribeAudioFirst');
    });
  }
}
