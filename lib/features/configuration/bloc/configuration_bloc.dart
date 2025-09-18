import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spec_genie/features/shared/objectbox/objectbox_provider.dart';
import '../models/configuration.dart';

part 'configuration_bloc.g.dart';

@riverpod
class ConfigurationBloc extends _$ConfigurationBloc {
  late final TextEditingController _apiKeyController;
  late final TextEditingController _modelNameController;
  late final TextEditingController _baseUrlController;

  @override
  Configuration build() {
    // Load initial configuration from the database if present
    final store = ref.read(storeProvider);
    final box = store.box<Configuration>();
    final existing = box.getAll().isEmpty ? null : box.getAll().first;
    final initial = existing ?? Configuration(modelName: '', apiKey: '');

    // Initialize controllers with the current configuration values
    _apiKeyController = TextEditingController(text: initial.apiKey);
    _modelNameController = TextEditingController(text: initial.modelName);
    _baseUrlController = TextEditingController(text: initial.baseUrl ?? '');

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

    // Update state with controller values
    state = state.copyWith(
      apiKey: apiKey,
      modelName: modelName,
      baseUrl: baseUrl,
    );

    // Save to database
    final store = ref.read(storeProvider);
    final box = store.box<Configuration>();
    final id = box.put(state);
    if (id != state.id) {
      // Update state with the assigned id
      state = Configuration(
        id: id,
        apiKey: state.apiKey,
        modelName: state.modelName,
        baseUrl: state.baseUrl,
      );
    }
  }

  /// Force reload from the database and update controllers
  Future<void> reload() async {
    final store = ref.read(storeProvider);
    final box = store.box<Configuration>();
    final configs = box.getAll();
    if (configs.isNotEmpty) {
      final latest = configs.first;
      state = latest;
      // Update controllers to reflect the new state
      _apiKeyController.text = latest.apiKey;
      _modelNameController.text = latest.modelName;
      _baseUrlController.text = latest.baseUrl ?? '';
    }
  }
}
