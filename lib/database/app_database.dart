import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/activities_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [ActivitiesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<ActivitiesTableData>> getActivities() {
    return select(activitiesTable).get(); // SELECT * FROM activities_table
  }

  Future<void> insertActivity(ActivitiesTableCompanion activity) {
    return into(activitiesTable).insert(activity); // INSERT INTO activities_table
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();

    final file = File(p.join(dbFolder.path, 'daily_tracker.db'));

    return NativeDatabase(file);
  });
}
