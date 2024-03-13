// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:auth_google/signup/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Builder Id
  final String passwordId = "SignupPassword";
  final String confirmpasswordId = "SignupConfirmPassword";

  /// Input Controller
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final FocusNode userNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode confirmPasswordNode = FocusNode();

  final isPasswordVisible = true.obs;
  final isConfirmPasswordVisible = true.obs;

  void registerUser(String email, String password) {
    // AuthenticationRepository.instance
    //     .createUserWithEmailAndPassword(email, password);
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update([passwordId]);
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
    update([confirmpasswordId]);
  }

  bool get ispasswordVisible => isPasswordVisible.value;
  bool get isconfirmpasswordVisible => isConfirmPasswordVisible.value;

  @override
  void onClose() {
    /// Controller Dispose
    username.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();

    /// Focusnodes Dispose
    userNode.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    confirmPassword.dispose();

    super.onClose();
  }
}
