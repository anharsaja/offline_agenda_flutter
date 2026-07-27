import '../models/activity_category.dart';

extension ActivityCategoryExtension on ActivityCategory {

  String get label {

    switch (this) {

      case ActivityCategory.worship:
        return "🙏 Worship";

      case ActivityCategory.work:
        return "💻 Work";

      case ActivityCategory.health:
        return "🏃 Health";

      case ActivityCategory.study:
        return "📚 Study";

      case ActivityCategory.badHabit:
        return "⚠️ Bad Habit";
    }
  }
}