import 'package:flutter/material.dart';
import '../models/activity.dart';

class ActivityTile extends StatelessWidget {
  final Activity activity;
  final ValueChanged<bool?> onChanged;

  const ActivityTile({
    super.key,
    required this.activity,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = activity.point >= 0;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: CheckboxListTile(
        value: activity.done,
        onChanged: onChanged,
        title: Text(
          activity.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          isPositive
              ? "+${activity.point} Points"
              : "${activity.point} Points",
        ),
      ),
    );
  }
}