import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spec_genie/database/repositories/configuration_repository.dart';
import 'package:spec_genie/database/database.dart';
import 'package:spec_genie/database/drift_database_provider.dart';
import 'package:drift/drift.dart' show Value;

part 'configuration_bloc.g.dart';

@riverpod
class ConfigurationBloc extends _$ConfigurationBloc {
  late final TextEditingController _apiKeyController;
  late final TextEditingController _modelNameController;
  late final TextEditingController _baseUrlController;

  @override
  ConfigurationTableData build() {
    // Default state before async load (id 0 sentinel)
    final initial = const ConfigurationTableData(
      id: 0,
      apiKey: '',
      baseUrl: null,
      modelName: '',
    );

    // Initialize controllers with the current configuration values
    _apiKeyController = TextEditingController(text: initial.apiKey);
    _modelNameController = TextEditingController(text: initial.modelName);
    _baseUrlController = TextEditingController(text: initial.baseUrl ?? '');

    // Kick off async load from Drift
    final repo = ref.read(configurationRepositoryProvider);
    repo.getFirst().then((value) {
      if (value != null) {
        state = value;
        _apiKeyController.text = value.apiKey;
        _modelNameController.text = value.modelName;
        _baseUrlController.text = value.baseUrl ?? '';
      }
    });

    // Clean up resources when the provider is disposed
    ref.onDispose(() {
      _apiKeyController.dispose();
      _modelNameController.dispose();
      _baseUrlController.dispose();
    });

    return initial;
  }

  // Public getters for the controllers
  TextEditingController get apiKeyController => _apiKeyController;
  TextEditingController get modelNameController => _modelNameController;
  TextEditingController get baseUrlController => _baseUrlController;

  /// Persist the current configuration by reading values from controllers and saving to database
  Future<void> save() async {
    // Read current values from controllers
    final apiKey = _apiKeyController.text;
    final modelName = _modelNameController.text;
    final baseUrl =
        _baseUrlController.text.isEmpty ? null : _baseUrlController.text;

    final db = ref.read(driftDatabaseProvider);
    // Replace existing row(s)
    await db.transaction(() async {
      await db.delete(db.configurationTable).go();
      await db.into(db.configurationTable).insert(
            ConfigurationTableCompanion(
              apiKey: Value(apiKey),
              modelName: Value(modelName),
              baseUrl: Value(baseUrl),
            ),
          );
    });
    final repo = ref.read(configurationRepositoryProvider);
    final refreshed = await repo.getFirst();
    if (refreshed != null) state = refreshed;
  }

  /// Force reload from the database and update controllers
  Future<void> reload() async {
    final repo = ref.read(configurationRepositoryProvider);
    final latest = await repo.getFirst();
    if (latest != null) {
      state = latest;
      _apiKeyController.text = latest.apiKey;
      _modelNameController.text = latest.modelName;
      _baseUrlController.text = latest.baseUrl ?? '';
    }
  }
}
