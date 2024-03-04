import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'text_theme.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._(); 

  // Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: SSizes.buttonElevation,
      foregroundColor: SColors.primary,
      backgroundColor: SColors.accent,
      disabledForegroundColor: SColors.secondary,
      disabledBackgroundColor: SColors.buttonDisabled,
      padding: const EdgeInsets.symmetric(vertical: SSizes.buttonPadding,horizontal: SSizes.buttonPadding *2),
      textStyle: STextTheme.lightTextTheme.titleLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.buttonRadius)),
    ),
  );

  // Dark Theme 
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: SSizes.buttonElevation,
      foregroundColor: SColors.primary,
      backgroundColor: SColors.accent,
      disabledForegroundColor: SColors.secondary,
      disabledBackgroundColor: SColors.buttonDisabled,
      padding: const EdgeInsets.symmetric(vertical: SSizes.buttonPadding,horizontal: SSizes.buttonPadding *2),
      textStyle: STextTheme.darkTextTheme.titleLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.buttonRadius)),
    ),
  );
}
