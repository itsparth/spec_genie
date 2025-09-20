// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'threads_state.dart';

class ThreadItemStateMapper extends ClassMapperBase<ThreadItemState> {
  ThreadItemStateMapper._();

  static ThreadItemStateMapper? _instance;
  static ThreadItemStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ThreadItemStateMapper._());
      ThreadMapper.ensureInitialized();
      ModeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ThreadItemState';

  static Thread _$thread(ThreadItemState v) => v.thread;
  static const Field<ThreadItemState, Thread> _f$thread = Field(
    'thread',
    _$thread,
  );
  static Mode? _$latestMode(ThreadItemState v) => v.latestMode;
  static const Field<ThreadItemState, Mode> _f$latestMode = Field(
    'latestMode',
    _$latestMode,
    opt: true,
  );

  @override
  final MappableFields<ThreadItemState> fields = const {
    #thread: _f$thread,
    #latestMode: _f$latestMode,
  };

  static ThreadItemState _instantiate(DecodingData data) {
    return ThreadItemState(
      thread: data.dec(_f$thread),
      latestMode: data.dec(_f$latestMode),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ThreadItemState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ThreadItemState>(map);
  }

  static ThreadItemState fromJson(String json) {
    return ensureInitialized().decodeJson<ThreadItemState>(json);
  }
}

mixin ThreadItemStateMappable {
  String toJson() {
    return ThreadItemStateMapper.ensureInitialized()
        .encodeJson<ThreadItemState>(this as ThreadItemState);
  }

  Map<String, dynamic> toMap() {
    return ThreadItemStateMapper.ensureInitialized().encodeMap<ThreadItemState>(
      this as ThreadItemState,
    );
  }

  ThreadItemStateCopyWith<ThreadItemState, ThreadItemState, ThreadItemState>
  get copyWith =>
      _ThreadItemStateCopyWithImpl<ThreadItemState, ThreadItemState>(
        this as ThreadItemState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ThreadItemStateMapper.ensureInitialized().stringifyValue(
      this as ThreadItemState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ThreadItemStateMapper.ensureInitialized().equalsValue(
      this as ThreadItemState,
      other,
    );
  }

  @override
  int get hashCode {
    return ThreadItemStateMapper.ensureInitialized().hashValue(
      this as ThreadItemState,
    );
  }
}

extension ThreadItemStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ThreadItemState, $Out> {
  ThreadItemStateCopyWith<$R, ThreadItemState, $Out> get $asThreadItemState =>
      $base.as((v, t, t2) => _ThreadItemStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ThreadItemStateCopyWith<$R, $In extends ThreadItemState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ThreadCopyWith<$R, Thread, Thread> get thread;
  ModeCopyWith<$R, Mode, Mode>? get latestMode;
  $R call({Thread? thread, Mode? latestMode});
  ThreadItemStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ThreadItemStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ThreadItemState, $Out>
    implements ThreadItemStateCopyWith<$R, ThreadItemState, $Out> {
  _ThreadItemStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ThreadItemState> $mapper =
      ThreadItemStateMapper.ensureInitialized();
  @override
  ThreadCopyWith<$R, Thread, Thread> get thread =>
      $value.thread.copyWith.$chain((v) => call(thread: v));
  @override
  ModeCopyWith<$R, Mode, Mode>? get latestMode =>
      $value.latestMode?.copyWith.$chain((v) => call(latestMode: v));
  @override
  $R call({Thread? thread, Object? latestMode = $none}) => $apply(
    FieldCopyWithData({
      if (thread != null) #thread: thread,
      if (latestMode != $none) #latestMode: latestMode,
    }),
  );
  @override
  ThreadItemState $make(CopyWithData data) => ThreadItemState(
    thread: data.get(#thread, or: $value.thread),
    latestMode: data.get(#latestMode, or: $value.latestMode),
  );

  @override
  ThreadItemStateCopyWith<$R2, ThreadItemState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ThreadItemStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ThreadsStateMapper extends ClassMapperBase<ThreadsState> {
  ThreadsStateMapper._();

  static ThreadsStateMapper? _instance;
  static ThreadsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ThreadsStateMapper._());
      ThreadMapper.ensureInitialized();
      ThreadItemStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ThreadsState';

  static bool _$isLoading(ThreadsState v) => v.isLoading;
  static const Field<ThreadsState, bool> _f$isLoading = Field(
    'isLoading',
    _$isLoading,
    opt: true,
    def: false,
  );
  static List<Thread> _$threads(ThreadsState v) => v.threads;
  static const Field<ThreadsState, List<Thread>> _f$threads = Field(
    'threads',
    _$threads,
    opt: true,
    def: const [],
  );
  static List<ThreadItemState> _$threadItems(ThreadsState v) => v.threadItems;
  static const Field<ThreadsState, List<ThreadItemState>> _f$threadItems =
      Field('threadItems', _$threadItems, opt: true, def: const []);
  static Object? _$error(ThreadsState v) => v.error;
  static const Field<ThreadsState, Object> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static Set<int> _$deletingIds(ThreadsState v) => v.deletingIds;
  static const Field<ThreadsState, Set<int>> _f$deletingIds = Field(
    'deletingIds',
    _$deletingIds,
    opt: true,
    def: const {},
  );

  @override
  final MappableFields<ThreadsState> fields = const {
    #isLoading: _f$isLoading,
    #threads: _f$threads,
    #threadItems: _f$threadItems,
    #error: _f$error,
    #deletingIds: _f$deletingIds,
  };

  static ThreadsState _instantiate(DecodingData data) {
    return ThreadsState(
      isLoading: data.dec(_f$isLoading),
      threads: data.dec(_f$threads),
      threadItems: data.dec(_f$threadItems),
      error: data.dec(_f$error),
      deletingIds: data.dec(_f$deletingIds),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ThreadsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ThreadsState>(map);
  }

  static ThreadsState fromJson(String json) {
    return ensureInitialized().decodeJson<ThreadsState>(json);
  }
}

mixin ThreadsStateMappable {
  String toJson() {
    return ThreadsStateMapper.ensureInitialized().encodeJson<ThreadsState>(
      this as ThreadsState,
    );
  }

  Map<String, dynamic> toMap() {
    return ThreadsStateMapper.ensureInitialized().encodeMap<ThreadsState>(
      this as ThreadsState,
    );
  }

  ThreadsStateCopyWith<ThreadsState, ThreadsState, ThreadsState> get copyWith =>
      _ThreadsStateCopyWithImpl<ThreadsState, ThreadsState>(
        this as ThreadsState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ThreadsStateMapper.ensureInitialized().stringifyValue(
      this as ThreadsState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ThreadsStateMapper.ensureInitialized().equalsValue(
      this as ThreadsState,
      other,
    );
  }

  @override
  int get hashCode {
    return ThreadsStateMapper.ensureInitialized().hashValue(
      this as ThreadsState,
    );
  }
}

extension ThreadsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ThreadsState, $Out> {
  ThreadsStateCopyWith<$R, ThreadsState, $Out> get $asThreadsState =>
      $base.as((v, t, t2) => _ThreadsStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ThreadsStateCopyWith<$R, $In extends ThreadsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Thread, ThreadCopyWith<$R, Thread, Thread>> get threads;
  ListCopyWith<
    $R,
    ThreadItemState,
    ThreadItemStateCopyWith<$R, ThreadItemState, ThreadItemState>
  >
  get threadItems;
  $R call({
    bool? isLoading,
    List<Thread>? threads,
    List<ThreadItemState>? threadItems,
    Object? error,
    Set<int>? deletingIds,
  });
  ThreadsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ThreadsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ThreadsState, $Out>
    implements ThreadsStateCopyWith<$R, ThreadsState, $Out> {
  _ThreadsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ThreadsState> $mapper =
      ThreadsStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Thread, ThreadCopyWith<$R, Thread, Thread>> get threads =>
      ListCopyWith(
        $value.threads,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(threads: v),
      );
  @override
  ListCopyWith<
    $R,
    ThreadItemState,
    ThreadItemStateCopyWith<$R, ThreadItemState, ThreadItemState>
  >
  get threadItems => ListCopyWith(
    $value.threadItems,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(threadItems: v),
  );
  @override
  $R call({
    bool? isLoading,
    List<Thread>? threads,
    List<ThreadItemState>? threadItems,
    Object? error = $none,
    Set<int>? deletingIds,
  }) => $apply(
    FieldCopyWithData({
      if (isLoading != null) #isLoading: isLoading,
      if (threads != null) #threads: threads,
      if (threadItems != null) #threadItems: threadItems,
      if (error != $none) #error: error,
      if (deletingIds != null) #deletingIds: deletingIds,
    }),
  );
  @override
  ThreadsState $make(CopyWithData data) => ThreadsState(
    isLoading: data.get(#isLoading, or: $value.isLoading),
    threads: data.get(#threads, or: $value.threads),
    threadItems: data.get(#threadItems, or: $value.threadItems),
    error: data.get(#error, or: $value.error),
    deletingIds: data.get(#deletingIds, or: $value.deletingIds),
  );

  @override
  ThreadsStateCopyWith<$R2, ThreadsState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ThreadsStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

