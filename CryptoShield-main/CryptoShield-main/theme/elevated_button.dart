
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/constants/sizes.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
 TElevatedButtonTheme._();
 
 static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: tCardBgColor,
      backgroundColor: tPrimaryColor,
      side:const BorderSide(color:tPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight)
    ),
 );
 
}