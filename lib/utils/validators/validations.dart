class SValidator {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 4 || value.length > 25) {
      return 'Username must be between 4 and 25 characters';
    }
    if (!value.contains(RegExp(r'[a-z]')) ||
        !value.contains(RegExp(r'[A-Z]')) ||
        value.contains(RegExp(r'\s'))) {
      return 'Username must contain at least one lowercase letter, one uppercase letter, and no whitespace';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    if (value.length > 320) {
      return 'Email must be less than or equal to 320 characters';
    }
    return null;
  }

//   static String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }
//     if (value.length < 8) {
//       return 'Password must be at least 8 characters long';
//     }
//    if (!value.contains(RegExp(r'[a-z]')) ||
//     !value.contains(RegExp(r'[A-Z]')) ||
//     !value.contains(RegExp(r'\d')) ||
//     !value.contains(RegExp(r'[!@#\$%^&*()_+{}|":<>?~\-=[\]\\;\',./]'))) {
//   return 'Password must contain at least one lowercase letter, one uppercase letter, one digit, and one special character';
// }
// if (value.contains(RegExp(r'\s'))) {
//   return 'Password cannot contain whitespace';
// }
// return null;
// }
}
