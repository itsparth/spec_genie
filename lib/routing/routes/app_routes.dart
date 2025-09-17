import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
part 'app_routes.g.dart';

@TypedGoRoute<HomeScreenRoute>(
  path: '/',
  routes: [
    TypedGoRoute<ConfigurationRoute>(
      path: '/configuration',
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
    return const SizedBox();
  }
}

class ConfigurationRoute extends GoRouteData with $ConfigurationRoute {
  const ConfigurationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SizedBox();
  }
}

class ChatRoute extends GoRouteData with $ChatRoute {
  const ChatRoute({required this.threadId});

  final String threadId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SizedBox();
  }
}
