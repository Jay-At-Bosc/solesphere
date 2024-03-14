import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/repositories/authentication.dart';
import '../../services/routes/app_pages.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  /// Builder Id
  final String signInForm = "SignInForm";
  final String passwordId = "SignupPassword";
  final String signinButtonId = "Signin";
  final String signinWithGoogleButtonId = "SignupWithGoogle";

  /// Input Controller
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  /// Global Form Key
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  /// Button Loader
  bool _isSigInLoading = false;
  bool _isGoogleSigInLoading = false;
  final _isPasswordVisible = true.obs;

  /// Getter
  bool get ispasswordVisible => _isPasswordVisible.value;
  bool get isSignInLoading => _isSigInLoading;
  bool get isGoogleLoading => _isGoogleSigInLoading;
  bool get isMainLoading => _isSigInLoading || _isGoogleSigInLoading;

  void get checkFormValidation =>
      !signinFormKey.currentState!.validate() ? throw "" : null;

  /// Setter
  set isSigInLoading(bool value) {
    _isSigInLoading = value;
    update([signinButtonId]);
  }

  set isGoogleSigInLoading(bool value) {
    _isGoogleSigInLoading = value;
    update([signinWithGoogleButtonId]);
  }

  /// Methods
  // Register User
  Future<void> signinWithEmailPassword() async {
    log("signinWithEmailPassword method called");
    try {
      // Form Validation

      checkFormValidation; // Checks All Fields Validations

      isSigInLoading = true; // Sets Register Loading to true

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
    }
  }

  // Register User With Google
  Future<void> signInWithGoogle() async {
    log("signupWithGoogle method called");
    try {
      // repo call
      isGoogleSigInLoading = true; // Sets Register Loading to true

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
