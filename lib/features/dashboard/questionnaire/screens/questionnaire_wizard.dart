import 'package:flutter/material.dart';
import 'package:student_lms/services/storage_service.dart';
import '../../questionnaire/data/question_bank.dart';
import '../../questionnaire/screens/question_step.dart';
import 'questionnaire_summary.dart';

class QuestionnaireWizard extends StatefulWidget {
  const QuestionnaireWizard({super.key});

  @override
  State<QuestionnaireWizard> createState() => _QuestionnaireWizardState();
}

class _QuestionnaireWizardState extends State<QuestionnaireWizard> {
  int currentIndex = 0;
  final List<int> selectedOptions = List.filled(questionBank.length, -1);

  void _next() {
    if (currentIndex == questionBank.length - 1) {
      // Save answers when at the last question
      StorageService().saveAnswers(selectedOptions);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => QuestionnaireSummary(answers: selectedOptions),
        ),
      );
    } else {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _prev() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionnaire'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questionBank[currentIndex].question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            QuestionStep(
              currentIndex: currentIndex,
              selectedIndex: selectedOptions[currentIndex],
              onOptionSelected: (val) {
                setState(() {
                  selectedOptions[currentIndex] = val;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (currentIndex > 0)
              ElevatedButton(
                onPressed: _prev,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Back"),
              ),
            ElevatedButton(
              onPressed: selectedOptions[currentIndex] != -1 ? _next : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedOptions[currentIndex] != -1 ? Colors.green : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(currentIndex == questionBank.length - 1 ? "Finish" : "Next"),
            ),
          ],
        ),
      ),
    );
  }
}
