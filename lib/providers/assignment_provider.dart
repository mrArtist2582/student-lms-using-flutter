import 'package:flutter/material.dart';
import '../models/assignment.dart';

class AssignmentProvider extends ChangeNotifier {
  final List<Assignment> _assignments = [
    Assignment(title: 'Math Quiz', dueDate: 'May 20, 2025'),
    Assignment(title: 'Science Worksheet', dueDate: 'May 22, 2025'),
    Assignment(title: 'English Essay', dueDate: 'May 24, 2025'),
  ];

  List<Assignment> get assignments => _assignments;

  void updateAssignmentDate(int index, String newDate) {
    _assignments[index] = Assignment(
      title: _assignments[index].title,
      dueDate: newDate,
    );
    notifyListeners();
  }
}
