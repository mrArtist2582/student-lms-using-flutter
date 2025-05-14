import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faq = [
      {
        'question': 'How do I log in?',
        'answer': 'You can log in using your registered email and password.'
      },
      {
        'question': 'How to reset password?',
        'answer': 'Click on forgot password on login screen and follow instructions.'
      },
      {
        'question': 'How to access my subjects?',
        'answer': 'Navigate to the profile or dashboard to view your subjects.'
      },
      {
        'question': 'Can I edit my profile?',
        'answer': 'Yes, go to profile and tap on edit.'
      },
      {
        'question': 'What if I forget my login credentials?',
        'answer': 'Use the "forgot password" option or contact support.'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(title: const Text("Help & Support"),
      backgroundColor: Colors.indigo.shade100,),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: faq.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            leading: Icon(Icons.help_outline, color: Colors.indigo[400]),
            title: Text(faq[index]['question']!),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(faq[index]['answer']!),
              ),
            ],
          );
        },
      ),
    );
  }
}
