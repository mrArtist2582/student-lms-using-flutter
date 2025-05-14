import 'package:flutter/material.dart';

class DailyTaskCard extends StatelessWidget {
  final String task;

  const DailyTaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(task),
        trailing: IconButton(
          icon: const Icon(Icons.check_circle),
          onPressed: () {
            // Mark task as completed
          },
        ),
      ),
    );
  }
}
