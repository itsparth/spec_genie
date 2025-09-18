// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ThreadsTable extends Threads with TableInfo<$ThreadsTable, ThreadRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ThreadsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'threads';
  @override
  VerificationContext validateIntegrity(Insertable<ThreadRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ThreadRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ThreadRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ThreadsTable createAlias(String alias) {
    return $ThreadsTable(attachedDatabase, alias);
  }
}

class ThreadRow extends DataClass implements Insertable<ThreadRow> {
  final int id;
  final String name;

  /// Stored as ISO-8601 string underneath (build.yaml) but surfaced as DateTime
  final DateTime createdAt;
  const ThreadRow(
      {required this.id, required this.name, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ThreadsCompanion toCompanion(bool nullToAbsent) {
    return ThreadsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory ThreadRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ThreadRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ThreadRow copyWith({int? id, String? name, DateTime? createdAt}) => ThreadRow(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
      );
  ThreadRow copyWithCompanion(ThreadsCompanion data) {
    return ThreadRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ThreadRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThreadRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class ThreadsCompanion extends UpdateCompanion<ThreadRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  const ThreadsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ThreadsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    required DateTime createdAt,
  }) : createdAt = Value(createdAt);
  static Insertable<ThreadRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ThreadsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<DateTime>? createdAt}) {
    return ThreadsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThreadsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ModesTable extends Modes with TableInfo<$ModesTable, ModeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _promptMeta = const VerificationMeta('prompt');
  @override
  late final GeneratedColumn<String> prompt = GeneratedColumn<String>(
      'prompt', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isEditableMeta =
      const VerificationMeta('isEditable');
  @override
  late final GeneratedColumn<bool> isEditable = GeneratedColumn<bool>(
      'is_editable', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_editable" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, name, prompt, isEditable];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'modes';
  @override
  VerificationContext validateIntegrity(Insertable<ModeRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('prompt')) {
      context.handle(_promptMeta,
          prompt.isAcceptableOrUnknown(data['prompt']!, _promptMeta));
    } else if (isInserting) {
      context.missing(_promptMeta);
    }
    if (data.containsKey('is_editable')) {
      context.handle(
          _isEditableMeta,
          isEditable.isAcceptableOrUnknown(
              data['is_editable']!, _isEditableMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ModeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModeRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      prompt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}prompt'])!,
      isEditable: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_editable'])!,
    );
  }

  @override
  $ModesTable createAlias(String alias) {
    return $ModesTable(attachedDatabase, alias);
  }
}

class ModeRow extends DataClass implements Insertable<ModeRow> {
  final int id;
  final String name;
  final String prompt;
  final bool isEditable;
  const ModeRow(
      {required this.id,
      required this.name,
      required this.prompt,
      required this.isEditable});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['prompt'] = Variable<String>(prompt);
    map['is_editable'] = Variable<bool>(isEditable);
    return map;
  }

  ModesCompanion toCompanion(bool nullToAbsent) {
    return ModesCompanion(
      id: Value(id),
      name: Value(name),
      prompt: Value(prompt),
      isEditable: Value(isEditable),
    );
  }

  factory ModeRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModeRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      prompt: serializer.fromJson<String>(json['prompt']),
      isEditable: serializer.fromJson<bool>(json['isEditable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'prompt': serializer.toJson<String>(prompt),
      'isEditable': serializer.toJson<bool>(isEditable),
    };
  }

  ModeRow copyWith({int? id, String? name, String? prompt, bool? isEditable}) =>
      ModeRow(
        id: id ?? this.id,
        name: name ?? this.name,
        prompt: prompt ?? this.prompt,
        isEditable: isEditable ?? this.isEditable,
      );
  ModeRow copyWithCompanion(ModesCompanion data) {
    return ModeRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      prompt: data.prompt.present ? data.prompt.value : this.prompt,
      isEditable:
          data.isEditable.present ? data.isEditable.value : this.isEditable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModeRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('prompt: $prompt, ')
          ..write('isEditable: $isEditable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, prompt, isEditable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModeRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.prompt == this.prompt &&
          other.isEditable == this.isEditable);
}

class ModesCompanion extends UpdateCompanion<ModeRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> prompt;
  final Value<bool> isEditable;
  const ModesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.prompt = const Value.absent(),
    this.isEditable = const Value.absent(),
  });
  ModesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String prompt,
    this.isEditable = const Value.absent(),
  })  : name = Value(name),
        prompt = Value(prompt);
  static Insertable<ModeRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? prompt,
    Expression<bool>? isEditable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (prompt != null) 'prompt': prompt,
      if (isEditable != null) 'is_editable': isEditable,
    });
  }

  ModesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? prompt,
      Value<bool>? isEditable}) {
    return ModesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      prompt: prompt ?? this.prompt,
      isEditable: isEditable ?? this.isEditable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (prompt.present) {
      map['prompt'] = Variable<String>(prompt.value);
    }
    if (isEditable.present) {
      map['is_editable'] = Variable<bool>(isEditable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('prompt: $prompt, ')
          ..write('isEditable: $isEditable')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, TagRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isEditableMeta =
      const VerificationMeta('isEditable');
  @override
  late final GeneratedColumn<bool> isEditable = GeneratedColumn<bool>(
      'is_editable', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_editable" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, name, description, isEditable];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<TagRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_editable')) {
      context.handle(
          _isEditableMeta,
          isEditable.isAcceptableOrUnknown(
              data['is_editable']!, _isEditableMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isEditable: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_editable'])!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class TagRow extends DataClass implements Insertable<TagRow> {
  final int id;
  final String name;
  final String description;
  final bool isEditable;
  const TagRow(
      {required this.id,
      required this.name,
      required this.description,
      required this.isEditable});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['is_editable'] = Variable<bool>(isEditable);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      isEditable: Value(isEditable),
    );
  }

  factory TagRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      isEditable: serializer.fromJson<bool>(json['isEditable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'isEditable': serializer.toJson<bool>(isEditable),
    };
  }

  TagRow copyWith(
          {int? id, String? name, String? description, bool? isEditable}) =>
      TagRow(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        isEditable: isEditable ?? this.isEditable,
      );
  TagRow copyWithCompanion(TagsCompanion data) {
    return TagRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      isEditable:
          data.isEditable.present ? data.isEditable.value : this.isEditable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isEditable: $isEditable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, isEditable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.isEditable == this.isEditable);
}

class TagsCompanion extends UpdateCompanion<TagRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<bool> isEditable;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isEditable = const Value.absent(),
  });
  TagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.isEditable = const Value.absent(),
  })  : name = Value(name),
        description = Value(description);
  static Insertable<TagRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isEditable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isEditable != null) 'is_editable': isEditable,
    });
  }

  TagsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<bool>? isEditable}) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isEditable: isEditable ?? this.isEditable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isEditable.present) {
      map['is_editable'] = Variable<bool>(isEditable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isEditable: $isEditable')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages
    with TableInfo<$MessagesTable, MessageRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _threadIdMeta =
      const VerificationMeta('threadId');
  @override
  late final GeneratedColumn<int> threadId = GeneratedColumn<int>(
      'thread_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES threads (id) ON DELETE CASCADE'));
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _messageTypeMeta =
      const VerificationMeta('messageType');
  @override
  late final GeneratedColumn<String> messageType = GeneratedColumn<String>(
      'message_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _fileDataMeta =
      const VerificationMeta('fileData');
  @override
  late final GeneratedColumn<Uint8List> fileData = GeneratedColumn<Uint8List>(
      'file_data', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _mimeTypeMeta =
      const VerificationMeta('mimeType');
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
      'mime_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transcriptMeta =
      const VerificationMeta('transcript');
  @override
  late final GeneratedColumn<String> transcript = GeneratedColumn<String>(
      'transcript', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fileNameMeta =
      const VerificationMeta('fileName');
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
      'file_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        threadId,
        body,
        timestamp,
        messageType,
        description,
        fileData,
        mimeType,
        transcript,
        fileName
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages';
  @override
  VerificationContext validateIntegrity(Insertable<MessageRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('thread_id')) {
      context.handle(_threadIdMeta,
          threadId.isAcceptableOrUnknown(data['thread_id']!, _threadIdMeta));
    } else if (isInserting) {
      context.missing(_threadIdMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('message_type')) {
      context.handle(
          _messageTypeMeta,
          messageType.isAcceptableOrUnknown(
              data['message_type']!, _messageTypeMeta));
    } else if (isInserting) {
      context.missing(_messageTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('file_data')) {
      context.handle(_fileDataMeta,
          fileData.isAcceptableOrUnknown(data['file_data']!, _fileDataMeta));
    }
    if (data.containsKey('mime_type')) {
      context.handle(_mimeTypeMeta,
          mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta));
    }
    if (data.containsKey('transcript')) {
      context.handle(
          _transcriptMeta,
          transcript.isAcceptableOrUnknown(
              data['transcript']!, _transcriptMeta));
    }
    if (data.containsKey('file_name')) {
      context.handle(_fileNameMeta,
          fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MessageRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessageRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      threadId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}thread_id'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      messageType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message_type'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      fileData: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}file_data']),
      mimeType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mime_type']),
      transcript: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transcript']),
      fileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name']),
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class MessageRow extends DataClass implements Insertable<MessageRow> {
  final int id;
  final int threadId;
  final String body;
  final DateTime timestamp;
  final String messageType;
  final String description;
  final Uint8List? fileData;
  final String? mimeType;
  final String? transcript;
  final String? fileName;
  const MessageRow(
      {required this.id,
      required this.threadId,
      required this.body,
      required this.timestamp,
      required this.messageType,
      required this.description,
      this.fileData,
      this.mimeType,
      this.transcript,
      this.fileName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['thread_id'] = Variable<int>(threadId);
    map['body'] = Variable<String>(body);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['message_type'] = Variable<String>(messageType);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || fileData != null) {
      map['file_data'] = Variable<Uint8List>(fileData);
    }
    if (!nullToAbsent || mimeType != null) {
      map['mime_type'] = Variable<String>(mimeType);
    }
    if (!nullToAbsent || transcript != null) {
      map['transcript'] = Variable<String>(transcript);
    }
    if (!nullToAbsent || fileName != null) {
      map['file_name'] = Variable<String>(fileName);
    }
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      threadId: Value(threadId),
      body: Value(body),
      timestamp: Value(timestamp),
      messageType: Value(messageType),
      description: Value(description),
      fileData: fileData == null && nullToAbsent
          ? const Value.absent()
          : Value(fileData),
      mimeType: mimeType == null && nullToAbsent
          ? const Value.absent()
          : Value(mimeType),
      transcript: transcript == null && nullToAbsent
          ? const Value.absent()
          : Value(transcript),
      fileName: fileName == null && nullToAbsent
          ? const Value.absent()
          : Value(fileName),
    );
  }

  factory MessageRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessageRow(
      id: serializer.fromJson<int>(json['id']),
      threadId: serializer.fromJson<int>(json['threadId']),
      body: serializer.fromJson<String>(json['body']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      messageType: serializer.fromJson<String>(json['messageType']),
      description: serializer.fromJson<String>(json['description']),
      fileData: serializer.fromJson<Uint8List?>(json['fileData']),
      mimeType: serializer.fromJson<String?>(json['mimeType']),
      transcript: serializer.fromJson<String?>(json['transcript']),
      fileName: serializer.fromJson<String?>(json['fileName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'threadId': serializer.toJson<int>(threadId),
      'body': serializer.toJson<String>(body),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'messageType': serializer.toJson<String>(messageType),
      'description': serializer.toJson<String>(description),
      'fileData': serializer.toJson<Uint8List?>(fileData),
      'mimeType': serializer.toJson<String?>(mimeType),
      'transcript': serializer.toJson<String?>(transcript),
      'fileName': serializer.toJson<String?>(fileName),
    };
  }

  MessageRow copyWith(
          {int? id,
          int? threadId,
          String? body,
          DateTime? timestamp,
          String? messageType,
          String? description,
          Value<Uint8List?> fileData = const Value.absent(),
          Value<String?> mimeType = const Value.absent(),
          Value<String?> transcript = const Value.absent(),
          Value<String?> fileName = const Value.absent()}) =>
      MessageRow(
        id: id ?? this.id,
        threadId: threadId ?? this.threadId,
        body: body ?? this.body,
        timestamp: timestamp ?? this.timestamp,
        messageType: messageType ?? this.messageType,
        description: description ?? this.description,
        fileData: fileData.present ? fileData.value : this.fileData,
        mimeType: mimeType.present ? mimeType.value : this.mimeType,
        transcript: transcript.present ? transcript.value : this.transcript,
        fileName: fileName.present ? fileName.value : this.fileName,
      );
  MessageRow copyWithCompanion(MessagesCompanion data) {
    return MessageRow(
      id: data.id.present ? data.id.value : this.id,
      threadId: data.threadId.present ? data.threadId.value : this.threadId,
      body: data.body.present ? data.body.value : this.body,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      messageType:
          data.messageType.present ? data.messageType.value : this.messageType,
      description:
          data.description.present ? data.description.value : this.description,
      fileData: data.fileData.present ? data.fileData.value : this.fileData,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      transcript:
          data.transcript.present ? data.transcript.value : this.transcript,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MessageRow(')
          ..write('id: $id, ')
          ..write('threadId: $threadId, ')
          ..write('body: $body, ')
          ..write('timestamp: $timestamp, ')
          ..write('messageType: $messageType, ')
          ..write('description: $description, ')
          ..write('fileData: $fileData, ')
          ..write('mimeType: $mimeType, ')
          ..write('transcript: $transcript, ')
          ..write('fileName: $fileName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      threadId,
      body,
      timestamp,
      messageType,
      description,
      $driftBlobEquality.hash(fileData),
      mimeType,
      transcript,
      fileName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageRow &&
          other.id == this.id &&
          other.threadId == this.threadId &&
          other.body == this.body &&
          other.timestamp == this.timestamp &&
          other.messageType == this.messageType &&
          other.description == this.description &&
          $driftBlobEquality.equals(other.fileData, this.fileData) &&
          other.mimeType == this.mimeType &&
          other.transcript == this.transcript &&
          other.fileName == this.fileName);
}

class MessagesCompanion extends UpdateCompanion<MessageRow> {
  final Value<int> id;
  final Value<int> threadId;
  final Value<String> body;
  final Value<DateTime> timestamp;
  final Value<String> messageType;
  final Value<String> description;
  final Value<Uint8List?> fileData;
  final Value<String?> mimeType;
  final Value<String?> transcript;
  final Value<String?> fileName;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.threadId = const Value.absent(),
    this.body = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.messageType = const Value.absent(),
    this.description = const Value.absent(),
    this.fileData = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.transcript = const Value.absent(),
    this.fileName = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.id = const Value.absent(),
    required int threadId,
    this.body = const Value.absent(),
    required DateTime timestamp,
    required String messageType,
    this.description = const Value.absent(),
    this.fileData = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.transcript = const Value.absent(),
    this.fileName = const Value.absent(),
  })  : threadId = Value(threadId),
        timestamp = Value(timestamp),
        messageType = Value(messageType);
  static Insertable<MessageRow> custom({
    Expression<int>? id,
    Expression<int>? threadId,
    Expression<String>? body,
    Expression<DateTime>? timestamp,
    Expression<String>? messageType,
    Expression<String>? description,
    Expression<Uint8List>? fileData,
    Expression<String>? mimeType,
    Expression<String>? transcript,
    Expression<String>? fileName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (threadId != null) 'thread_id': threadId,
      if (body != null) 'body': body,
      if (timestamp != null) 'timestamp': timestamp,
      if (messageType != null) 'message_type': messageType,
      if (description != null) 'description': description,
      if (fileData != null) 'file_data': fileData,
      if (mimeType != null) 'mime_type': mimeType,
      if (transcript != null) 'transcript': transcript,
      if (fileName != null) 'file_name': fileName,
    });
  }

  MessagesCompanion copyWith(
      {Value<int>? id,
      Value<int>? threadId,
      Value<String>? body,
      Value<DateTime>? timestamp,
      Value<String>? messageType,
      Value<String>? description,
      Value<Uint8List?>? fileData,
      Value<String?>? mimeType,
      Value<String?>? transcript,
      Value<String?>? fileName}) {
    return MessagesCompanion(
      id: id ?? this.id,
      threadId: threadId ?? this.threadId,
      body: body ?? this.body,
      timestamp: timestamp ?? this.timestamp,
      messageType: messageType ?? this.messageType,
      description: description ?? this.description,
      fileData: fileData ?? this.fileData,
      mimeType: mimeType ?? this.mimeType,
      transcript: transcript ?? this.transcript,
      fileName: fileName ?? this.fileName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (threadId.present) {
      map['thread_id'] = Variable<int>(threadId.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (messageType.present) {
      map['message_type'] = Variable<String>(messageType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (fileData.present) {
      map['file_data'] = Variable<Uint8List>(fileData.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (transcript.present) {
      map['transcript'] = Variable<String>(transcript.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('threadId: $threadId, ')
          ..write('body: $body, ')
          ..write('timestamp: $timestamp, ')
          ..write('messageType: $messageType, ')
          ..write('description: $description, ')
          ..write('fileData: $fileData, ')
          ..write('mimeType: $mimeType, ')
          ..write('transcript: $transcript, ')
          ..write('fileName: $fileName')
          ..write(')'))
        .toString();
  }
}

class $ModeOutputsTable extends ModeOutputs
    with TableInfo<$ModeOutputsTable, ModeOutputRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModeOutputsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _threadIdMeta =
      const VerificationMeta('threadId');
  @override
  late final GeneratedColumn<int> threadId = GeneratedColumn<int>(
      'thread_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES threads (id) ON DELETE CASCADE'));
  static const VerificationMeta _modeIdMeta = const VerificationMeta('modeId');
  @override
  late final GeneratedColumn<int> modeId = GeneratedColumn<int>(
      'mode_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES modes (id) ON DELETE CASCADE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, threadId, modeId, createdAt, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mode_outputs';
  @override
  VerificationContext validateIntegrity(Insertable<ModeOutputRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('thread_id')) {
      context.handle(_threadIdMeta,
          threadId.isAcceptableOrUnknown(data['thread_id']!, _threadIdMeta));
    } else if (isInserting) {
      context.missing(_threadIdMeta);
    }
    if (data.containsKey('mode_id')) {
      context.handle(_modeIdMeta,
          modeId.isAcceptableOrUnknown(data['mode_id']!, _modeIdMeta));
    } else if (isInserting) {
      context.missing(_modeIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ModeOutputRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModeOutputRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      threadId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}thread_id'])!,
      modeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mode_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
    );
  }

  @override
  $ModeOutputsTable createAlias(String alias) {
    return $ModeOutputsTable(attachedDatabase, alias);
  }
}

class ModeOutputRow extends DataClass implements Insertable<ModeOutputRow> {
  final int id;
  final int threadId;
  final int modeId;
  final DateTime createdAt;
  final String content;
  const ModeOutputRow(
      {required this.id,
      required this.threadId,
      required this.modeId,
      required this.createdAt,
      required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['thread_id'] = Variable<int>(threadId);
    map['mode_id'] = Variable<int>(modeId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['content'] = Variable<String>(content);
    return map;
  }

  ModeOutputsCompanion toCompanion(bool nullToAbsent) {
    return ModeOutputsCompanion(
      id: Value(id),
      threadId: Value(threadId),
      modeId: Value(modeId),
      createdAt: Value(createdAt),
      content: Value(content),
    );
  }

  factory ModeOutputRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModeOutputRow(
      id: serializer.fromJson<int>(json['id']),
      threadId: serializer.fromJson<int>(json['threadId']),
      modeId: serializer.fromJson<int>(json['modeId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'threadId': serializer.toJson<int>(threadId),
      'modeId': serializer.toJson<int>(modeId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'content': serializer.toJson<String>(content),
    };
  }

  ModeOutputRow copyWith(
          {int? id,
          int? threadId,
          int? modeId,
          DateTime? createdAt,
          String? content}) =>
      ModeOutputRow(
        id: id ?? this.id,
        threadId: threadId ?? this.threadId,
        modeId: modeId ?? this.modeId,
        createdAt: createdAt ?? this.createdAt,
        content: content ?? this.content,
      );
  ModeOutputRow copyWithCompanion(ModeOutputsCompanion data) {
    return ModeOutputRow(
      id: data.id.present ? data.id.value : this.id,
      threadId: data.threadId.present ? data.threadId.value : this.threadId,
      modeId: data.modeId.present ? data.modeId.value : this.modeId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModeOutputRow(')
          ..write('id: $id, ')
          ..write('threadId: $threadId, ')
          ..write('modeId: $modeId, ')
          ..write('createdAt: $createdAt, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, threadId, modeId, createdAt, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModeOutputRow &&
          other.id == this.id &&
          other.threadId == this.threadId &&
          other.modeId == this.modeId &&
          other.createdAt == this.createdAt &&
          other.content == this.content);
}

class ModeOutputsCompanion extends UpdateCompanion<ModeOutputRow> {
  final Value<int> id;
  final Value<int> threadId;
  final Value<int> modeId;
  final Value<DateTime> createdAt;
  final Value<String> content;
  const ModeOutputsCompanion({
    this.id = const Value.absent(),
    this.threadId = const Value.absent(),
    this.modeId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.content = const Value.absent(),
  });
  ModeOutputsCompanion.insert({
    this.id = const Value.absent(),
    required int threadId,
    required int modeId,
    required DateTime createdAt,
    required String content,
  })  : threadId = Value(threadId),
        modeId = Value(modeId),
        createdAt = Value(createdAt),
        content = Value(content);
  static Insertable<ModeOutputRow> custom({
    Expression<int>? id,
    Expression<int>? threadId,
    Expression<int>? modeId,
    Expression<DateTime>? createdAt,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (threadId != null) 'thread_id': threadId,
      if (modeId != null) 'mode_id': modeId,
      if (createdAt != null) 'created_at': createdAt,
      if (content != null) 'content': content,
    });
  }

  ModeOutputsCompanion copyWith(
      {Value<int>? id,
      Value<int>? threadId,
      Value<int>? modeId,
      Value<DateTime>? createdAt,
      Value<String>? content}) {
    return ModeOutputsCompanion(
      id: id ?? this.id,
      threadId: threadId ?? this.threadId,
      modeId: modeId ?? this.modeId,
      createdAt: createdAt ?? this.createdAt,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (threadId.present) {
      map['thread_id'] = Variable<int>(threadId.value);
    }
    if (modeId.present) {
      map['mode_id'] = Variable<int>(modeId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModeOutputsCompanion(')
          ..write('id: $id, ')
          ..write('threadId: $threadId, ')
          ..write('modeId: $modeId, ')
          ..write('createdAt: $createdAt, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $ConfigurationTableTable extends ConfigurationTable
    with TableInfo<$ConfigurationTableTable, ConfigurationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConfigurationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _apiKeyMeta = const VerificationMeta('apiKey');
  @override
  late final GeneratedColumn<String> apiKey = GeneratedColumn<String>(
      'api_key', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _baseUrlMeta =
      const VerificationMeta('baseUrl');
  @override
  late final GeneratedColumn<String> baseUrl = GeneratedColumn<String>(
      'base_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _modelNameMeta =
      const VerificationMeta('modelName');
  @override
  late final GeneratedColumn<String> modelName = GeneratedColumn<String>(
      'model_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, apiKey, baseUrl, modelName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'configuration_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ConfigurationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_key')) {
      context.handle(_apiKeyMeta,
          apiKey.isAcceptableOrUnknown(data['api_key']!, _apiKeyMeta));
    }
    if (data.containsKey('base_url')) {
      context.handle(_baseUrlMeta,
          baseUrl.isAcceptableOrUnknown(data['base_url']!, _baseUrlMeta));
    }
    if (data.containsKey('model_name')) {
      context.handle(_modelNameMeta,
          modelName.isAcceptableOrUnknown(data['model_name']!, _modelNameMeta));
    } else if (isInserting) {
      context.missing(_modelNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConfigurationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConfigurationTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      apiKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}api_key'])!,
      baseUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}base_url']),
      modelName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model_name'])!,
    );
  }

  @override
  $ConfigurationTableTable createAlias(String alias) {
    return $ConfigurationTableTable(attachedDatabase, alias);
  }
}

class ConfigurationTableData extends DataClass
    implements Insertable<ConfigurationTableData> {
  final int id;
  final String apiKey;
  final String? baseUrl;
  final String modelName;
  const ConfigurationTableData(
      {required this.id,
      required this.apiKey,
      this.baseUrl,
      required this.modelName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['api_key'] = Variable<String>(apiKey);
    if (!nullToAbsent || baseUrl != null) {
      map['base_url'] = Variable<String>(baseUrl);
    }
    map['model_name'] = Variable<String>(modelName);
    return map;
  }

  ConfigurationTableCompanion toCompanion(bool nullToAbsent) {
    return ConfigurationTableCompanion(
      id: Value(id),
      apiKey: Value(apiKey),
      baseUrl: baseUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(baseUrl),
      modelName: Value(modelName),
    );
  }

  factory ConfigurationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConfigurationTableData(
      id: serializer.fromJson<int>(json['id']),
      apiKey: serializer.fromJson<String>(json['apiKey']),
      baseUrl: serializer.fromJson<String?>(json['baseUrl']),
      modelName: serializer.fromJson<String>(json['modelName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiKey': serializer.toJson<String>(apiKey),
      'baseUrl': serializer.toJson<String?>(baseUrl),
      'modelName': serializer.toJson<String>(modelName),
    };
  }

  ConfigurationTableData copyWith(
          {int? id,
          String? apiKey,
          Value<String?> baseUrl = const Value.absent(),
          String? modelName}) =>
      ConfigurationTableData(
        id: id ?? this.id,
        apiKey: apiKey ?? this.apiKey,
        baseUrl: baseUrl.present ? baseUrl.value : this.baseUrl,
        modelName: modelName ?? this.modelName,
      );
  ConfigurationTableData copyWithCompanion(ConfigurationTableCompanion data) {
    return ConfigurationTableData(
      id: data.id.present ? data.id.value : this.id,
      apiKey: data.apiKey.present ? data.apiKey.value : this.apiKey,
      baseUrl: data.baseUrl.present ? data.baseUrl.value : this.baseUrl,
      modelName: data.modelName.present ? data.modelName.value : this.modelName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConfigurationTableData(')
          ..write('id: $id, ')
          ..write('apiKey: $apiKey, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('modelName: $modelName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, apiKey, baseUrl, modelName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConfigurationTableData &&
          other.id == this.id &&
          other.apiKey == this.apiKey &&
          other.baseUrl == this.baseUrl &&
          other.modelName == this.modelName);
}

class ConfigurationTableCompanion
    extends UpdateCompanion<ConfigurationTableData> {
  final Value<int> id;
  final Value<String> apiKey;
  final Value<String?> baseUrl;
  final Value<String> modelName;
  const ConfigurationTableCompanion({
    this.id = const Value.absent(),
    this.apiKey = const Value.absent(),
    this.baseUrl = const Value.absent(),
    this.modelName = const Value.absent(),
  });
  ConfigurationTableCompanion.insert({
    this.id = const Value.absent(),
    this.apiKey = const Value.absent(),
    this.baseUrl = const Value.absent(),
    required String modelName,
  }) : modelName = Value(modelName);
  static Insertable<ConfigurationTableData> custom({
    Expression<int>? id,
    Expression<String>? apiKey,
    Expression<String>? baseUrl,
    Expression<String>? modelName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiKey != null) 'api_key': apiKey,
      if (baseUrl != null) 'base_url': baseUrl,
      if (modelName != null) 'model_name': modelName,
    });
  }

  ConfigurationTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? apiKey,
      Value<String?>? baseUrl,
      Value<String>? modelName}) {
    return ConfigurationTableCompanion(
      id: id ?? this.id,
      apiKey: apiKey ?? this.apiKey,
      baseUrl: baseUrl ?? this.baseUrl,
      modelName: modelName ?? this.modelName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (apiKey.present) {
      map['api_key'] = Variable<String>(apiKey.value);
    }
    if (baseUrl.present) {
      map['base_url'] = Variable<String>(baseUrl.value);
    }
    if (modelName.present) {
      map['model_name'] = Variable<String>(modelName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfigurationTableCompanion(')
          ..write('id: $id, ')
          ..write('apiKey: $apiKey, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('modelName: $modelName')
          ..write(')'))
        .toString();
  }
}

class $MessageTagsTable extends MessageTags
    with TableInfo<$MessageTagsTable, MessageTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessageTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _messageIdMeta =
      const VerificationMeta('messageId');
  @override
  late final GeneratedColumn<int> messageId = GeneratedColumn<int>(
      'message_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES messages (id) ON DELETE CASCADE'));
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES tags (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [messageId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'message_tags';
  @override
  VerificationContext validateIntegrity(Insertable<MessageTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('message_id')) {
      context.handle(_messageIdMeta,
          messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta));
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {messageId, tagId};
  @override
  MessageTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessageTag(
      messageId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}message_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $MessageTagsTable createAlias(String alias) {
    return $MessageTagsTable(attachedDatabase, alias);
  }
}

class MessageTag extends DataClass implements Insertable<MessageTag> {
  final int messageId;
  final int tagId;
  const MessageTag({required this.messageId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['message_id'] = Variable<int>(messageId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  MessageTagsCompanion toCompanion(bool nullToAbsent) {
    return MessageTagsCompanion(
      messageId: Value(messageId),
      tagId: Value(tagId),
    );
  }

  factory MessageTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessageTag(
      messageId: serializer.fromJson<int>(json['messageId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'messageId': serializer.toJson<int>(messageId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  MessageTag copyWith({int? messageId, int? tagId}) => MessageTag(
        messageId: messageId ?? this.messageId,
        tagId: tagId ?? this.tagId,
      );
  MessageTag copyWithCompanion(MessageTagsCompanion data) {
    return MessageTag(
      messageId: data.messageId.present ? data.messageId.value : this.messageId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MessageTag(')
          ..write('messageId: $messageId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(messageId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageTag &&
          other.messageId == this.messageId &&
          other.tagId == this.tagId);
}

class MessageTagsCompanion extends UpdateCompanion<MessageTag> {
  final Value<int> messageId;
  final Value<int> tagId;
  final Value<int> rowid;
  const MessageTagsCompanion({
    this.messageId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MessageTagsCompanion.insert({
    required int messageId,
    required int tagId,
    this.rowid = const Value.absent(),
  })  : messageId = Value(messageId),
        tagId = Value(tagId);
  static Insertable<MessageTag> custom({
    Expression<int>? messageId,
    Expression<int>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (messageId != null) 'message_id': messageId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MessageTagsCompanion copyWith(
      {Value<int>? messageId, Value<int>? tagId, Value<int>? rowid}) {
    return MessageTagsCompanion(
      messageId: messageId ?? this.messageId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (messageId.present) {
      map['message_id'] = Variable<int>(messageId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageTagsCompanion(')
          ..write('messageId: $messageId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ThreadsTable threads = $ThreadsTable(this);
  late final $ModesTable modes = $ModesTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $ModeOutputsTable modeOutputs = $ModeOutputsTable(this);
  late final $ConfigurationTableTable configurationTable =
      $ConfigurationTableTable(this);
  late final $MessageTagsTable messageTags = $MessageTagsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        threads,
        modes,
        tags,
        messages,
        modeOutputs,
        configurationTable,
        messageTags
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('threads',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('messages', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('threads',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('mode_outputs', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('modes',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('mode_outputs', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('messages',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('message_tags', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('tags',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('message_tags', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$ThreadsTableCreateCompanionBuilder = ThreadsCompanion Function({
  Value<int> id,
  Value<String> name,
  required DateTime createdAt,
});
typedef $$ThreadsTableUpdateCompanionBuilder = ThreadsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdAt,
});

final class $$ThreadsTableReferences
    extends BaseReferences<_$AppDatabase, $ThreadsTable, ThreadRow> {
  $$ThreadsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MessagesTable, List<MessageRow>>
      _messagesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.messages,
          aliasName: $_aliasNameGenerator(db.threads.id, db.messages.threadId));

  $$MessagesTableProcessedTableManager get messagesRefs {
    final manager = $$MessagesTableTableManager($_db, $_db.messages)
        .filter((f) => f.threadId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_messagesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ModeOutputsTable, List<ModeOutputRow>>
      _modeOutputsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.modeOutputs,
              aliasName:
                  $_aliasNameGenerator(db.threads.id, db.modeOutputs.threadId));

  $$ModeOutputsTableProcessedTableManager get modeOutputsRefs {
    final manager = $$ModeOutputsTableTableManager($_db, $_db.modeOutputs)
        .filter((f) => f.threadId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_modeOutputsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ThreadsTableFilterComposer
    extends Composer<_$AppDatabase, $ThreadsTable> {
  $$ThreadsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> messagesRefs(
      Expression<bool> Function($$MessagesTableFilterComposer f) f) {
    final $$MessagesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.messages,
        getReferencedColumn: (t) => t.threadId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MessagesTableFilterComposer(
              $db: $db,
              $table: $db.messages,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> modeOutputsRefs(
      Expression<bool> Function($$ModeOutputsTableFilterComposer f) f) {
    final $$ModeOutputsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.modeOutputs,
        getReferencedColumn: (t) => t.threadId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModeOutputsTableFilterComposer(
              $db: $db,
              $table: $db.modeOutputs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ThreadsTableOrderingComposer
    extends Composer<_$AppDatabase, $ThreadsTable> {
  $$ThreadsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ThreadsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ThreadsTable> {
  $$ThreadsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> messagesRefs<T extends Object>(
      Expression<T> Function($$MessagesTableAnnotationComposer a) f) {
    final $$MessagesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.messages,
        getReferencedColumn: (t) => t.threadId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MessagesTableAnnotationComposer(
              $db: $db,
              $table: $db.messages,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> modeOutputsRefs<T extends Object>(
      Expression<T> Function($$ModeOutputsTableAnnotationComposer a) f) {
    final $$ModeOutputsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.modeOutputs,
        getReferencedColumn: (t) => t.threadId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModeOutputsTableAnnotationComposer(
              $db: $db,
              $table: $db.modeOutputs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ThreadsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ThreadsTable,
    ThreadRow,
    $$ThreadsTableFilterComposer,
    $$ThreadsTableOrderingComposer,
    $$ThreadsTableAnnotationComposer,
    $$ThreadsTableCreateCompanionBuilder,
    $$ThreadsTableUpdateCompanionBuilder,
    (ThreadRow, $$ThreadsTableReferences),
    ThreadRow,
    PrefetchHooks Function({bool messagesRefs, bool modeOutputsRefs})> {
  $$ThreadsTableTableManager(_$AppDatabase db, $ThreadsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ThreadsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ThreadsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ThreadsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ThreadsCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            required DateTime createdAt,
          }) =>
              ThreadsCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ThreadsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {messagesRefs = false, modeOutputsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (messagesRefs) db.messages,
                if (modeOutputsRefs) db.modeOutputs
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (messagesRefs)
                    await $_getPrefetchedData<ThreadRow, $ThreadsTable,
                            MessageRow>(
                        currentTable: table,
                        referencedTable:
                            $$ThreadsTableReferences._messagesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ThreadsTableReferences(db, table, p0)
                                .messagesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.threadId == item.id),
                        typedResults: items),
                  if (modeOutputsRefs)
                    await $_getPrefetchedData<ThreadRow, $ThreadsTable,
                            ModeOutputRow>(
                        currentTable: table,
                        referencedTable:
                            $$ThreadsTableReferences._modeOutputsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ThreadsTableReferences(db, table, p0)
                                .modeOutputsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.threadId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ThreadsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ThreadsTable,
    ThreadRow,
    $$ThreadsTableFilterComposer,
    $$ThreadsTableOrderingComposer,
    $$ThreadsTableAnnotationComposer,
    $$ThreadsTableCreateCompanionBuilder,
    $$ThreadsTableUpdateCompanionBuilder,
    (ThreadRow, $$ThreadsTableReferences),
    ThreadRow,
    PrefetchHooks Function({bool messagesRefs, bool modeOutputsRefs})>;
typedef $$ModesTableCreateCompanionBuilder = ModesCompanion Function({
  Value<int> id,
  required String name,
  required String prompt,
  Value<bool> isEditable,
});
typedef $$ModesTableUpdateCompanionBuilder = ModesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> prompt,
  Value<bool> isEditable,
});

final class $$ModesTableReferences
    extends BaseReferences<_$AppDatabase, $ModesTable, ModeRow> {
  $$ModesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ModeOutputsTable, List<ModeOutputRow>>
      _modeOutputsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.modeOutputs,
          aliasName: $_aliasNameGenerator(db.modes.id, db.modeOutputs.modeId));

  $$ModeOutputsTableProcessedTableManager get modeOutputsRefs {
    final manager = $$ModeOutputsTableTableManager($_db, $_db.modeOutputs)
        .filter((f) => f.modeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_modeOutputsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ModesTableFilterComposer extends Composer<_$AppDatabase, $ModesTable> {
  $$ModesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get prompt => $composableBuilder(
      column: $table.prompt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isEditable => $composableBuilder(
      column: $table.isEditable, builder: (column) => ColumnFilters(column));

  Expression<bool> modeOutputsRefs(
      Expression<bool> Function($$ModeOutputsTableFilterComposer f) f) {
    final $$ModeOutputsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.modeOutputs,
        getReferencedColumn: (t) => t.modeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModeOutputsTableFilterComposer(
              $db: $db,
              $table: $db.modeOutputs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ModesTableOrderingComposer
    extends Composer<_$AppDatabase, $ModesTable> {
  $$ModesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get prompt => $composableBuilder(
      column: $table.prompt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isEditable => $composableBuilder(
      column: $table.isEditable, builder: (column) => ColumnOrderings(column));
}

class $$ModesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ModesTable> {
  $$ModesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get prompt =>
      $composableBuilder(column: $table.prompt, builder: (column) => column);

  GeneratedColumn<bool> get isEditable => $composableBuilder(
      column: $table.isEditable, builder: (column) => column);

  Expression<T> modeOutputsRefs<T extends Object>(
      Expression<T> Function($$ModeOutputsTableAnnotationComposer a) f) {
    final $$ModeOutputsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.modeOutputs,
        getReferencedColumn: (t) => t.modeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModeOutputsTableAnnotationComposer(
              $db: $db,
              $table: $db.modeOutputs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ModesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ModesTable,
    ModeRow,
    $$ModesTableFilterComposer,
    $$ModesTableOrderingComposer,
    $$ModesTableAnnotationComposer,
    $$ModesTableCreateCompanionBuilder,
    $$ModesTableUpdateCompanionBuilder,
    (ModeRow, $$ModesTableReferences),
    ModeRow,
    PrefetchHooks Function({bool modeOutputsRefs})> {
  $$ModesTableTableManager(_$AppDatabase db, $ModesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> prompt = const Value.absent(),
            Value<bool> isEditable = const Value.absent(),
          }) =>
              ModesCompanion(
            id: id,
            name: name,
            prompt: prompt,
            isEditable: isEditable,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String prompt,
            Value<bool> isEditable = const Value.absent(),
          }) =>
              ModesCompanion.insert(
            id: id,
            name: name,
            prompt: prompt,
            isEditable: isEditable,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ModesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({modeOutputsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (modeOutputsRefs) db.modeOutputs],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (modeOutputsRefs)
                    await $_getPrefetchedData<ModeRow, $ModesTable,
                            ModeOutputRow>(
                        currentTable: table,
                        referencedTable:
                            $$ModesTableReferences._modeOutputsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ModesTableReferences(db, table, p0)
                                .modeOutputsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.modeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ModesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ModesTable,
    ModeRow,
    $$ModesTableFilterComposer,
    $$ModesTableOrderingComposer,
    $$ModesTableAnnotationComposer,
    $$ModesTableCreateCompanionBuilder,
    $$ModesTableUpdateCompanionBuilder,
    (ModeRow, $$ModesTableReferences),
    ModeRow,
    PrefetchHooks Function({bool modeOutputsRefs})>;
typedef $$TagsTableCreateCompanionBuilder = TagsCompanion Function({
  Value<int> id,
  required String name,
  required String description,
  Value<bool> isEditable,
});
typedef $$TagsTableUpdateCompanionBuilder = TagsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<bool> isEditable,
});

final class $$TagsTableReferences
    extends BaseReferences<_$AppDatabase, $TagsTable, TagRow> {
  $$TagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MessageTagsTable, List<MessageTag>>
      _messageTagsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.messageTags,
          aliasName: $_aliasNameGenerator(db.tags.id, db.messageTags.tagId));

  $$MessageTagsTableProcessedTableManager get messageTagsRefs {
    final manager = $$MessageTagsTableTableManager($_db, $_db.messageTags)
        .filter((f) => f.tagId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_messageTagsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isEditable => $composableBuilder(
      column: $table.isEditable, builder: (column) => ColumnFilters(column));

  Expression<bool> messageTagsRefs(
      Expression<bool> Function($$MessageTagsTableFilterComposer f) f) {
    final $$MessageTagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.messageTags,
        getReferencedColumn: (t) => t.tagId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MessageTagsTableFilterComposer(
              $db: $db,
              $table: $db.messageTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isEditable => $composableBuilder(
      column: $table.isEditable, builder: (column) => ColumnOrderings(column));
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isEditable => $composableBuilder(
      column: $table.isEditable, builder: (column) => column);

  Expression<T> messageTagsRefs<T extends Object>(
      Expression<T> Function($$MessageTagsTableAnnotationComposer a) f) {
    final $$MessageTagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.messageTags,
        getReferencedColumn: (t) => t.tagId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MessageTagsTableAnnotationComposer(
              $db: $db,
              $table: $db.messageTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TagsTable,
    TagRow,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (TagRow, $$TagsTableReferences),
    TagRow,
    PrefetchHooks Function({bool messageTagsRefs})> {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> isEditable = const Value.absent(),
          }) =>
              TagsCompanion(
            id: id,
            name: name,
            description: description,
            isEditable: isEditable,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            Value<bool> isEditable = const Value.absent(),
          }) =>
              TagsCompanion.insert(
            id: id,
            name: name,
            description: description,
            isEditable: isEditable,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TagsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({messageTagsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (messageTagsRefs) db.messageTags],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (messageTagsRefs)
                    await $_getPrefetchedData<TagRow, $TagsTable, MessageTag>(
                        currentTable: table,
                        referencedTable:
                            $$TagsTableReferences._messageTagsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TagsTableReferences(db, table, p0)
                                .messageTagsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tagId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TagsTable,
    TagRow,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (TagRow, $$TagsTableReferences),
    TagRow,
    PrefetchHooks Function({bool messageTagsRefs})>;
typedef $$MessagesTableCreateCompanionBuilder = MessagesCompanion Function({
  Value<int> id,
  required int threadId,
  Value<String> body,
  required DateTime timestamp,
  required String messageType,
  Value<String> description,
  Value<Uint8List?> fileData,
  Value<String?> mimeType,
  Value<String?> transcript,
  Value<String?> fileName,
});
typedef $$MessagesTableUpdateCompanionBuilder = MessagesCompanion Function({
  Value<int> id,
  Value<int> threadId,
  Value<String> body,
  Value<DateTime> timestamp,
  Value<String> messageType,
  Value<String> description,
  Value<Uint8List?> fileData,
  Value<String?> mimeType,
  Value<String?> transcript,
  Value<String?> fileName,
});

final class $$MessagesTableReferences
    extends BaseReferences<_$AppDatabase, $MessagesTable, MessageRow> {
  $$MessagesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ThreadsTable _threadIdTable(_$AppDatabase db) => db.threads
      .createAlias($_aliasNameGenerator(db.messages.threadId, db.threads.id));

  $$ThreadsTableProcessedTableManager get threadId {
    final $_column = $_itemColumn<int>('thread_id')!;

    final manager = $$ThreadsTableTableManager($_db, $_db.threads)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_threadIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$MessageTagsTable, List<MessageTag>>
      _messageTagsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.messageTags,
          aliasName:
              $_aliasNameGenerator(db.messages.id, db.messageTags.messageId));

  $$MessageTagsTableProcessedTableManager get messageTagsRefs {
    final manager = $$MessageTagsTableTableManager($_db, $_db.messageTags)
        .filter((f) => f.messageId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_messageTagsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MessagesTableFilterComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get messageType => $composableBuilder(
      column: $table.messageType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get fileData => $composableBuilder(
      column: $table.fileData, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transcript => $composableBuilder(
      column: $table.transcript, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnFilters(column));

  $$ThreadsTableFilterComposer get threadId {
    final $$ThreadsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.threadId,
        referencedTable: $db.threads,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ThreadsTableFilterComposer(
              $db: $db,
              $table: $db.threads,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> messageTagsRefs(
      Expression<bool> Function($$MessageTagsTableFilterComposer f) f) {
    final $$MessageTagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.messageTags,
        getReferencedColumn: (t) => t.messageId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MessageTagsTableFilterComposer(
              $db: $db,
              $table: $db.messageTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get messageType => $composableBuilder(
      column: $table.messageType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get fileData => $composableBuilder(
      column: $table.fileData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transcript => $composableBuilder(
      column: $table.transcript, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnOrderings(column));

  $$ThreadsTableOrderingComposer get threadId {
    final $$ThreadsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.threadId,
        referencedTable: $db.threads,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ThreadsTableOrderingComposer(
              $db: $db,
              $table: $db.threads,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get messageType => $composableBuilder(
      column: $table.messageType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<Uint8List> get fileData =>
      $composableBuilder(column: $table.fileData, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<String> get transcript => $composableBuilder(
      column: $table.transcript, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  $$ThreadsTableAnnotationComposer get threadId {
    final $$ThreadsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.threadId,
        referencedTable: $db.threads,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ThreadsTableAnnotationComposer(
              $db: $db,
              $table: $db.threads,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> messageTagsRefs<T extends Object>(
      Expression<T> Function($$MessageTagsTableAnnotationComposer a) f) {
    final $$MessageTagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.messageTags,
        getReferencedColumn: (t) => t.messageId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MessageTagsTableAnnotationComposer(
              $db: $db,
              $table: $db.messageTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MessagesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MessagesTable,
    MessageRow,
    $$MessagesTableFilterComposer,
    $$MessagesTableOrderingComposer,
    $$MessagesTableAnnotationComposer,
    $$MessagesTableCreateCompanionBuilder,
    $$MessagesTableUpdateCompanionBuilder,
    (MessageRow, $$MessagesTableReferences),
    MessageRow,
    PrefetchHooks Function({bool threadId, bool messageTagsRefs})> {
  $$MessagesTableTableManager(_$AppDatabase db, $MessagesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> threadId = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> messageType = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<Uint8List?> fileData = const Value.absent(),
            Value<String?> mimeType = const Value.absent(),
            Value<String?> transcript = const Value.absent(),
            Value<String?> fileName = const Value.absent(),
          }) =>
              MessagesCompanion(
            id: id,
            threadId: threadId,
            body: body,
            timestamp: timestamp,
            messageType: messageType,
            description: description,
            fileData: fileData,
            mimeType: mimeType,
            transcript: transcript,
            fileName: fileName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int threadId,
            Value<String> body = const Value.absent(),
            required DateTime timestamp,
            required String messageType,
            Value<String> description = const Value.absent(),
            Value<Uint8List?> fileData = const Value.absent(),
            Value<String?> mimeType = const Value.absent(),
            Value<String?> transcript = const Value.absent(),
            Value<String?> fileName = const Value.absent(),
          }) =>
              MessagesCompanion.insert(
            id: id,
            threadId: threadId,
            body: body,
            timestamp: timestamp,
            messageType: messageType,
            description: description,
            fileData: fileData,
            mimeType: mimeType,
            transcript: transcript,
            fileName: fileName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$MessagesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({threadId = false, messageTagsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (messageTagsRefs) db.messageTags],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (threadId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.threadId,
                    referencedTable:
                        $$MessagesTableReferences._threadIdTable(db),
                    referencedColumn:
                        $$MessagesTableReferences._threadIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (messageTagsRefs)
                    await $_getPrefetchedData<MessageRow, $MessagesTable,
                            MessageTag>(
                        currentTable: table,
                        referencedTable:
                            $$MessagesTableReferences._messageTagsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MessagesTableReferences(db, table, p0)
                                .messageTagsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.messageId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MessagesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MessagesTable,
    MessageRow,
    $$MessagesTableFilterComposer,
    $$MessagesTableOrderingComposer,
    $$MessagesTableAnnotationComposer,
    $$MessagesTableCreateCompanionBuilder,
    $$MessagesTableUpdateCompanionBuilder,
    (MessageRow, $$MessagesTableReferences),
    MessageRow,
    PrefetchHooks Function({bool threadId, bool messageTagsRefs})>;
typedef $$ModeOutputsTableCreateCompanionBuilder = ModeOutputsCompanion
    Function({
  Value<int> id,
  required int threadId,
  required int modeId,
  required DateTime createdAt,
  required String content,
});
typedef $$ModeOutputsTableUpdateCompanionBuilder = ModeOutputsCompanion
    Function({
  Value<int> id,
  Value<int> threadId,
  Value<int> modeId,
  Value<DateTime> createdAt,
  Value<String> content,
});

final class $$ModeOutputsTableReferences
    extends BaseReferences<_$AppDatabase, $ModeOutputsTable, ModeOutputRow> {
  $$ModeOutputsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ThreadsTable _threadIdTable(_$AppDatabase db) =>
      db.threads.createAlias(
          $_aliasNameGenerator(db.modeOutputs.threadId, db.threads.id));

  $$ThreadsTableProcessedTableManager get threadId {
    final $_column = $_itemColumn<int>('thread_id')!;

    final manager = $$ThreadsTableTableManager($_db, $_db.threads)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_threadIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ModesTable _modeIdTable(_$AppDatabase db) => db.modes
      .createAlias($_aliasNameGenerator(db.modeOutputs.modeId, db.modes.id));

  $$ModesTableProcessedTableManager get modeId {
    final $_column = $_itemColumn<int>('mode_id')!;

    final manager = $$ModesTableTableManager($_db, $_db.modes)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ModeOutputsTableFilterComposer
    extends Composer<_$AppDatabase, $ModeOutputsTable> {
  $$ModeOutputsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  $$ThreadsTableFilterComposer get threadId {
    final $$ThreadsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.threadId,
        referencedTable: $db.threads,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ThreadsTableFilterComposer(
              $db: $db,
              $table: $db.threads,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ModesTableFilterComposer get modeId {
    final $$ModesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modeId,
        referencedTable: $db.modes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModesTableFilterComposer(
              $db: $db,
              $table: $db.modes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ModeOutputsTableOrderingComposer
    extends Composer<_$AppDatabase, $ModeOutputsTable> {
  $$ModeOutputsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  $$ThreadsTableOrderingComposer get threadId {
    final $$ThreadsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.threadId,
        referencedTable: $db.threads,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ThreadsTableOrderingComposer(
              $db: $db,
              $table: $db.threads,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ModesTableOrderingComposer get modeId {
    final $$ModesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modeId,
        referencedTable: $db.modes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModesTableOrderingComposer(
              $db: $db,
              $table: $db.modes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ModeOutputsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ModeOutputsTable> {
  $$ModeOutputsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  $$ThreadsTableAnnotationComposer get threadId {
    final $$ThreadsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.threadId,
        referencedTable: $db.threads,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ThreadsTableAnnotationComposer(
              $db: $db,
              $table: $db.threads,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ModesTableAnnotationComposer get modeId {
    final $$ModesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modeId,
        referencedTable: $db.modes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModesTableAnnotationComposer(
              $db: $db,
              $table: $db.modes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ModeOutputsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ModeOutputsTable,
    ModeOutputRow,
    $$ModeOutputsTableFilterComposer,
    $$ModeOutputsTableOrderingComposer,
    $$ModeOutputsTableAnnotationComposer,
    $$ModeOutputsTableCreateCompanionBuilder,
    $$ModeOutputsTableUpdateCompanionBuilder,
    (ModeOutputRow, $$ModeOutputsTableReferences),
    ModeOutputRow,
    PrefetchHooks Function({bool threadId, bool modeId})> {
  $$ModeOutputsTableTableManager(_$AppDatabase db, $ModeOutputsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModeOutputsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModeOutputsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModeOutputsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> threadId = const Value.absent(),
            Value<int> modeId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> content = const Value.absent(),
          }) =>
              ModeOutputsCompanion(
            id: id,
            threadId: threadId,
            modeId: modeId,
            createdAt: createdAt,
            content: content,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int threadId,
            required int modeId,
            required DateTime createdAt,
            required String content,
          }) =>
              ModeOutputsCompanion.insert(
            id: id,
            threadId: threadId,
            modeId: modeId,
            createdAt: createdAt,
            content: content,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ModeOutputsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({threadId = false, modeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (threadId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.threadId,
                    referencedTable:
                        $$ModeOutputsTableReferences._threadIdTable(db),
                    referencedColumn:
                        $$ModeOutputsTableReferences._threadIdTable(db).id,
                  ) as T;
                }
                if (modeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.modeId,
                    referencedTable:
                        $$ModeOutputsTableReferences._modeIdTable(db),
                    referencedColumn:
                        $$ModeOutputsTableReferences._modeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ModeOutputsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ModeOutputsTable,
    ModeOutputRow,
    $$ModeOutputsTableFilterComposer,
    $$ModeOutputsTableOrderingComposer,
    $$ModeOutputsTableAnnotationComposer,
    $$ModeOutputsTableCreateCompanionBuilder,
    $$ModeOutputsTableUpdateCompanionBuilder,
    (ModeOutputRow, $$ModeOutputsTableReferences),
    ModeOutputRow,
    PrefetchHooks Function({bool threadId, bool modeId})>;
typedef $$ConfigurationTableTableCreateCompanionBuilder
    = ConfigurationTableCompanion Function({
  Value<int> id,
  Value<String> apiKey,
  Value<String?> baseUrl,
  required String modelName,
});
typedef $$ConfigurationTableTableUpdateCompanionBuilder
    = ConfigurationTableCompanion Function({
  Value<int> id,
  Value<String> apiKey,
  Value<String?> baseUrl,
  Value<String> modelName,
});

class $$ConfigurationTableTableFilterComposer
    extends Composer<_$AppDatabase, $ConfigurationTableTable> {
  $$ConfigurationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get apiKey => $composableBuilder(
      column: $table.apiKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get baseUrl => $composableBuilder(
      column: $table.baseUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get modelName => $composableBuilder(
      column: $table.modelName, builder: (column) => ColumnFilters(column));
}

class $$ConfigurationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ConfigurationTableTable> {
  $$ConfigurationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get apiKey => $composableBuilder(
      column: $table.apiKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get baseUrl => $composableBuilder(
      column: $table.baseUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get modelName => $composableBuilder(
      column: $table.modelName, builder: (column) => ColumnOrderings(column));
}

class $$ConfigurationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConfigurationTableTable> {
  $$ConfigurationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get apiKey =>
      $composableBuilder(column: $table.apiKey, builder: (column) => column);

  GeneratedColumn<String> get baseUrl =>
      $composableBuilder(column: $table.baseUrl, builder: (column) => column);

  GeneratedColumn<String> get modelName =>
      $composableBuilder(column: $table.modelName, builder: (column) => column);
}

class $$ConfigurationTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ConfigurationTableTable,
    ConfigurationTableData,
    $$ConfigurationTableTableFilterComposer,
    $$ConfigurationTableTableOrderingComposer,
    $$ConfigurationTableTableAnnotationComposer,
    $$ConfigurationTableTableCreateCompanionBuilder,
    $$ConfigurationTableTableUpdateCompanionBuilder,
    (
      ConfigurationTableData,
      BaseReferences<_$AppDatabase, $ConfigurationTableTable,
          ConfigurationTableData>
    ),
    ConfigurationTableData,
    PrefetchHooks Function()> {
  $$ConfigurationTableTableTableManager(
      _$AppDatabase db, $ConfigurationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConfigurationTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConfigurationTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConfigurationTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> apiKey = const Value.absent(),
            Value<String?> baseUrl = const Value.absent(),
            Value<String> modelName = const Value.absent(),
          }) =>
              ConfigurationTableCompanion(
            id: id,
            apiKey: apiKey,
            baseUrl: baseUrl,
            modelName: modelName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> apiKey = const Value.absent(),
            Value<String?> baseUrl = const Value.absent(),
            required String modelName,
          }) =>
              ConfigurationTableCompanion.insert(
            id: id,
            apiKey: apiKey,
            baseUrl: baseUrl,
            modelName: modelName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ConfigurationTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ConfigurationTableTable,
    ConfigurationTableData,
    $$ConfigurationTableTableFilterComposer,
    $$ConfigurationTableTableOrderingComposer,
    $$ConfigurationTableTableAnnotationComposer,
    $$ConfigurationTableTableCreateCompanionBuilder,
    $$ConfigurationTableTableUpdateCompanionBuilder,
    (
      ConfigurationTableData,
      BaseReferences<_$AppDatabase, $ConfigurationTableTable,
          ConfigurationTableData>
    ),
    ConfigurationTableData,
    PrefetchHooks Function()>;
typedef $$MessageTagsTableCreateCompanionBuilder = MessageTagsCompanion
    Function({
  required int messageId,
  required int tagId,
  Value<int> rowid,
});
typedef $$MessageTagsTableUpdateCompanionBuilder = MessageTagsCompanion
    Function({
  Value<int> messageId,
  Value<int> tagId,
  Value<int> rowid,
});

final class $$MessageTagsTableReferences
    extends BaseReferences<_$AppDatabase, $MessageTagsTable, MessageTag> {
  $$MessageTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessagesTable _messageIdTable(_$AppDatabase db) =>
      db.messages.createAlias(
          $_aliasNameGenerator(db.messageTags.messageId, db.messages.id));

  $$MessagesTableProcessedTableManager get messageId {
    final $_column = $_itemColumn<int>('message_id')!;

    final manager = $$MessagesTableTableManager($_db, $_db.messages)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TagsTable _tagIdTable(_$AppDatabase db) => db.tags
      .createAlias($_aliasNameGenerator(db.messageTags.tagId, db.tags.id));

  $$TagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<int>('tag_id')!;

    final manager = $$TagsTableTableManager($_db, $_db.tags)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MessageTagsTableFilterComposer
    extends Composer<_$AppDatabase, $MessageTagsTable> {
  $$MessageTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MessagesTableFilterComposer get messageId {
    final $$MessagesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.messageId,
        referencedTable: $db.messages,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MessagesTableFilterComposer(
              $db: $db,
              $table: $db.messages,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableFilterComposer get tagId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableFilterComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MessageTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $MessageTagsTable> {
  $$MessageTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MessagesTableOrderingComposer get messageId {
    final $$MessagesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.messageId,
        referencedTable: $db.messages,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MessagesTableOrderingComposer(
              $db: $db,
              $table: $db.messages,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableOrderingComposer get tagId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableOrderingComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MessageTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MessageTagsTable> {
  $$MessageTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MessagesTableAnnotationComposer get messageId {
    final $$MessagesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.messageId,
        referencedTable: $db.messages,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MessagesTableAnnotationComposer(
              $db: $db,
              $table: $db.messages,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableAnnotationComposer get tagId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableAnnotationComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MessageTagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MessageTagsTable,
    MessageTag,
    $$MessageTagsTableFilterComposer,
    $$MessageTagsTableOrderingComposer,
    $$MessageTagsTableAnnotationComposer,
    $$MessageTagsTableCreateCompanionBuilder,
    $$MessageTagsTableUpdateCompanionBuilder,
    (MessageTag, $$MessageTagsTableReferences),
    MessageTag,
    PrefetchHooks Function({bool messageId, bool tagId})> {
  $$MessageTagsTableTableManager(_$AppDatabase db, $MessageTagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessageTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessageTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessageTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> messageId = const Value.absent(),
            Value<int> tagId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MessageTagsCompanion(
            messageId: messageId,
            tagId: tagId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int messageId,
            required int tagId,
            Value<int> rowid = const Value.absent(),
          }) =>
              MessageTagsCompanion.insert(
            messageId: messageId,
            tagId: tagId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MessageTagsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({messageId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (messageId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.messageId,
                    referencedTable:
                        $$MessageTagsTableReferences._messageIdTable(db),
                    referencedColumn:
                        $$MessageTagsTableReferences._messageIdTable(db).id,
                  ) as T;
                }
                if (tagId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tagId,
                    referencedTable:
                        $$MessageTagsTableReferences._tagIdTable(db),
                    referencedColumn:
                        $$MessageTagsTableReferences._tagIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MessageTagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MessageTagsTable,
    MessageTag,
    $$MessageTagsTableFilterComposer,
    $$MessageTagsTableOrderingComposer,
    $$MessageTagsTableAnnotationComposer,
    $$MessageTagsTableCreateCompanionBuilder,
    $$MessageTagsTableUpdateCompanionBuilder,
    (MessageTag, $$MessageTagsTableReferences),
    MessageTag,
    PrefetchHooks Function({bool messageId, bool tagId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ThreadsTableTableManager get threads =>
      $$ThreadsTableTableManager(_db, _db.threads);
  $$ModesTableTableManager get modes =>
      $$ModesTableTableManager(_db, _db.modes);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$MessagesTableTableManager get messages =>
      $$MessagesTableTableManager(_db, _db.messages);
  $$ModeOutputsTableTableManager get modeOutputs =>
      $$ModeOutputsTableTableManager(_db, _db.modeOutputs);
  $$ConfigurationTableTableTableManager get configurationTable =>
      $$ConfigurationTableTableTableManager(_db, _db.configurationTable);
  $$MessageTagsTableTableManager get messageTags =>
      $$MessageTagsTableTableManager(_db, _db.messageTags);
}
