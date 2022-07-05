import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static bool isDarkMode = false;
  static SharedPreferences? _preference;
  final _key = 'isDarkMode';

  static Future init() async {
    _preference = await SharedPreferences.getInstance();
  }

  Future setThemeMode(bool isDarkMode) async {
    await _preference!.setBool(_key, isDarkMode);
  }

  ThemeMode get theme => _loadFromStorage() ? ThemeMode.dark : ThemeMode.light;

  bool _loadFromStorage() {
    return _preference!.getBool(_key) ?? false;
  }

  /// Switch theme and save to local storage

  Future switchTheme() async {
    _loadFromStorage()
        ? Get.changeThemeMode(ThemeMode.light)
        : Get.changeThemeMode(ThemeMode.dark);

    await setThemeMode(!_loadFromStorage());
  }

  Future switchToSystem() async {
    Get.changeThemeMode(ThemeMode.system);

    if (ThemeMode.system == ThemeMode.dark) {
      await setThemeMode(true);
    } else {
      await setThemeMode(false);
    }
  }
}
