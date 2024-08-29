
import 'package:cryptog/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    displaySmall: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: tPrimaryColor, // Adjust color as needed
    ),
    displayMedium: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: tPrimaryColor, // Adjust color as needed
    ),
    headlineMedium: TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.bold,
      color: tPrimaryColor, // Adjust color as needed
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      color: tPrimaryColor, // Adjust color as needed
    ),
    bodySmall: TextStyle(
      fontSize: 14.0,
      color: tPrimaryColor, // Adjust color as needed
    ),
  );

  // Optional: Define dark theme by overriding TextTheme properties
  static TextTheme darkTextTheme = TextTheme(
    // Customize properties for dark theme
  );
}
