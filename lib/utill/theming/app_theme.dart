import 'package:flutter/material.dart';
import 'package:newstrack/utill/theming/app_color.dart';
import 'package:newstrack/utill/theming/app_text_style.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,

      //Primary (AppBar, buttons, active elements)
      primary: AppColor.primaryColor,
      onPrimary: AppColor.onPrimaryColor,

      //Secondary (Category tags, highlights)
      secondary: AppColor.secondaryColor,
      onSecondary: AppColor.onSecondaryColor,

      // Error
      error: AppColor.error,
      onError: AppColor.onError,

      // 📰 Surface (cards, containers)
      surface: AppColor.surface,
      onSurface: AppColor.onSurface,
    ),
    textTheme: AppTextStyle.lightThemeTextStyle,
    scaffoldBackgroundColor: AppColor.backgroundColor,
  );

  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
