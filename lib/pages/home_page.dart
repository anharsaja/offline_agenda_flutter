import 'package:flutter/material.dart';
import '../database/app_database.dart';
import '../dialogs/add_activity_dialog.dart';
import '../models/activity.dart';
import '../repositories/activity_repository.dart';
import '../widgets/activity_tile.dart';
import '../widgets/progress_card.dart';
import '../widgets/section_title.dart';

class HomePage extends StatefulWidget {
  final AppDatabase database;

  const HomePage({
    super.key,
    required this.database,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ActivityRepository repository;

  @override
  void initState() {
    super.initState();

    repository = ActivityRepository(widget.database);
    loadActivities();
  }

  Future<void> loadActivities() async {
    final activities = await repository.getAll();
    print(activities);
  }

  final List<Activity> goodActivities = [
    Activity(name: "Bangun Siang", point: 10, done: false),
    Activity(name: "Makan Sayur", point: 10, done: false),
    Activity(name: "Olahraga", point: 10, done: false),
  ];

  final List<Activity> badActivities = [
    Activity(name: "Nongkrong", point: -10, done: false),
    Activity(name: "Tidak Mandi", point: -10, done: false),
    Activity(name: "Makan Junk Food", point: -10, done: false),
  ];

  double get progress {
    int total = 0;
    int current = 0;

    for (var item in goodActivities) {
      total += item.point;

      if (item.done) {
        current += item.point;
      }
    }

    for (var item in badActivities) {
      if (item.done) {
        current += item.point;
      }
    }

    return total == 0 ? 0 : current / total;
  }

  Future<void> addActivity() async {
    final Activity? activity = await showDialog<Activity>(
      context: context,
      builder: (_) => const AddActivityDialog(),
    );

    if (activity == null) return;

    setState(() {
      if (activity.point >= 0) {
        goodActivities.add(activity);
      } else {
        badActivities.add(activity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Good Evening 👋",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ProgressCard(progress: progress),

          const SectionTitle(title: "Positive Activities"),
          ...goodActivities.map(
            (activity) => ActivityTile(
              activity: activity,
              onChanged: (value) {
                setState(() {
                  activity.done = value!;
                });
              },
            ),
          ),

          const SectionTitle(title: "Bad Habits"),
          ...badActivities.map(
            (activity) => ActivityTile(
              activity: activity,
              onChanged: (value) {
                setState(() {
                  activity.done = value!;
                });
              },
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addActivity,
        child: const Icon(Icons.add),
      ),
    );
  }
}