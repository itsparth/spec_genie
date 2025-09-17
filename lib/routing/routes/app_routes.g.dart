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
          path: '/model-configuration',
          factory: $ModelConfigurationRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/threads',
          factory: $ThreadsRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/modes',
          factory: $ModesRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/tags',
          factory: $TagsRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/mode-output/:threadId/:modeId',
          factory: $ModeOutputRoute._fromState,
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

mixin $ModelConfigurationRoute on GoRouteData {
  static ModelConfigurationRoute _fromState(GoRouterState state) =>
      const ModelConfigurationRoute();

  @override
  String get location => GoRouteData.$location(
        '/model-configuration',
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

mixin $ThreadsRoute on GoRouteData {
  static ThreadsRoute _fromState(GoRouterState state) => const ThreadsRoute();

  @override
  String get location => GoRouteData.$location(
        '/threads',
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

mixin $ModesRoute on GoRouteData {
  static ModesRoute _fromState(GoRouterState state) => const ModesRoute();

  @override
  String get location => GoRouteData.$location(
        '/modes',
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

mixin $TagsRoute on GoRouteData {
  static TagsRoute _fromState(GoRouterState state) => const TagsRoute();

  @override
  String get location => GoRouteData.$location(
        '/tags',
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

mixin $ModeOutputRoute on GoRouteData {
  static ModeOutputRoute _fromState(GoRouterState state) => ModeOutputRoute(
        threadId: state.pathParameters['threadId']!,
        modeId: state.pathParameters['modeId']!,
      );

  ModeOutputRoute get _self => this as ModeOutputRoute;

  @override
  String get location => GoRouteData.$location(
        '/mode-output/${Uri.encodeComponent(_self.threadId)}/${Uri.encodeComponent(_self.modeId)}',
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
