import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();
  static TextTheme lightThemeTextStyle = TextTheme(
      titleLarge: TextStyle(fontSize: 22, color: Colors.black),
      titleMedium: TextStyle(fontSize: 16, color: Colors.black),
      titleSmall: TextStyle(
          fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 32),
      headlineMedium: TextStyle(fontSize: 28),
      headlineSmall: TextStyle(fontSize: 24));
  static TextTheme darkThemeTextSty = TextTheme();
}
