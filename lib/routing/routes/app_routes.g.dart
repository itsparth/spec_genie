// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeScreenRoute,
    ];

RouteBase get $homeScreenRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeScreenRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: '/configuration',
          factory: $ConfigurationRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/chat/:threadId',
          factory: $ChatRoute._fromState,
        ),
      ],
    );

mixin $HomeScreenRoute on GoRouteData {
  static HomeScreenRoute _fromState(GoRouterState state) =>
      const HomeScreenRoute();

  @override
  String get location => GoRouteData.$location(
        '/',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ConfigurationRoute on GoRouteData {
  static ConfigurationRoute _fromState(GoRouterState state) =>
      const ConfigurationRoute();

  @override
  String get location => GoRouteData.$location(
        '/configuration',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ChatRoute on GoRouteData {
  static ChatRoute _fromState(GoRouterState state) => ChatRoute(
        threadId: state.pathParameters['threadId']!,
      );

  ChatRoute get _self => this as ChatRoute;

  @override
  String get location => GoRouteData.$location(
        '/chat/${Uri.encodeComponent(_self.threadId)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
