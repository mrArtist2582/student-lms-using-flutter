import 'package:flutter/material.dart';
import '../models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProvider extends ChangeNotifier {
  // Dummy student data
  Student _student = Student(
    name: 'Kashish darji',
    email: 'kashishdarji25@gmail.com',
    className: 'Class 10',
    schoolName: 'Dhirubhai Ambani International School',
    subjects: ['Math', 'Science', 'English'],
    phone: "1234567890",
    location: 'Gujrat, India',
    profilePicture: 'assets/student.png',
  );

  Student getStudent() => _student;

  // You can update the student data and notify listeners here
  void updateStudent(Student newStudent) {
    _student = newStudent;
    notifyListeners();
  }
  
    void setStudent(Student newStudent) {
    _student = newStudent;
    notifyListeners();
  }
  // Logout functionality
  Future<void> logout() async {
    // You can clear any saved data related to the user, such as in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();  // Clears all preferences data (like login status, etc.)
 


    // Optionally, reset the student data
    _student = Student(
      name: '',
      email: '',
      className: '',
      schoolName: '',
      subjects: [],
      phone: '',
      location: '',
      profilePicture: '',
    );

    // Notify listeners after the logout
    notifyListeners();
  }
}
