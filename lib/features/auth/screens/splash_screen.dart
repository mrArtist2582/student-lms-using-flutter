import 'dart:async';
import 'package:flutter/material.dart';
import 'package:student_lms/routes/app_routes.dart';
import 'package:student_lms/services/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      final storage = StorageService();

      if (!storage.isLoggedIn) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      } else {
        Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.school, size: 100, color: Theme.of(context).primaryColor),
            Text(
              "Student LMS",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
