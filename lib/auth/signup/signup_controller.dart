// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:auth_google/signup/authentication_repository.dart';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:solesphere/services/repositories/authentication.dart';
import 'package:solesphere/services/routes/app_pages.dart';

import '../../common/widgets/popup/loaders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Builder Id
  final String signUpForm = "SignUpForm";
  final String passwordId = "SignupPassword";
  final String confirmpasswordId = "SignupConfirmPassword";
  final String registerButtonId = "Register";
  final String signupWithGoogleButtonId = "SignupWithGoogle";

  /// Input Controller
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  /// Global Form Key
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Button Loader
  bool _isRegisterLoading = false;
  bool _isGoogleLoading = false;

  final _isPasswordVisible = true.obs;
  final _isConfirmPasswordVisible = true.obs;

  /// Getter
  bool get ispasswordVisible => _isPasswordVisible.value;
  bool get isconfirmpasswordVisible => _isConfirmPasswordVisible.value;
  bool get isRegisterLoading => _isRegisterLoading;
  bool get isGoogleLoading => _isGoogleLoading;
  bool get isMainLoading => _isRegisterLoading || isGoogleLoading;
  void get isPasswordMatched => password.text != confirmPassword.text
      ? throw "Password Not Matched"
      : null;
  void get checkFormValidation =>
      !signupFormKey.currentState!.validate() ? throw "" : null;

  /// Setter
  set isRegisterLoading(bool value) {
    _isRegisterLoading = value;
    update([registerButtonId]);
  }

  set isGoogleLoading(bool value) {
    _isGoogleLoading = value;
    update([signupWithGoogleButtonId]);
  }

  /// Methods
  // Register User
  Future<void> signupWithEmailPassword() async {
    log("signupWithEmailPassword method called");
    try {
      // Form Validation

      isPasswordMatched; // Checks Password is matched or not

      checkFormValidation; // Checks All Fields Validations

      isRegisterLoading = true; // Sets Register Loading to true

      // User Creation API Call For Firebase
      final userCredential = await AuthenticationRepository.instance
          .signUpWithEmailAndPassword(email.text.trim(), password.text.trim());

      log("uid : ${userCredential.user!.uid}");

      TLoaders.successSnackBar(title: 'Success', message: "Account created Succefully");

      // Get.snackbar("Success", "Account created Succefully",
      //     duration: const Duration(seconds: 2),
      //     snackPosition: SnackPosition.BOTTOM);

      navigateToUserDetails();
    } catch (e) {
      // shown exception which is thrown
      TLoaders.warningSnackBar(title: 'Error', message: e.toString());
      // Get.snackbar("Error", e.toString(),
      //     snackPosition: SnackPosition.BOTTOM,
      //     duration: const Duration(seconds: 2));
    } finally {
      isRegisterLoading = false; // Sets Register Loading to false
    }
  }

  // Register User With Google
  Future<void> signupWithGoogle() async {
    log("signupWithGoogle method called");
    try {
      // repo call
      isGoogleLoading = true; // Sets Register Loading to true

      final creds = await AuthenticationRepository.instance.signUpWithGoogle();
      log(" ${creds.credential!.accessToken}");
      log(" ${creds.credential!.providerId}");
      // log(" ${creds.credential!.}");

      navigateToUserDetails();
    } catch (e) {
      // shown exception which is thrown
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } finally {
      isGoogleLoading = false; // Sets Register Loading to false
    }
  }

  // Toggle Password
  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
    update([passwordId]);
  }

  // Toggle Confirm Password
  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible.value = !_isConfirmPasswordVisible.value;
    update([confirmpasswordId]);
  }

  // Navigation Signup to UserDetails
  void navigateToUserDetails() => Get.offAllNamed(Routes.userDetail);

  @override
  void onClose() {
    /// Controller Dispose
    username.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();

    super.onClose();
  }
}

// Check Internet Connectivity
// final isConnected = await Get.find<NetworkManager>().isConnected();
// if (!isConnected) return;

// Start Loading
// SCustomFullScreenLoader.openLoadDialog("Processing...", "");
// await showDialog(
//   context: Get.overlayContext!,
//   barrierDismissible:
//       false, // Dialog can't be dismissed by tapping outside it.
//   builder: (_) => PopScope(
//     canPop: false, // Disable popping with the back button
//     child: Container(
//       width: double.infinity,
//       height: double.infinity,
//       child: Column(children: [
//         const SizedBox(height: 250),
//       ]),
//     ),
//   ),
// );
