import '../../models/activity.dart';

class ActivityRepository {

  final List<Activity> _activities = [];

  List<Activity> getAll() {
    return _activities;
  }

  void add(Activity activity) {
    _activities.add(activity);
  }

  void delete(Activity activity) {
    _activities.remove(activity);
  }

}