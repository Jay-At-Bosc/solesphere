import 'package:flutter/material.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/elevated_button_theme.dart';

import '../constants/colors.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/text_theme.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'AirbnbCereal',
    brightness: Brightness.light,
    scaffoldBackgroundColor: SColors.lightBackground,
    
    textTheme: STextTheme.lightTextTheme,
    // chipTheme: TChipTheme.lightChipTheme,
    // scaffoldBackgroundColor: TColors.white,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    checkboxTheme: SCheckboxTheme.lightCheckboxTheme,
    // bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    // elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    // inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'AirbnbCereal',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: SColors.darkBackground,
    primaryColor: SColors.darkDotColor,
    textTheme: STextTheme.darkTextTheme,
    appBarTheme: SAppBarTheme.darkAppBarTheme,
    checkboxTheme: SCheckboxTheme.darkCheckboxTheme,
    // disabledColor: TColors.grey,
    // chipTheme: TChipTheme.darkChipTheme,
    // scaffoldBackgroundColor: TColors.black,
    // bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    //elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    // outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    // inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
