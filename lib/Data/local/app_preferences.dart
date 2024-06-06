import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_USER_LOGIN = "USER_LOGIN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  String? get userToken => _sharedPreferences.getString(PREFS_KEY_USER_LOGIN);

  Future<void> login(String userId) => _sharedPreferences.setString(PREFS_KEY_USER_LOGIN, userId);

  Future<void> logout() async {
    await _sharedPreferences.remove(PREFS_KEY_USER_LOGIN);
  }
}
