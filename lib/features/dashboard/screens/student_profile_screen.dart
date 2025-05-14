import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/student_provider.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final student = Provider.of<StudentProvider>(context).getStudent();

    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text("Student Profile"),
        backgroundColor: Colors.indigo.shade300,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(student),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildDetailTile(Icons.class_, "Class", student.className),
                  _buildDetailTile(Icons.school, "School", student.schoolName),
                  _buildDetailTile(Icons.book, "Subjects", student.subjects?.join(', ')),
                  _buildDetailTile(Icons.email, "Email", student.email),
                  _buildDetailTile(Icons.phone, "Phone", student.phone),
                  // Add more fields if needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(student) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo[100]!, Colors.indigo[200]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(student.profilePicture),
          ),
          const SizedBox(height: 12),
          Text(
            student.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            student.location ?? 'Unknown Location',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailTile(IconData icon, String title, String? value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.indigo.shade400),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value ?? "Not available"),
      ),
    );
  }
}
