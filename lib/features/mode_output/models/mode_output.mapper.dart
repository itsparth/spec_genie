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
    def: 0,
  );
  static DateTime _$createdAt(ModeOutput v) => v.createdAt;
  static const Field<ModeOutput, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static String _$content(ModeOutput v) => v.content;
  static const Field<ModeOutput, String> _f$content = Field(
    'content',
    _$content,
  );
  static ToOne<Thread> _$thread(ModeOutput v) => v.thread;
  static const Field<ModeOutput, ToOne<Thread>> _f$thread = Field(
    'thread',
    _$thread,
    mode: FieldMode.member,
  );
  static ToOne<Mode> _$mode(ModeOutput v) => v.mode;
  static const Field<ModeOutput, ToOne<Mode>> _f$mode = Field(
    'mode',
    _$mode,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ModeOutput> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #content: _f$content,
    #thread: _f$thread,
    #mode: _f$mode,
  };

  static ModeOutput _instantiate(DecodingData data) {
    return ModeOutput(
      id: data.dec(_f$id),
      createdAt: data.dec(_f$createdAt),
      content: data.dec(_f$content),
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
  $R call({int? id, DateTime? createdAt, String? content});
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
  $R call({int? id, DateTime? createdAt, String? content}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (createdAt != null) #createdAt: createdAt,
      if (content != null) #content: content,
    }),
  );
  @override
  ModeOutput $make(CopyWithData data) => ModeOutput(
    id: data.get(#id, or: $value.id),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    content: data.get(#content, or: $value.content),
  );

  @override
  ModeOutputCopyWith<$R2, ModeOutput, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ModeOutputCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

