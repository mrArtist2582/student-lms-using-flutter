import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_lms/features/about_app/about_us.dart';
import 'package:student_lms/features/about_app/help.dart';
import 'package:student_lms/features/dashboard/questionnaire/screens/questionnaire_wizard.dart';
import 'package:student_lms/features/dashboard/screens/student_profile_screen.dart';
import '../../../providers/student_provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final student = Provider.of<StudentProvider>(context).getStudent();

    return Drawer(
      backgroundColor: Colors.indigo[50],
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfileScreen()));
        },
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(student.name),
              accountEmail: Text(student.email ?? ''),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(student.profilePicture),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo[200],
              ),
            ),
            const Divider(),
            _buildDrawerItem(
              context,
              icon: Icons.question_answer,
              title: 'Questions',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const QuestionnaireWizard()));
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.help_outline,
              title: 'Help',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HelpScreen()));
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.info_outline,
              title: 'About the App',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AboutUsScreen()));
              },
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () {
                // Example: Clear provider and redirect
                Provider.of<StudentProvider>(context, listen: false).logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: Colors.indigo[400]),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
