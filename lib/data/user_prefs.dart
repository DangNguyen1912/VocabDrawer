import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocab_drawer/main.dart';

class UserPrefs {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool isDarkMode() {
    return _prefs?.getBool('is_dark_mode') ?? false;
  }

  static Future<void> setDarkMode(bool isDark) async {
    print(isDark);
    await _prefs?.setBool('is_dark_mode', isDark);
    currentModeNotifier.value = UserPrefs.isDarkMode()
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
