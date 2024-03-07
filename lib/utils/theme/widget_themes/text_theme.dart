import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Custom Class for Light & Dark Text Themes
class STextTheme {
  STextTheme._(); // To avoid creating instances

  /// Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: SSizes.fontSizeXxxl,
      color: SColors.textPrimaryWith80,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // onboarding title
    displayMedium: const TextStyle(
      fontSize: SSizes.fontSizeXl,
      color: SColors.textSecondary,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // onboarding subtitle / login subtitle
    displaySmall: const TextStyle(
      fontSize: SSizes.fontSizeXs,
      color: SColors.textAccent,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // link style

    headlineLarge: const TextStyle(
      fontSize: SSizes.fontSizeXxl,
      color: SColors.textPrimary,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      fontSize: SSizes.fontSizeXl,
      color: SColors.textPrimaryWith80,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: const TextStyle(
      fontSize: SSizes.fontSizeSm,
      color: SColors.textWhite,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ),

<<<<<<< HEAD
    titleLarge: const TextStyle(
      fontSize: SSizes.fontSizeLg,
      color: SColors.textWhite,
=======
    titleLarge: TextStyle(
      fontSize: SSizes.fontSizeLg,
      color: SColors.dark,
>>>>>>> c87f241e056c228e76a1731abd1b9cff5f0e564f
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // button text theme
    titleMedium: TextStyle(
      fontSize: SSizes.fontSizeLg,
      color: SColors.textPrimaryWith80,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // price // google sign in
    titleSmall: const TextStyle(
      fontSize: SSizes.fontSizeSm,
      color: SColors.secondary,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ),

    bodyLarge: TextStyle(
      fontSize: SSizes.fontSizeMd,
      color: SColors.textPrimaryWith80,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: SSizes.fontSizeSm,
      color: SColors.textPrimaryWith80,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // input style / forgot password style
    bodySmall: const TextStyle(
      fontSize: SSizes.fontSizeXs,
      color: SColors.textSecondary,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // account end style // short desc

    labelLarge: const TextStyle(
      fontSize: SSizes.fontSizeMd,
      color: SColors.textPrimary,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // label style
    labelMedium: TextStyle(
      fontSize: SSizes.fontSizeSm,
      color: SColors.textPrimaryWith60,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // hint style
    labelSmall: const TextStyle(
      fontSize: SSizes.fontSizeXs,
      color: SColors.error,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // error size
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
<<<<<<< HEAD
    displayLarge: const TextStyle(
      fontSize: SSizes.fontSizeXxxl,
      color: SColors.textWhite,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // onboarding title
    displayMedium: TextStyle(
      fontSize: SSizes.fontSizeXl,
      color: SColors.primary.withOpacity(0.5),
=======
    displayLarge: TextStyle(
      fontSize: SSizes.fontSizeXxxl,
      color: SColors.textPrimaryWith80,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // onboarding title
    displayMedium: const TextStyle(
      fontSize: SSizes.fontSizeXl,
      color: SColors.textSecondary,
>>>>>>> c87f241e056c228e76a1731abd1b9cff5f0e564f
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // onboarding subtitle / login subtitle
    displaySmall: const TextStyle(
      fontSize: SSizes.fontSizeXs,
      color: SColors.textAccent,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // link style

    headlineLarge: const TextStyle(
      fontSize: SSizes.fontSizeXxl,
      color: SColors.textPrimary,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      fontSize: SSizes.fontSizeXl,
<<<<<<< HEAD
      color: SColors.textPrimaryWith80,
=======
      color: SColors.textWhite,
>>>>>>> c87f241e056c228e76a1731abd1b9cff5f0e564f
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: const TextStyle(
      fontSize: SSizes.fontSizeSm,
      color: SColors.textWhite,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ),

    titleLarge: const TextStyle(
      fontSize: SSizes.fontSizeLg,
      color: SColors.textWhite,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // button text theme
    titleMedium: TextStyle(
      fontSize: SSizes.fontSizeLg,
      color: SColors.textPrimaryWith80,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // price // google sign in
    titleSmall: const TextStyle(
      fontSize: SSizes.fontSizeSm,
      color: SColors.secondary,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ),

<<<<<<< HEAD
    bodyLarge: TextStyle(
      fontSize: SSizes.fontSizeMd,
      color: SColors.textPrimaryWith80,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: SSizes.fontSizeSm,
      color: SColors.textPrimaryWith80,
=======
    bodyLarge: const TextStyle(
      fontSize: SSizes.fontSizeMd,
      color: SColors.textWhite,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: const TextStyle(
      fontSize: SSizes.fontSizeSm,
      color: SColors.textWhite,
>>>>>>> c87f241e056c228e76a1731abd1b9cff5f0e564f
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // input style / forgot password style
    bodySmall: const TextStyle(
      fontSize: SSizes.fontSizeXs,
<<<<<<< HEAD
      color: SColors.textSecondary,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
=======
      color: SColors.textWhite,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w400,
>>>>>>> c87f241e056c228e76a1731abd1b9cff5f0e564f
    ), // account end style // short desc

    labelLarge: const TextStyle(
      fontSize: SSizes.fontSizeMd,
      color: SColors.textPrimary,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // label style
    labelMedium: TextStyle(
      fontSize: SSizes.fontSizeSm,
      color: SColors.textPrimaryWith60,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // hint style
    labelSmall: const TextStyle(
      fontSize: SSizes.fontSizeXs,
      color: SColors.error,
      fontFamily: 'AirbnbCereal',
      fontWeight: FontWeight.w500,
    ), // error size
  );
}
