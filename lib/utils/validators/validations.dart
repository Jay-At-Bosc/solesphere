class SValidationRules {
  SValidationRules._();
  static final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static final hasUppercase = RegExp(r'[A-Z]');
  static final hasLowercase = RegExp(r'[a-z]');
  static final hasDigit = RegExp(r'[0-9]');
  static final hasSpecialChar = RegExp(r'[!@#$%^&*]');
  static final hasWhitespace = RegExp(r'\s');
  static final hasIndianPhoneNo =
      RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$');
  static final hasIndianZipCode = RegExp(r'^\d{6}$');
}

class SValidator {
  static String? validateUsername(String? value) {
    
    if (value == null || value.isEmpty) {
      throw 'Usename is required';
    }
    
    if (value.length < 4 || value.length > 25) {
      throw 'Username must be between 4 and 25 characters';
    }
    if (!value.contains(SValidationRules.hasUppercase)) {
      throw 'Username contain at least one uppercase';
    }
    if (!value.contains(SValidationRules.hasLowercase)) {
      throw 'Username contain at least one lowercase';
    }
    if (value.contains(SValidationRules.hasDigit)) {
      throw 'Username can not contain any digit ';
    }
    
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      throw 'Email is required';
    }
    
    if (!SValidationRules.emailRegex.hasMatch(value)) {
      throw 'Enter a valid email';
    }
    if (value.length > 320) {
      throw 'Email must be less than or equal to 320 characters';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) throw 'Password is required';
    
    if (value.length < 8) {
      throw 'Password greater than or equal to 8 characters';
    }
    if (value.length > 32) {
      throw 'Password less than or equal to 32 characters';
    }
    if (!value.contains(SValidationRules.hasUppercase)) {
      throw 'Password contain at least one uppercase letter';
    }
    if (!value.contains(SValidationRules.hasLowercase)) {
      throw 'Password contain at least one lowercase letter';
    }
    if (!value.contains(SValidationRules.hasDigit)) {
      throw 'Password contain at least one digit ';
    }
    if (!value.contains(SValidationRules.hasSpecialChar)) {
      throw "Password contain at least one special character(!@#\$%^&*)";
    }
    if (!value.contains(SValidationRules.hasSpecialChar)) {
      throw 'Password can not contain any white Spaces';
    }

    return null;
  }

  static String? validateIndianPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      throw 'Mobile No. is required';
    }
    
    if (!value.startsWith("+91")) {
      throw 'Mobile No. must start with +91';
    }
    if (!SValidationRules.hasIndianPhoneNo.hasMatch(value) ||
        value.length > 13 ||
        value.length < 13) {
      throw 'Enter a valid Mobile No.';
    }
    return null;
  }

  static String? validateAddress(String? value, String label) {
    if (value == null || value.isEmpty) {
      throw '$label is required';
    }
    return null;
  }

  static String? validateIndianZipCode(String? value) {
    if (value == null || value.isEmpty) {
      throw 'Zip Code is required';
    }
    if (!SValidationRules.hasIndianZipCode.hasMatch(value)) {
      throw 'Enter a valid Zip Code';
    }
    return null;
  }
}
