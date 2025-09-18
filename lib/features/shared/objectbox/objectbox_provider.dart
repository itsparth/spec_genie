import 'package:objectbox/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_provider.g.dart';

/// Provider for ObjectBox store instance
@riverpod
Store store(Ref ref) {
  throw UnimplementedError('storeProvider must be overridden');
}