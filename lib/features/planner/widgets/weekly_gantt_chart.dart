import 'package:flutter/material.dart';

class WeeklyGanttChart extends StatelessWidget {
   WeeklyGanttChart({super.key});

  // Dummy weekly task data
  List<Map<String, dynamic>> getWeeklyTasks() {
    return [
      {
        'task': 'Math Assignment',
        'start': 0, // Monday
        'end': 2,   // Wednesday
        'color': Colors.indigo,
      },
      {
        'task': 'Science Project',
        'start': 1, // Tuesday
        'end': 4,   // Friday
        'color': Colors.green,
      },
      {
        'task': 'History Reading',
        'start': 3, // Thursday
        'end': 6,   // Sunday
        'color': Colors.orange,
      },
    ];
  }

  final List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    final tasks = getWeeklyTasks();

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Weekly Gantt Chart", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          // Day labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: weekDays
                .map((day) => Expanded(
                      child: Center(child: Text(day, style: const TextStyle(fontWeight: FontWeight.bold))),
                    ))
                .toList(),
          ),
          const SizedBox(height: 10),
          // Task bars
          Column(
            children: tasks.map((task) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: List.generate(7, (index) {
                    final isTaskDay = index >= task['start'] && index <= task['end'];
                    return Expanded(
                      child: Container(
                        height: 20,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: isTaskDay ? task['color'] : Colors.transparent,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
