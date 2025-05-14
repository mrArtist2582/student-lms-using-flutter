import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  late SharedPreferences _prefs;

  factory StorageService() => _instance;

  StorageService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Login Status
  Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool('isLoggedIn', value);
  }

  bool get isLoggedIn => _prefs.getBool('isLoggedIn') ?? false;

  // Onboarding Status
  Future<void> setOnboardingSeen(bool value) async {
    await _prefs.setBool('onboardingSeen', value);
  }

  bool get hasSeenOnboarding => _prefs.getBool('onboardingSeen') ?? false;

  // Questionnaire Answers (stored as comma-separated)
  Future<void> saveAnswers(List<int> answers) async {
    await _prefs.setString('answers', answers.join(','));
  }

  List<int> getSavedAnswers() {
    final data = _prefs.getString('answers');
    if (data == null || data.isEmpty) return [];
    return data.split(',').map(int.parse).toList();
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
