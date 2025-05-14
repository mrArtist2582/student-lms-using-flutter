// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Add this package for the spinner
import 'package:student_lms/features/dashboard/screens/dashboard_screen.dart';
import '../data/question_bank.dart';

class QuestionnaireSummary extends StatelessWidget {
  final List<int> answers;

  const QuestionnaireSummary({super.key, required this.answers});

  void _showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
    
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(dialogContext); 
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => DashboardScreen()), // Redirect
          );
        });

        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 50,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Quiz Completed!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const SpinKitFadingCircle(color: Colors.green, size: 50.0),
                const SizedBox(height: 20),
                const Text(
                  'Your answers have been submitted successfully.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Summary")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: answers.length,
        itemBuilder: (context, index) {
          final question = questionBank[index];
          final answerIndex = answers[index];
          final answer = question.options[answerIndex];

          return ListTile(
            title: Text(question.question),
            subtitle: Text("Your Answer: $answer"),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ElevatedButton(
          onPressed: () =>
              _showSuccessPopup(context), // Show popup when pressed
          child: const Text('Submit'),
        ),
      ),
    );
  }
}
