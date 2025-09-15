import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/home_screen.dart';
import '../../features/configuration/configuration_screen.dart';
import '../../features/chat/chat_screen.dart';

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
    return const HomeScreen();
  }
}

class ConfigurationRoute extends GoRouteData with $ConfigurationRoute {
  const ConfigurationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ConfigurationScreen();
  }
}

class ChatRoute extends GoRouteData with $ChatRoute {
  const ChatRoute({required this.threadId});

  final String threadId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChatScreen(threadId: threadId);
  }
}