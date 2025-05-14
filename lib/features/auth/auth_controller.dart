import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static final AuthController _instance = AuthController._internal();
  factory AuthController() => _instance;
  AuthController._internal();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

    Future<bool> login(String email, String password) async {
    if (email == "kashishdarji25@gmail.com" && password == "password123") {
      await _prefs.setBool('isLoggedIn', true);
      await _prefs.setString('loggedInEmail', email);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await _prefs.remove('isLoggedIn');
    await _prefs.remove('loggedInEmail');
  }

  bool isLoggedIn() {
    return _prefs.getBool('isLoggedIn') ?? false;
  }

  String? getLoggedInEmail() {
    return _prefs.getString('loggedInEmail');
  }
}
