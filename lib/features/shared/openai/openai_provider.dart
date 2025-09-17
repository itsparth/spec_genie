import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'config.dart';
import 'config_provider.dart';
import 'util.dart';

part 'openai_provider.g.dart';

/// Provider for OpenAI utility instance
///
/// This provider watches the OpenAI configuration and automatically
/// recreates the utility when the configuration changes.
///
/// The utility instance is automatically disposed when no longer needed.
@riverpod
OpenAIUtil openAIUtil(Ref ref) {
  final config = ref.watch(computedOpenAIConfigProvider);

  final util = OpenAIUtil(config);

  // Ensure proper disposal when provider is disposed
  ref.onDispose(() {
    util.dispose();
  });

  return util;
}
