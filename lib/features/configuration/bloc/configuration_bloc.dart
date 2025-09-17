import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spec_genie/features/shared/isar/isar_provider.dart';
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
    final isar = ref.read(isarProvider);
    final existing = isar.configurations.where().limit(1).findFirstSync();
    final initial = existing ?? const Configuration(modelName: '', apiKey: '');
    
    // Initialize controllers with the current configuration values
    _apiKeyController = TextEditingController(text: initial.apiKey);
    _modelNameController = TextEditingController(text: initial.modelName);
    _baseUrlController = TextEditingController(text: initial.baseUrl ?? '');

    // Set up listeners to sync controller changes with state
    _apiKeyController.addListener(() {
      if (state.apiKey != _apiKeyController.text) {
        state = state.copyWith(apiKey: _apiKeyController.text);
      }
    });

    _modelNameController.addListener(() {
      if (state.modelName != _modelNameController.text) {
        state = state.copyWith(modelName: _modelNameController.text);
      }
    });

    _baseUrlController.addListener(() {
      final newValue = _baseUrlController.text.isEmpty ? null : _baseUrlController.text;
      if (state.baseUrl != newValue) {
        state = state.copyWith(baseUrl: newValue);
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

  void updateApiKey(String apiKey) {
    state = state.copyWith(apiKey: apiKey);
    if (_apiKeyController.text != apiKey) {
      _apiKeyController.text = apiKey;
    }
  }

  void updateModelName(String modelName) {
    state = state.copyWith(modelName: modelName);
    if (_modelNameController.text != modelName) {
      _modelNameController.text = modelName;
    }
  }

  void updateBaseUrl(String? baseUrl) {
    state = state.copyWith(baseUrl: baseUrl);
    final controllerValue = baseUrl ?? '';
    if (_baseUrlController.text != controllerValue) {
      _baseUrlController.text = controllerValue;
    }
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
      // Update controllers to reflect the new state
      _apiKeyController.text = latest.apiKey;
      _modelNameController.text = latest.modelName;
      _baseUrlController.text = latest.baseUrl ?? '';
    }
  }
}
