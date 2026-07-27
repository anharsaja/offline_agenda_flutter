import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/activities.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Activities,
  ],
)
class AppDatabase extends _$AppDatabase {

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

}

LazyDatabase _openConnection() {

  return LazyDatabase(() async {

    final dbFolder = await getApplicationDocumentsDirectory();

    final file = File(
      p.join(
        dbFolder.path,
        'daily_tracker.sqlite',
      ),
    );

    return NativeDatabase(file);

  });

}