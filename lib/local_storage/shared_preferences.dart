import 'package:shared_preferences/shared_preferences.dart';

class LoginSharedPreferences {
  static SharedPreferences? _preferences;
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  static const _keyToken = 'token';
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //setting

  static Future setUserEmail(String email) async {
    await _preferences?.setString(_keyEmail, email);
  }

  static Future setUserPassword(String password) async {
    await _preferences?.setString(_keyPassword, password);
  }

  static Future setUserToken(String token) async {
    await _preferences?.setString(_keyToken, token);
  }

//
  static Future clearPref() async {
    await _preferences?.clear();
  }
//getting

  static String? getUserEmail() {
    return _preferences?.getString(_keyEmail);
  }

  static String? getUserPassword() {
    return _preferences?.getString(_keyPassword);
  }

  static String? getUserToken() {
    return _preferences?.getString(_keyToken);
  }
}

// class TokenSharedPreferences {
//   static SharedPreferences? _prefs;
//   static const _keyToken = 'token';
//   static Future init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   static Future setUserToken(String token) async {
//     await _prefs?.setString(_keyToken, "token");
//   }

// //
//   static Future clearTokenPref() async {
//     await _prefs?.clear();
//   }

// //
//   static String? getUserToken() {
//     return _prefs?.getString(_keyToken);
//   }
// }
