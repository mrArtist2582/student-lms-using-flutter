import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/assignment.dart';
import '../../../providers/assignment_provider.dart';

class AssignmentDatePickerScreen extends StatefulWidget {
  final int index;
  final Assignment assignment;

  const AssignmentDatePickerScreen({
    super.key,
    required this.index,
    required this.assignment,
  });

  @override
  State<AssignmentDatePickerScreen> createState() =>
      _AssignmentDatePickerScreenState();
}
class _AssignmentDatePickerScreenState
    extends State<AssignmentDatePickerScreen> {
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });

      final formattedDate =
          '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';

      // Update the provider
      // ignore: use_build_context_synchronously
      Provider.of<AssignmentProvider>(context, listen: false)
          .updateAssignmentDate(widget.index, formattedDate);

      // ignore: use_build_context_synchronously
      Navigator.pop(context); // Go back after updating
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData subjectIcon;
    Color subjectColor;
    String subjectTitle;

    // Basic subject-icon-color mapping (expand as needed)
    switch (widget.assignment.title.toLowerCase()) {
      case 'math quiz':
        subjectIcon = Icons.calculate;
        subjectTitle = "Maths Quiz";
        subjectColor = Colors.indigo.shade100;
        break;
      case 'science worksheet':
        subjectIcon = Icons.science;
        subjectTitle = "Science Worksheet";
        subjectColor = Colors.indigo.shade100;
        break;
      case 'english essay':
        subjectIcon = Icons.menu_book;
        subjectTitle = "English Essay";
        subjectColor = Colors.indigo.shade100;
        break;
      default:
        subjectIcon = Icons.school;
        subjectTitle = "Assignment";
        subjectColor = Colors.indigo.shade100;
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.assignment.title)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: subjectColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(subjectIcon, size: 100, color: Colors.indigo),
                    const SizedBox(height: 20),
                    Text(
                      subjectTitle,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: _pickDate,
              child: const Text('Pick New Due Date', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
