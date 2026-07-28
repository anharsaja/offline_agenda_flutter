import '../database/app_database.dart';

class ActivityRepository {
  final AppDatabase database;

  ActivityRepository(this.database);

  Future<List<ActivitiesTableData>> getAll() {
    return database.getActivities();
  }

  Future<void> add(ActivitiesTableCompanion activity) {
    return database.insertActivity(activity);
  }
}