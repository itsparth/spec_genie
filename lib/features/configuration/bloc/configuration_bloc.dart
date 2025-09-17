import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/configuration.dart';

part 'configuration_bloc.g.dart';

@riverpod
class ConfigurationBloc extends _$ConfigurationBloc {
  @override
  Configuration build() {
    // Return default configuration for now
    // TODO: Load from Isar database when integrated
    return Configuration.defaultConfig();
  }

  /// Update API key
  void updateApiKey(String apiKey) {
    final current = state;
    state = Configuration(
      id: current.id,
      apiKey: apiKey,
      baseUrl: current.baseUrl,
      modelName: current.modelName,
    );
  }

  /// Update base URL
  void updateBaseUrl(String? baseUrl) {
    final current = state;
    state = Configuration(
      id: current.id,
      apiKey: current.apiKey,
      baseUrl: baseUrl,
      modelName: current.modelName,
    );
  }

  /// Update model name
  void updateModelName(String modelName) {
    final current = state;
    state = Configuration(
      id: current.id,
      apiKey: current.apiKey,
      baseUrl: current.baseUrl,
      modelName: modelName,
    );
  }
}
