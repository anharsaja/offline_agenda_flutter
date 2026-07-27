import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../widgets/activity_tile.dart';

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
      appBar: AppBar(title: 
      const Text(
        "Good Evening 👋",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      )),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: 
                Column(
                  children: [

                    const Text(
                      "Today's Progress",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "${(progress * 100).toInt()}%",
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 12,
                      ),
                    ),
                  ],
                )
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Aktivitas Positif",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: goodActivities.map((activity) {
                  return 
                  // CheckboxListTile(
                  //   title: Text(activity.name),
                  //   value: activity.done,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       activity.done = value!;
                  //     });
                  //   },
                  // );
                  ActivityTile(
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

            const Text(
              "Aktivitas Negatif",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: badActivities.map((activity) {
                  return 
                  // CheckboxListTile(
                  //   title: Text(activity.name),
                  //   value: activity.done,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       activity.done = value!;
                  //     });
                  //   },
                  // );
                  ActivityTile(
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
