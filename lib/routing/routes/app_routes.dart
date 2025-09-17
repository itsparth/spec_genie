import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/configuration/ui/configuration_page.dart';
import '../../features/configuration/ui/model_configuration_page.dart';
import '../../features/configuration/bloc/configuration_bloc.dart';
import '../../features/threads/ui/threads_page.dart';
import '../../features/modes/ui/modes_page.dart';
import '../../features/tags/ui/tags_page.dart';
import '../../features/mode_output/ui/mode_output_page.dart';
import '../../features/chat/ui/chat_view.dart';
part 'app_routes.g.dart';

@TypedGoRoute<HomeScreenRoute>(
  path: '/',
  routes: [
    TypedGoRoute<ConfigurationRoute>(
      path: '/configuration',
    ),
    TypedGoRoute<ModelConfigurationRoute>(
      path: '/model-configuration',
    ),
    TypedGoRoute<ThreadsRoute>(
      path: '/threads',
    ),
    TypedGoRoute<ModesRoute>(
      path: '/modes',
    ),
    TypedGoRoute<TagsRoute>(
      path: '/tags',
    ),
    TypedGoRoute<ModeOutputRoute>(
      path: '/mode-output/:threadId/:modeId',
    ),
    TypedGoRoute<ChatRoute>(
      path: '/chat/:threadId',
    ),
  ],
)
class HomeScreenRoute extends GoRouteData with $HomeScreenRoute {
  const HomeScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const _HomePage();
  }
}

class _HomePage extends ConsumerWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configurationBlocProvider);

    // Check if model configuration is set up
    // Configuration is considered set up if both apiKey and modelName are not empty
    final isConfigured =
        config.apiKey.isNotEmpty && config.modelName.isNotEmpty;

    // Use WidgetsBinding to navigate after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isConfigured) {
        // Navigate to threads page if configuration is set up
        const ThreadsRoute().go(context);
      } else {
        // Navigate to model configuration page if not set up
        const ModelConfigurationRoute().go(context);
      }
    });

    // Show loading screen while determining where to navigate
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              'Loading Spec Genie...',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class ConfigurationRoute extends GoRouteData with $ConfigurationRoute {
  const ConfigurationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ConfigurationPage();
  }
}

class ThreadsRoute extends GoRouteData with $ThreadsRoute {
  const ThreadsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ThreadsPage();
  }
}

class ChatRoute extends GoRouteData with $ChatRoute {
  const ChatRoute({this.threadId});

  final String? threadId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if (threadId == 'new') {
      return const ChatView(threadId: null);
    }
    return ChatView(threadId: int.parse(threadId!));
  }
}

class ModelConfigurationRoute extends GoRouteData
    with $ModelConfigurationRoute {
  const ModelConfigurationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ModelConfigurationPage();
  }
}

class ModesRoute extends GoRouteData with $ModesRoute {
  const ModesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ModesPage();
  }
}

class TagsRoute extends GoRouteData with $TagsRoute {
  const TagsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TagsPage();
  }
}

class ModeOutputRoute extends GoRouteData with $ModeOutputRoute {
  const ModeOutputRoute({required this.threadId, required this.modeId});

  final String threadId;
  final String modeId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ModeOutputPage(
      threadId: int.parse(threadId),
      modeId: int.parse(modeId),
    );
  }
}
