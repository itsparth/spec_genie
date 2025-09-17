import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/configuration.dart';
import '../../shared/isar_provider.dart';

part 'configuration_bloc.g.dart';

@riverpod
class ConfigurationBloc extends _$ConfigurationBloc {
  @override
  Configuration build() {
    // Load initial configuration from the database if present
    final isar = ref.read(isarProvider);
    final existing = isar.configurations.where().limit(1).findFirstSync();
    final initial = existing ?? const Configuration(modelName: '', apiKey: '');
    return initial;
  }

  void updateApiKey(String apiKey) {
    state = state.copyWith(apiKey: apiKey);
  }

  void updateModelName(String modelName) {
    state = state.copyWith(modelName: modelName);
  }

  void updateBaseUrl(String? baseUrl) {
    state = state.copyWith(baseUrl: baseUrl);
  }

  /// Persist the current configuration. If an existing row is present it will be updated.
  Future<void> save() async {
    final isar = ref.read(isarProvider);
    await isar.writeTxn(() async {
      final id = await isar.configurations.put(state);
      if (id != state.id) {
        // Ensure we reflect any auto-increment id assignment
        final refreshed = await isar.configurations.get(id);
        if (refreshed != null) {
          state = refreshed;
        }
      }
    });
  }

  /// Force reload from the database (useful after external mutation before watch delivers).
  Future<void> reload() async {
    final isar = ref.read(isarProvider);
    final latest = await isar.configurations.where().limit(1).findFirst();
    if (latest != null) {
      state = latest;
    }
  }
}
