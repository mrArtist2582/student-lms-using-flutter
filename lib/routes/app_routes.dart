import 'package:flutter/material.dart';
import 'package:student_lms/features/dashboard/questionnaire/screens/questionnaire_wizard.dart';
import 'package:student_lms/features/dashboard/screens/student_profile_screen.dart';
import 'package:student_lms/features/planner/screens/daily_plan_screen.dart';
import 'package:student_lms/features/planner/screens/weekly_plan_screen.dart';
import 'package:student_lms/features/progress/screens/progress_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/splash_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const dailyplanner = '/dailyPlan';
  static const weeklyplanner = '/weeklyPlan';
  static const questionnaire = '/questionnaire';
  static const progress = '/progress';
  static const profile ='/about_student';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    dashboard: (context) => const DashboardScreen(),
    questionnaire :(context) => const QuestionnaireWizard(),
    dailyplanner:(context) => const DailyPlanScreen(),
    weeklyplanner:(context) => const WeeklyPlanScreen(),
    progress :(context) => const ProgressScreen(),
    profile :(context) => const StudentProfileScreen(), // Placeholder for profile screen
   // Placeholder for questionnaire screen
    // Add more routes later...
  };
}
