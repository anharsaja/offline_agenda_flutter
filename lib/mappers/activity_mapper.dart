import '../database/app_database.dart';
import '../models/activity.dart';

extension ActivityMapper on ActivitiesTableData {
  Activity toModel() {
    return Activity(
      name: name,
      point: point,
      done: done,
    );
  }
}