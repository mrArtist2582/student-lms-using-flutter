import 'package:flutter/material.dart';
import '../../questionnaire/data/question_bank.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final int selectedIndex;
  final void Function(int) onSelect;

  const QuestionCard({
    super.key,
    required this.question,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.question, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ...List.generate(question.options.length, (index) {
          final option = question.options[index];
          return ListTile(
            title: Text(option),
            leading: Radio<int>(
              value: index,
              groupValue: selectedIndex,
              onChanged: (val) => onSelect(val!),
            ),
          );
        }),
      ],
    );
  }
}
