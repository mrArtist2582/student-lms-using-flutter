import 'package:flutter/material.dart';
import 'package:student_lms/features/dashboard/screens/dashboard_screen.dart';

class DailyPlanScreen extends StatefulWidget {
  const DailyPlanScreen({super.key});

  @override
  State<DailyPlanScreen> createState() => _DailyPlanScreenState();
}

class _DailyPlanScreenState extends State<DailyPlanScreen> {
  // List to hold daily tasks
  List<Map<String, dynamic>> tasks = [
    {"task": "Complete Math Homework", "completed": false},
    {"task": "Attend Science Class", "completed": false},
    {"task": "Read English Chapter 3", "completed": false},
  ];

  // Method to toggle task completion
  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  // Method to show dialog for adding new task
  void _showAddTaskDialog() {
    final TextEditingController taskController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Task"),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(
              hintText: 'Enter task description',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog without adding
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  setState(() {
                    tasks.add({
                      "task": taskController.text,
                      "completed": false,
                    });
                  });
                  Navigator.pop(context); // Close the dialog
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
        title: const Text("Daily Plan",),
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
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return ListTile(
              onTap: () => toggleTaskCompletion(index),
              tileColor: task['completed'] ? Colors.green.withOpacity(0.3) : null,
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
              title: Text(
                task['task'],
                style: TextStyle(
                  decoration: task['completed'] ? TextDecoration.lineThrough : null,
                  color: task['completed'] ? Colors.green : Colors.black,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
