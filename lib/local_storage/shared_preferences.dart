import 'package:shared_preferences/shared_preferences.dart';

class LoginSharedPreferences {
  static SharedPreferences? _preferences;
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUserEmail(String email) async {
    await _preferences?.setString(_keyEmail, email);
  }

  static String? getUserEmail() {
    return _preferences?.getString(_keyEmail);
  }

  static Future setUserPassword(String password) async {
    await _preferences?.setString(_keyPassword, password);
  }

  static String? getUserPassword() {
    return _preferences?.getString(_keyPassword);
  }
}
