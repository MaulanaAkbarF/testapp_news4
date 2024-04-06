import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static const String _keyName = 'name';
  static const String _keyUsername = 'username';
  static const String _keyPassword = 'password';
  static const String _keyWhatsapp = 'whatsapp';

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Setter
  Future<void> saveNameData(String name) async {
    await _prefs.setString(_keyName, name);
  }

  Future<void> saveUsernameData(String username) async {
    await _prefs.setString(_keyName, username);
  }

  Future<void> savePasswordData(String password) async {
    await _prefs.setString(_keyName, password);
  }

  Future<void> saveWhatsappData(int whatsapp) async {
    await _prefs.setInt(_keyName, whatsapp);
  }

  // Getter
  String getName() {
    return _prefs.getString(_keyName) ?? "";
  }

  String getUsername() {
    return _prefs.getString(_keyUsername) ?? "";
  }

  String getPassword() {
    return _prefs.getString(_keyPassword) ?? "";
  }

  int getWhatsapp() {
    return _prefs.getInt(_keyWhatsapp) ?? 0;
  }
}
