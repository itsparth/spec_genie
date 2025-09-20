import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spec_genie/features/configuration/bloc/configuration_bloc.dart';
import 'package:spec_genie/features/shared/openai/config.dart';

import 'util.dart';

part 'openai_provider.g.dart';

/// Provider for OpenAI utility instance
///
/// This provider watches the OpenAI configuration and automatically
/// recreates the utility when the configuration changes.
///
/// The utility instance is automatically disposed when no longer needed.
@Riverpod(keepAlive: true)
OpenAIUtil openAIUtil(Ref ref) {
  final config = ref.watch(configurationBlocProvider);

  final util = OpenAIUtil(
    OpenAIConfig(
      apiKey: config.apiKey,
      baseUrl: config.baseUrl,
      model: config.modelName,
    ),
  );

  // Ensure proper disposal when provider is disposed
  ref.onDispose(() {
    util.dispose();
  });

  return util;
}
