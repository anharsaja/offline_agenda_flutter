import 'package:flutter/material.dart';
import 'package:offline_agenda/database/app_database.dart';
import 'pages/main_page.dart';


void main() {
  final database = AppDatabase();
  runApp(DailyTrackerApp(database: database));
}


class DailyTrackerApp extends StatelessWidget {
  final AppDatabase database;
  
  const DailyTrackerApp({
    super.key,
    required this.database,
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(database: database),
    );
  }
}