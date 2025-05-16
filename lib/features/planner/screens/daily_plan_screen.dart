import 'package:flutter/material.dart';
import 'package:student_lms/features/dashboard/screens/dashboard_screen.dart';

class DailyPlanScreen extends StatefulWidget {
  const DailyPlanScreen({super.key});

  @override
  State<DailyPlanScreen> createState() => _DailyPlanScreenState();
}

class _DailyPlanScreenState extends State<DailyPlanScreen> {
  List<Map<String, dynamic>> studyPlan = [
    {"task": "Math Homework", "duration": 15, "completed": false},
    {"task": "Science Reading", "duration": 15, "completed": false},
    {"task": "English Chapter 3 Review", "duration": 15, "completed": false},
  ];

  void toggleTaskCompletion(int index) {
    setState(() {
      studyPlan[index]['completed'] = !studyPlan[index]['completed'];
    });
  }

int get totalDuration =>
    studyPlan.fold(0, (sum, task) => sum + (task['duration'] as int));

int get completedDuration => studyPlan
    .where((task) => task['completed'] == true)
    .fold(0, (sum, task) => sum + (task['duration'] as int));


  double get progress =>
      totalDuration == 0 ? 0 : completedDuration / totalDuration;

  void _showAddTaskDialog() {
    final TextEditingController taskController = TextEditingController();
    final TextEditingController durationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: taskController,
                decoration: const InputDecoration(
                  hintText: 'Enter task description',
                ),
              ),
              TextField(
                controller: durationController,
                decoration: const InputDecoration(
                  hintText: 'Duration in minutes',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (taskController.text.isNotEmpty &&
                    int.tryParse(durationController.text) != null) {
                  setState(() {
                    studyPlan.add({
                      "task": taskController.text,
                      "duration": int.parse(durationController.text),
                      "completed": false,
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text("Daily 45-Min Study Plan"),
        backgroundColor: Colors.indigo.shade100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Total Planned Time: $totalDuration minutes",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              color: Colors.green,
              minHeight: 8,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: studyPlan.length,
                itemBuilder: (context, index) {
                  final task = studyPlan[index];
                  return ListTile(
                    onTap: () => toggleTaskCompletion(index),
                    tileColor: task['completed']
                        ? Colors.green.withOpacity(0.3)
                        : null,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 12.0),
                    title: Text(
                      "${task['task']} (${task['duration']} mins)",
                      style: TextStyle(
                        decoration: task['completed']
                            ? TextDecoration.lineThrough
                            : null,
                        color:
                            task['completed'] ? Colors.green : Colors.black,
                      ),
                    ),
                    trailing: task['completed']
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
