import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_lms/features/dashboard/widgets/assignment_date_picker.dart';
import '../../../providers/assignment_provider.dart';


class AssignmentTimeline extends StatelessWidget {
  const AssignmentTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final assignments = context.watch<AssignmentProvider>().assignments;

    return ListView.separated(
      itemCount: assignments.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final assignment = assignments[index];
        return ListTile(
          title: Text(assignment.title),
          subtitle: Text('Due: ${assignment.dueDate}'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AssignmentDatePickerScreen(index: index, assignment: assignment),
              ),
            );
          },
        );
      },
    );
  }
}
