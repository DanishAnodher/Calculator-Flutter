import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  Color inactive = const Color(0xFF6D788F);
  Color light = const Color(0xFF121212);
  Color dark = const Color(0xFF6D788F);

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    if (isOn) {
      light = inactive;
      dark = const Color(0xFFDFDEDE);
    } else {
      dark = inactive;
      light = const Color(0xFF121212);
      // light = Colors.amber;
    }
    notifyListeners();
  }
}
