import 'package:flutter/material.dart';

class StepProgressIndicator extends StatelessWidget {
  final int current;
  final int total;

  const StepProgressIndicator({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: current / total,
      backgroundColor: Colors.grey[300],
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
