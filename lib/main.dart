import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spec_genie/features/shared/objectbox/objectbox_provider.dart';
import 'package:spec_genie/features/tags/models/tag.dart';
import 'package:spec_genie/routing/app_router.dart';
import 'features/configuration/models/configuration.dart';
import 'features/chat/models/message.dart';
import 'features/threads/models/thread.dart';
import 'features/modes/models/mode.dart';
import 'features/mode_output/models/mode_output.dart';
import 'objectbox.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize ObjectBox database
  final dir = await getApplicationCacheDirectory();
  final store = await openStore(directory: dir.path);

  runApp(
    ProviderScope(
      overrides: [
        storeProvider.overrideWith((ref) => store),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Spec Genie',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
