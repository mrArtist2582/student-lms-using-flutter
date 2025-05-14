import 'package:flutter/material.dart';
import '../widgets/pie_chart_widget.dart';
import '../widgets/bar_chart_widget.dart';
import '../widgets/line_chart_widget.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Overview"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Quiz Score Distribution",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            const PieChartWidget(),
            const SizedBox(height: 32),
            const Text(
              "Assignment Completion Bar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            const BarChartWidget(),
            const SizedBox(height: 32),
            const Text(
              "Weekly Quiz Score Trend",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            const LineChartWidget(),
          ],
        ),
      ),
    );
  }
}
