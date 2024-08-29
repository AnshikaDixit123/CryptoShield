
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/constants/sizes.dart';
import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
 TOutlinedButtonTheme._();
 
 static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    shape: const RoundedRectangleBorder(),
    foregroundColor: tPrimaryColor,
    side:const BorderSide(color:tPrimaryColor),
    padding: const EdgeInsets.symmetric(vertical: tButtonHeight)
   ),
 );
}