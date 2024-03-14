import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/repositories/authentication.dart';
import '../../services/routes/app_pages.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  /// Builder Id
  final String signInForm = "SignInForm";
  final String passwordId = "SignInPassword";
  final String forgotPasswordId = "SignInForgotPassword";
  final String signinButtonId = "Signin";
  final String signinWithGoogleButtonId = "SignupWithGoogle";
  final String signinToSignupId = "SigninToSignupId";

  /// Input Controller
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  /// Global Form Key
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  /// Button Loader
  bool isSigInLoading = false;
  bool isGoogleSigInLoading = false;
  final _isPasswordVisible = true.obs;

  /// Getter
  bool get ispasswordVisible => _isPasswordVisible.value;
  bool get isMainLoading => isSigInLoading || isGoogleSigInLoading;

  void get checkFormValidation =>
      !signinFormKey.currentState!.validate() ? throw "" : null;

  /// Methods
  // Register User
  Future<void> signinWithEmailPassword() async {
    log("signinWithEmailPassword method called");
    try {
      // Form Validation

      checkFormValidation; // Checks All Fields Validations

      isSigInLoading = true;
      update([
        signinButtonId,
      ]);

      // User Creation API Call For Firebase
      final userCredential = await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      log("uid : ${userCredential.user!.uid}");

      Get.snackbar("Success", "Account Logged in",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);

      Get.offAllNamed(Routes.home);
    } catch (e) {
      // shown exception which is thrown
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } finally {
      isSigInLoading = false; // Sets Register Loading to false
      update([
        signinButtonId,
      ]);
    }
  }

  // Register User With Google
  Future<void> signInWithGoogle() async {
    log("signupWithGoogle method called");
    try {
      // repo call
      isGoogleSigInLoading = true;
      update([signinWithGoogleButtonId]);

      final creds = await AuthenticationRepository.instance.signUpWithGoogle();
      log(" ${creds.credential!.accessToken}");
      log(" ${creds.credential!.providerId}");

      Get.offAllNamed(Routes.home);
    } catch (e) {
      // shown exception which is thrown
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } finally {
      isGoogleSigInLoading = false; // Sets Register Loading to false
      update([signinWithGoogleButtonId]);
    }
  }

  // Toggle Password
  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
    update([passwordId]);
  }

  void skipSignIn() {
    // TODO: store user as null

    Get.offAllNamed(Routes.home);
  }

  void forgotPassword() {
    // TODO: api call for forgot password
  }
}
