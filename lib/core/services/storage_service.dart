import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _userIdKey = 'user_id';
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  Future<void> saveUserId(String userId) async {
    await _prefs.setString(_userIdKey, userId);
  }

  String? getUserId() {
    return _prefs.getString(_userIdKey);
  }

  Future<void> removeUserId() async {
    await _prefs.remove(_userIdKey);
  }

  bool hasUserId() {
    return _prefs.containsKey(_userIdKey);
  }
}
