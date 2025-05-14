import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_lms/features/auth/screens/login_screen.dart';
import '../../../providers/student_provider.dart';
import '../../../models/student.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _classNameController = TextEditingController();
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _subjectsController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _registerStudent() {
    if (_formKey.currentState!.validate()) {
      final newStudent = Student(
        name: _nameController.text.trim(),
        location: _locationController.text.trim(),
        className: _classNameController.text.trim(),
        schoolName: _schoolNameController.text.trim(),
        subjects: _subjectsController.text.trim().split(',').map((e) => e.trim()).toList(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        profilePicture: "assets/student.png", // static asset
      );

      Provider.of<StudentProvider>(context, listen: false).setStudent(newStudent);

      Navigator.pushReplacementNamed(context, '/dashboard'); // Or wherever you want
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Registration")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Static Profile Picture
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/student.png"),
              ),
              const SizedBox(height: 20),

              _buildTextField(_nameController, "Name"),
              _buildTextField(_locationController, "Location"),
              _buildTextField(_classNameController, "Class"),
              _buildTextField(_schoolNameController, "School Name"),
              _buildTextField(_subjectsController, "Subjects (comma separated)"),
              _buildTextField(_emailController, "Email", keyboardType: TextInputType.emailAddress),
              _buildTextField(_phoneController, "Phone", keyboardType: TextInputType.phone),

              const SizedBox(height: 24),
              ElevatedButton(
                style:ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 140,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                onPressed: _registerStudent,
                child: const Text("Register",
                style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
              ),

              SizedBox(height: 20,),
              Text("Or",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
              }, child: Text("Already have Account? go to login", style: TextStyle(
                    fontSize: 18,
                    color: Colors.indigo.shade400
                  ),))
            ],
            
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) => value == null || value.isEmpty ? 'Please enter $label' : null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
