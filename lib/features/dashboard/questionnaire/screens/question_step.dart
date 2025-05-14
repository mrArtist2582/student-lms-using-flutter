import 'package:flutter/material.dart';
import '../../questionnaire/widgets/question_card.dart';
import '../../questionnaire/data/question_bank.dart';
import '../../questionnaire/widgets/progress_indicator.dart';

class QuestionStep extends StatelessWidget {
  final int currentIndex;
  final int selectedIndex;
  final Function(int) onOptionSelected;

  const QuestionStep({
    super.key,
    required this.currentIndex,
    required this.selectedIndex,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final question = questionBank[currentIndex];

    return Column(
      children: [
        StepProgressIndicator(current: currentIndex + 1, total: questionBank.length),
        const SizedBox(height: 24),
        QuestionCard(
          question: question,
          selectedIndex: selectedIndex,
          onSelect: onOptionSelected,
        ),
      ],
    );
  }
}
