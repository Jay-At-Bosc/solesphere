import 'package:flutter/material.dart';

class SColors {
  SColors._();

  // App Basic Colors
  static const Color primary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF1A1B1C);
  static const Color accent = Color(0xFF5B9EE1);

  // Scaffold Background Colors
  static const Color lightBackground = Color(0xFFF8F9FA);
  static final Color darkBackground = const Color(0xFF1A2530).withOpacity(0.99);

  // Gradient Colors
  static const Color gradiantStatingColor = Color(0xFFC0E0FF);
  static final Color gradiantEndingColor =
      const Color(0xFFE2F3F9).withOpacity(0);
  static final Gradient lightLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradiantStatingColor, gradiantEndingColor],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF1A2530);
  static final Color textPrimaryWith80 = SColors.textPrimary.withOpacity(0.8);
  static final Color textPrimaryWith60 = SColors.textPrimary.withOpacity(0.6);
  static const Color textSecondary = Color(0xFF707B81);
  static const Color textAccent = SColors.accent;
  static const Color textWhite = SColors.primary;

  // Hint Text Colors
  static final Color textLabel = SColors.textPrimary.withOpacity(0.8);
  static final Color textHint = SColors.textPrimary.withOpacity(0.4);

  // Background Colors
  // static const Color light = Color(0xFFF8F9FA);
  // static final Color dark = SColors.textPrimary.withOpacity(0.6);
  // static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static final Color darkContainer = SColors.primary.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF5B9EE1);
  static const Color buttonSecondary = Color(0xFF707B81);
  static final Color buttonDisabled = const Color(0xFF828A89).withOpacity(0.2);

  // Bordor Colors
  static const Color borderPrimary = Color(0xFF090909);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFF87265);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Icon Color
  static const Color errorIcon = Color(0xFFF87265);
  static final Color primaryIcon = SColors.textPrimary.withOpacity(0.4);

  // Dot Navigation Color
  static const Color navigationDotColor = Color(0xFFE5EEF7);
  static const Color lightDotColor = Color(0xFFA4CDF6);
  static const Color darkDotColor = Color(0xFF161F28);

  // Button
  static const Color cartBtnColor = Color(0xFFFFD814);
  static const Color buyBtnColor = Color(0xFFFFA41C);

  //product background color
  static const Color backgroundProduct = Color(0xFFE5E5E5);
}
