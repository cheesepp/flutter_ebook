import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static bool isDarkMode = false;
  static SharedPreferences? _preference;
  final _key = 'isDarkMode';
  final _textThemeKey = 'light_mode'.tr;
  static Future init() async {
    _preference = await SharedPreferences.getInstance();
  }

  Future setThemeMode(bool isDarkMode) async {
    await _preference!.setBool(_key, isDarkMode);
  }

  ThemeMode get theme => _loadFromStorage() ? ThemeMode.dark : ThemeMode.light;

  static bool hasDarkMode() => ThemeService().theme == ThemeMode.dark;

  Future setTextTheme(String text) async =>
      await _preference!.setString(_textThemeKey, text);

  getTextTheme() => _preference!.getString(_textThemeKey) ?? 'light_mode'.tr;

  bool _loadFromStorage() {
    return _preference!.getBool(_key) ?? false;
  }

  /// Switch theme and save to local storage

  void switchTheme() {
    _loadFromStorage()
        ? Get.changeThemeMode(ThemeMode.light)
        : Get.changeThemeMode(ThemeMode.dark);

    setThemeMode(!_loadFromStorage());
  }

  void switchToSystem() {
    Get.changeThemeMode(ThemeMode.system);

    if (ThemeMode.system == ThemeMode.dark) {
      setThemeMode(true);
    } else {
      setThemeMode(false);
    }
  }
}
