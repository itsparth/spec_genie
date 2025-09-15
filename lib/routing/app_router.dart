import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes/app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: $appRoutes,
    initialLocation: '/',
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Route not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              state.matchedLocation,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => const HomeScreenRoute().go(context),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
