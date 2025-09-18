import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import 'tables/threads.dart';
import 'tables/modes.dart';
import 'tables/tags.dart';
import 'tables/messages.dart';
import 'tables/mode_outputs.dart';
import 'tables/configuration.dart';
import 'tables/message_tags.dart';

part 'database.g.dart';

// Feature flag for enabling Drift reads (later used for dual-write strategies)
const bool kEnableDriftPersistence = true; // Toggle during transition

@DriftDatabase(
  tables: [
    Threads,
    Modes,
    Tags,
    Messages,
    ModeOutputs,
    ConfigurationTable,
    MessageTags,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1; // Increment with migrations later
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationSupportDirectory();
    final file = File('${dir.path}/app.db');
    return NativeDatabase.createInBackground(file);
  });
}
