import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._(); // Prevent instantiation

  // 🔹 EdgeInsets Constants
  static const EdgeInsets screenPadding =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
  static const EdgeInsets cardPadding = EdgeInsets.all(12.0);
  static const EdgeInsets listItemPadding =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
  static const EdgeInsets formFieldPadding =
      EdgeInsets.symmetric(vertical: 8.0);

  // 🔹 SizedBox Constants
  static const SizedBox gap4 = SizedBox(height: 4.0);
  static const SizedBox gap8 = SizedBox(height: 8.0);
  static const SizedBox gap12 = SizedBox(height: 12.0);
  static const SizedBox gap16 = SizedBox(height: 16.0);
  static const SizedBox gap24 = SizedBox(height: 24.0);
  static const SizedBox gap32 = SizedBox(height: 32.0);

  // 🔹 Spacing Values (for spacing values only)
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
}
