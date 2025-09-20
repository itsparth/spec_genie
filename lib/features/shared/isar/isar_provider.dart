import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_provider.g.dart';

/// Provider for Isar database instance
@Riverpod(keepAlive: true)
Isar isar(Ref ref) {
  throw UnimplementedError('isarProvider must be overridden');
}
