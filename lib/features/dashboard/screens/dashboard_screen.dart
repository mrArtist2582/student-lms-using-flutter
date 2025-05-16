import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_lms/core/constants/text_styles.dart';
import 'package:student_lms/features/dashboard/widgets/my_drawer.dart';
import 'package:student_lms/features/planner/screens/daily_plan_screen.dart';
import 'package:student_lms/features/planner/screens/weekly_plan_screen.dart';
import '../../../providers/student_provider.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/student_profile_header.dart';
import '../widgets/assignment_timeline.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Function to show the planner selection popup
  void _showPlannerOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Planner Type'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.today),
                title: const Text('Daily Plan'),
                onTap: () {
                  Navigator.pop(context); // Close the dialog first
                  Future.delayed(Duration.zero, () {
                    Navigator.pushReplacement(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DailyPlanScreen(),
                      ),
                    );
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_view_week),
                title: const Text('Weekly Plan'),
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(Duration.zero, () {
                    Navigator.pushReplacement(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WeeklyPlanScreen(),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // When the back button is pressed, navigate to the splash screen
        Navigator.pushReplacementNamed(context, '/');
        return false; // Prevent the default back navigation
      },
      child: Scaffold(
        drawer: MyDrawer(),
        backgroundColor: Colors.indigo.shade50,
        appBar: AppBar(
          title: const Text('Dashboard'),
          backgroundColor: Colors.indigo.shade100,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            // ignore: unused_local_variable
            bool isWide = constraints.maxWidth > 600;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<StudentProvider>(
                    builder: (context, studentProvider, _) {
                      final student = studentProvider.getStudent();
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [StudentProfileHeader(student: student)],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        DashboardCard(
                          title: 'Questions',
                          icon: Icons.quiz,
                          routeName: '/questionnaire',
                          onTap: () =>
                              Navigator.pushNamed(context, '/questionnaire'),
                        ),
                        DashboardCard(
                          title: 'Progress',
                          icon: Icons.bar_chart,
                          routeName: '/progress',
                          onTap: () =>
                              Navigator.pushNamed(context, '/progress'),
                        ),
                        DashboardCard(
                          title: 'Planner',
                          icon: Icons.event_note,
                          routeName: '/planner',
                          onTap: () => _showPlannerOptions(
                            context,
                          ), // Show the popup when tapped
                        ),
                        DashboardCard(
                          title: 'About Student',
                          icon: Icons.person_rounded,
                          routeName: '/about_student',
                          onTap: () =>
                              Navigator.pushNamed(context, '/about_student'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('Upcoming Assignments', style: AppTextStyles.heading),
                  const SizedBox(height: 8),
                  Expanded(child: AssignmentTimeline()),
                  const SizedBox(height: 16),
                  // Footer section with copyright text
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        print("Copyright clicked!");
                      },
                      child: Text(
                        '© 2025 kdStudentLMS | All Rights Reserved',
                        style: AppTextStyles.body.copyWith(
                          color: Colors.grey,
                          decoration: TextDecoration
                              .underline, // Underline to indicate it's clickable
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
