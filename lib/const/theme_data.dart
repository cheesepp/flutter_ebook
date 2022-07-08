import 'package:flutter/material.dart';

class ThemeMode {
  static final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: const Color(0xff121212),
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black,
  );

  static final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    brightness: Brightness.light,
    primaryColor: const Color(0xffF6FBF4),
    fontFamily: 'CharisSIL',
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white,
  );
}
