import 'package:flutter/material.dart';
import 'package:student_lms/features/dashboard/screens/dashboard_screen.dart';
import '../widgets/weekly_gantt_chart.dart';

class WeeklyPlanScreen extends StatelessWidget {
  const WeeklyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade100,
        title: const Text("Weekly Plan"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:WeeklyGanttChart(),
      ),
    );
  }
}
