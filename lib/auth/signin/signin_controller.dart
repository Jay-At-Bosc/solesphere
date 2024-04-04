import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/utils/exceptions/custom_exception.dart';
import 'package:solesphere/utils/exceptions/exception_handler.dart';

import '../../services/repositories/authentication.dart';
import '../../services/repositories/db_authentication.dart';
import '../../services/routes/app_pages.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  /// Builder Id
  final String signInScreen = "SignInScreen";
  final String signInForm = "SignInForm";
  final String passwordId = "SignInPassword";
  final String forgotPasswordId = "SignInForgotPassword";
  final String signinButtonId = "Signin";
  final String signinWithGoogleButtonId = "SignupWithGoogle";
  final String signinToSignupId = "SigninToSignupId";
  final String forgetPAsswordButtonId = "ForgetPAsswordButtonId";

  /// Input Controller
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  /// Global Form Key
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Button Loader
  bool isSigInLoading = false;
  bool isGoogleSigInLoading = false;
  bool isForgotPasswordLoading = false;
  final _isPasswordVisible = true.obs;

  /// Getter
  bool get ispasswordVisible => _isPasswordVisible.value;
  bool get isMainLoading => isSigInLoading || isGoogleSigInLoading;

  void get checkFormValidation =>
      !signinFormKey.currentState!.validate() ? throw "" : null;

  void get checkForgetPasswordEmailValidation =>
      !forgetPasswordFormKey.currentState!.validate() ? throw "" : null;

  /// Methods
  // Register User
  Future<void> signinWithEmailPassword() async {
    log("signinWithEmailPassword method called");
    try {
      // Form Validation

      checkFormValidation; // Checks All Fields Validations

      isSigInLoading = true;
      update([signInScreen]);

      // User Creation API Call For Firebase
      final userCredential = await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      final user = userCredential.user;
      if (user != null) {
        final userStatus = await DbAuthentication.instance.checkUser(user);
        if (userStatus == 200) {
          TLoaders.successSnackBar(
              title: "Welcome Back!",
              message:
                  "Congratulations! You've successfully logged in to your account.");
          Get.offAllNamed(Routes.home);
        } else {
          throw CustomException(
              title: "Unauthorized",
              message: "This user blocked by admin.Please contact Admin.");
        }
      }
      isSigInLoading = false; // Sets Register Loading to false
      update([signInScreen]);

      Get.offAllNamed(Routes.home);
    } catch (e) {
      isSigInLoading = false; // Sets Register Loading to false
      update([signInScreen]);
      ExceptionHandler.errorHandler(e, () => signinWithEmailPassword());
    }
  }

  // Register User With Google
  Future<void> signInWithGoogle() async {
    log("signupWithGoogle method called");
    try {
      isGoogleSigInLoading = true;
      update([signInScreen]);

      final userCredential =
          await AuthenticationRepository.instance.signUpWithGoogle();

      final user = userCredential.user;
      if (user != null) {
        final userStatus = await DbAuthentication.instance.checkUser(user);
        log("User status after google log in : $userStatus");
        if (userStatus == 200) {
          TLoaders.successSnackBar(
              title: "Welcome Back!",
              message:
                  "Congratulations! You've successfully logged in to your account.");
          Get.offAllNamed(Routes.home);
        } else if (userStatus == 201) {
          TLoaders.successSnackBar(
              title: "Account Created Successfully!",
              message: "Hooray! Your account has been created successfully. ");
          Get.offAllNamed(Routes.userDetail);
        } else {
          await GoogleSignIn().signOut();
          throw CustomException(
              title: "Unauthorized",
              message: "This user blocked by admin.Please contact Admin.");
        }
      }

      isGoogleSigInLoading = false; // Sets Register Loading to false
      update([signInScreen]);
    } catch (e) {
      // shown exception which is thrown
      isGoogleSigInLoading = false;
      update([signInScreen]);
      ExceptionHandler.errorHandler(e, () => signinWithEmailPassword());
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

  Future<void> forgotPassword() async {
    // TODO: api call for forgot

    try {
      checkForgetPasswordEmailValidation;
      isForgotPasswordLoading = true;
      update([forgetPAsswordButtonId]);

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      Get.snackbar("Success", "Password Reset Email Sent",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed(Routes.signin);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } finally {
      isForgotPasswordLoading = false;
      update([forgetPAsswordButtonId]);
    }
  }
}
