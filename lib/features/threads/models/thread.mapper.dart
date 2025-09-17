// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'thread.dart';

class ThreadMapper extends ClassMapperBase<Thread> {
  ThreadMapper._();

  static ThreadMapper? _instance;
  static ThreadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ThreadMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Thread';

  static int _$id(Thread v) => v.id;
  static const Field<Thread, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
    def: Isar.autoIncrement,
  );
  static String _$name(Thread v) => v.name;
  static const Field<Thread, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static DateTime _$createdAt(Thread v) => v.createdAt;
  static const Field<Thread, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static IsarLinks<Message> _$messages(Thread v) => v.messages;
  static const Field<Thread, IsarLinks<Message>> _f$messages = Field(
    'messages',
    _$messages,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<Thread> fields = const {
    #id: _f$id,
    #name: _f$name,
    #createdAt: _f$createdAt,
    #messages: _f$messages,
  };

  static Thread _instantiate(DecodingData data) {
    return Thread(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      createdAt: data.dec(_f$createdAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Thread fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Thread>(map);
  }

  static Thread fromJson(String json) {
    return ensureInitialized().decodeJson<Thread>(json);
  }
}

mixin ThreadMappable {
  String toJson() {
    return ThreadMapper.ensureInitialized().encodeJson<Thread>(this as Thread);
  }

  Map<String, dynamic> toMap() {
    return ThreadMapper.ensureInitialized().encodeMap<Thread>(this as Thread);
  }

  ThreadCopyWith<Thread, Thread, Thread> get copyWith =>
      _ThreadCopyWithImpl<Thread, Thread>(this as Thread, $identity, $identity);
  @override
  String toString() {
    return ThreadMapper.ensureInitialized().stringifyValue(this as Thread);
  }

  @override
  bool operator ==(Object other) {
    return ThreadMapper.ensureInitialized().equalsValue(this as Thread, other);
  }

  @override
  int get hashCode {
    return ThreadMapper.ensureInitialized().hashValue(this as Thread);
  }
}

extension ThreadValueCopy<$R, $Out> on ObjectCopyWith<$R, Thread, $Out> {
  ThreadCopyWith<$R, Thread, $Out> get $asThread =>
      $base.as((v, t, t2) => _ThreadCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ThreadCopyWith<$R, $In extends Thread, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name, DateTime? createdAt});
  ThreadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ThreadCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Thread, $Out>
    implements ThreadCopyWith<$R, Thread, $Out> {
  _ThreadCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Thread> $mapper = ThreadMapper.ensureInitialized();
  @override
  $R call({int? id, String? name, DateTime? createdAt}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (createdAt != null) #createdAt: createdAt,
    }),
  );
  @override
  Thread $make(CopyWithData data) => Thread(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    createdAt: data.get(#createdAt, or: $value.createdAt),
  );

  @override
  ThreadCopyWith<$R2, Thread, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ThreadCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

