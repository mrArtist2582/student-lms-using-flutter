import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routeName;
  final void Function() onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.routeName,
    required this.onTap, // Pass the onTap function here
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the passed onTap function
      child: Container(
        width: 160,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.indigo.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.indigo),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
