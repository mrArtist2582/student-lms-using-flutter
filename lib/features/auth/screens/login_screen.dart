import 'package:flutter/material.dart';
import 'package:student_lms/features/auth/auth_controller.dart';
import 'package:student_lms/features/auth/screens/register_screen.dart';
import '../../../routes/app_routes.dart';
import '../widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    // ✅ Access the singleton instance
    final authController = AuthController();
    bool success = await authController.login(
      _emailController.text,
      _passwordController.text,
    );

    setState(() => _loading = false);

    if (success && mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isWide ? 400 : double.infinity,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Icon(
                    Icons.school,
                    size: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    "Student LMS",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Login with Student with your credentials",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AuthTextField(
                    controller: _emailController,
                    label: "Email",
                    prefixIcon: Icons.email,
                    validator: (value) => value == null || !value.contains('@')
                        ? "Enter valid email"
                        : null,
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    controller: _passwordController,
                    label: "Password",
                    obscureText: true,
                    isPassword: true,
                    prefixIcon: Icons.lock,
                    validator: (value) => value == null || value.length < 6
                        ? "Minimum 6 characters"
                        : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 140,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _loading ? null : _login,
                    child: _loading
                        ? const CircularProgressIndicator()
                        : const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          
                  ),
                  SizedBox(height: 10,),
                  Text("Or",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),),

                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterPage()));
                  }, child: Text("New Student..Register your self..",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.indigo.shade400
                  ),),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
