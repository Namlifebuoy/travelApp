import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveDataLocal(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String> getDataLocal(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? '';
}

Future<dynamic> saveObjectDataLocal(String key, Object object) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, jsonEncode(object));
}

Future<dynamic> getObjectDataLocal(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) != null
      ? jsonDecode(prefs.getString(key)!)
      : null;
}
