import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> deleteItem(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    return;
  }

  static Future<void> addItem(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    return;
  }

  static Future<bool> hasItem(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? item = prefs.getString(key);

    return item != null;
  }

  static Future<String> getItem(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? item = prefs.getString(key);

    return item ?? '';
  }
}
