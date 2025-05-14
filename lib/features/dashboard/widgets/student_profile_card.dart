import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_lms/models/student.dart';
import '../../../providers/student_provider.dart';
import '../screens/student_profile_screen.dart';

class StudentProfileCard extends StatelessWidget {
  const StudentProfileCard({super.key, required Student student});

  @override
  Widget build(BuildContext context) {
    final student = Provider.of<StudentProvider>(context).getStudent();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const StudentProfileScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.teal.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(student.profilePicture),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(student.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                Text(student.location ?? 'Unknown location',
                    style: const TextStyle(
                      color: Colors.grey,
                    )),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.teal),
          ],
        ),
      ),
    );
  }
}
