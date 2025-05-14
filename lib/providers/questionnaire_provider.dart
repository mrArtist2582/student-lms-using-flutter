import 'package:flutter/material.dart';
import '../models/questionnaire_answer.dart';

class QuestionnaireProvider with ChangeNotifier {
  final List<QuestionnaireAnswer> _answers = [];

  List<QuestionnaireAnswer> get answers => _answers;

  void updateAnswer(int questionIndex, String answer) {
    // Logic to update answer in the list
    if (questionIndex < _answers.length) {
      _answers[questionIndex] = QuestionnaireAnswer(answer: answer, questionId: '');
    } else {
      _answers.add(QuestionnaireAnswer(answer: answer, questionId: ''));
    }
    notifyListeners();
  }

  List<QuestionnaireAnswer> getQuestionnaireAnswers() {
    return _answers;
  }
}
