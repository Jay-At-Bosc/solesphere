class SValidationRules {
  SValidationRules._();
  static final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static final hasUppercase = RegExp(r'[A-Z]');
  static final hasLowercase = RegExp(r'[a-z]');
  static final hasDigit = RegExp(r'[0-9]');
  static final hasSpecialChar = RegExp(r'[!@#$%^&*]');
  static final hasWhitespace = RegExp(r'\s');
  static final emojiRegex = RegExp(
  r'[^\u0000-\uFFFF]',
);
}

class SValidator {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Usename is required';
    }
    if (value.length < 4 || value.length > 25) {
      return 'Username must be between 4 and 25 characters';
    }
    if (!value.contains(SValidationRules.hasUppercase)) {
      return 'Username contain at least one uppercase';
    }
    if (!value.contains(SValidationRules.hasLowercase)) {
      return 'Username contain at least one lowercase';
    }
    if (value.contains(SValidationRules.hasDigit)) {
      return 'Username can not contain any digit ';
    }
    if (!value.contains(SValidationRules.hasSpecialChar)) {
      return 'Username contain at least one Special Character';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!SValidationRules.emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    if (value.length > 320) {
      return 'Email must be less than or equal to 320 characters';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) {
      return 'Password greater than or equal to 8 characters';
    }
    if (value.length > 32) {
      return 'Password less than or equal to 32 characters';
    }
    if (!value.contains(SValidationRules.hasUppercase)) {
      return 'Password contain at least one uppercase letter';
    }
    if (!value.contains(SValidationRules.hasLowercase)) {
      return 'Password contain at least one lowercase letter';
    }
    if (!value.contains(SValidationRules.hasDigit)) {
      return 'Password contain at least one digit ';
    }
    if (!value.contains(SValidationRules.hasSpecialChar)) {
      return "Password contain at least one special character(!@#\$%^&*)";
    }
    if (!value.contains(SValidationRules.hasSpecialChar)) {
      return 'Password can not contain any white Spaces';
    }

    return null;
  }
}
