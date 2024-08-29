
import 'package:cryptog/theme/elevated_button.dart';
import 'package:cryptog/theme/outline_button.dart';
import 'package:cryptog/theme/text_formfield.dart';
import 'package:cryptog/theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme{
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
}