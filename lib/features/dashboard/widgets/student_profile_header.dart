import 'package:flutter/material.dart';
import 'package:student_lms/features/dashboard/screens/student_profile_screen.dart';
import '../../../models/student.dart';

class StudentProfileHeader extends StatelessWidget {
  final Student student;

  const StudentProfileHeader({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfileScreen()));
      },
      
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage("assets/student.png"),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(student.name, style: Theme.of(context).textTheme.titleLarge),
             
            ],
          )
        ],
      ),
    );
  }
}
