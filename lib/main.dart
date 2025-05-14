  import 'package:flutter/material.dart';
  import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_lms/features/auth/auth_controller.dart';
import 'package:student_lms/providers/assignment_provider.dart';
  import 'package:student_lms/providers/questionnaire_provider.dart';
  import 'package:student_lms/providers/student_provider.dart';
  import 'routes/app_routes.dart';
  import 'theme/dark_theme.dart';
  import 'theme/light_theme.dart';
  import 'package:provider/provider.dart';



final AuthController authController = AuthController();
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await authController.init();
    
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;

    runApp(MyApp(isDark: isDark));
  }

  class MyApp extends StatelessWidget {
    final bool isDark;

    const MyApp({super.key, required this.isDark});

    @override
    Widget build(BuildContext context) {
      return   MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => StudentProvider()),
          ChangeNotifierProvider(create: (_) => QuestionnaireProvider()),
          ChangeNotifierProvider(create: (_) => AssignmentProvider())
        ],
        child:MaterialApp(
        
        title: 'Student LMS',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.routes,
      ));
    }
  }
