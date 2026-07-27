import 'package:flutter/material.dart';
import '../models/activity.dart';

class AddActivityDialog extends StatefulWidget {
  const AddActivityDialog({super.key});

  @override
  State<AddActivityDialog> createState() => _AddActivityDialogState();
}

class _AddActivityDialogState extends State<AddActivityDialog> {
  final nameController = TextEditingController();
  final pointController = TextEditingController();

  bool isPositive = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Activity"),

      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Activity Name"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: pointController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Points"),
            ),

            const SizedBox(height: 20),

            RadioListTile(
              title: const Text("Positive"),
              value: true,
              groupValue: isPositive,
              onChanged: (value) {
                setState(() {
                  isPositive = value!;
                });
              },
            ),

            RadioListTile(
              title: const Text("Negative"),
              value: false,
              groupValue: isPositive,
              onChanged: (value) {
                setState(() {
                  isPositive = value!;
                });
              },
            ),
          ],
        ),
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),

        FilledButton(
          onPressed: () {
            final point = int.tryParse(pointController.text) ?? 0;

            Navigator.pop(
              context,

              Activity(
                name: nameController.text,
                point: isPositive ? point : -point,
              ),
            );
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
