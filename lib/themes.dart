import 'package:flutter/material.dart';

class CustomThemes {
  static final ThemeData darkTheme = ThemeData(
    backgroundColor: const Color(0xFF121212),
    primaryColor: const Color(0xFF1D1D1D),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 25,
        fontFamily: "Akrobat",
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 30,
        fontFamily: "Akrobat",
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 50,
        fontFamily: "Akrobat",
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    backgroundColor: const Color(0xFFDFDEDE),
    primaryColor: const Color(0xFFD7D8D9),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 25,
        fontFamily: "Akrobat",
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 30,
        fontFamily: "Akrobat",
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 50,
        fontFamily: "Akrobat",
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
