import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../widgets/activity_tile.dart';
import '../widgets/progress_card.dart';
import '../widgets/section_title.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Activity> goodActivities = [
    Activity(name: "Sholat Subuh", point: 10, done: false),
    Activity(name: "Olahraga", point: 10, done: false),
    Activity(name: "Membaca", point: 10, done: false),
    Activity(name: "Sholat Dhuhur", point: 15, done: false),
    Activity(name: "Sholat Ashar", point: 15, done: false),
    Activity(name: "Olahraga", point: 10, done: false),
    Activity(name: "Sholat Maghrib", point: 10, done: false),
    Activity(name: "Sholat Isya", point: 10, done: false),
    Activity(name: "Tidur jam 9", point: 10, done: false),
  ];

  final List<Activity> badActivities = [
    Activity(name: "Bangun Siang", point: -10, done: false),
    Activity(name: "Nongkrong", point: -10, done: false),
    Activity(name: "Tidak Mandi", point: -10, done: false),
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
    // if (current < 0) current = 0;

    return current / total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Good Evening 👋",
      //     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      //   ),
      // ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Good Evening 👋",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ProgressCard(progress: progress),

            const SectionTitle(title: "Positive Activities"),
            Expanded(
              child: ListView(
                children: goodActivities.map((activity) {
                  return ActivityTile(
                    activity: activity,
                    onChanged: (value) {
                      setState(() {
                        activity.done = value!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),


            const SectionTitle(title: "Negative Activities"),
            Expanded(
              child: ListView(
                children: badActivities.map((activity) {
                  return ActivityTile(
                    activity: activity,
                    onChanged: (value) {
                      setState(() {
                        activity.done = value!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
