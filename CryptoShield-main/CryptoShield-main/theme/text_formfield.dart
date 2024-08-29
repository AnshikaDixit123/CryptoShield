
import 'package:cryptog/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme { TTextFormFieldTheme._();   

static InputDecorationTheme lightInputDecorationTheme = const InputDecorationTheme( 
  border: OutlineInputBorder(),  
  prefixIconColor: tAccentColor, 
  floatingLabelStyle: TextStyle(color: tAccentColor),  
  focusedBorder: OutlineInputBorder( 
    borderSide: BorderSide(width: 2, color: tPrimaryColor),
      ),
    );   
  
}