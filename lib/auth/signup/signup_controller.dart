// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:auth_google/signup/authentication_repository.dart';
import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solesphere/services/models/user_data_model.dart';
import 'package:solesphere/services/repositories/authentication.dart';
import 'package:solesphere/services/repositories/db_authentication.dart';
import 'package:solesphere/services/routes/app_pages.dart';
import '../../common/widgets/popup/loaders.dart';
import '../../utils/constants/labels.dart';
import '../../utils/exceptions/custom_exception.dart';
import '../../utils/exceptions/exception_handler.dart';
import '../../utils/local_storage/app_storage.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final appStorage = Get.find<AppStorage>();

  /// Builder Id
  static String get signupScreen => "SignUpScreen";
  static String get signUpForm => "SignUpForm";
  static String get passwordId => "SignupPassword";
  static String get confirmpasswordId => "SignupConfirmPassword";
  static String get registerButtonId => "Register";
  static String get signupWithGoogleButtonId => "SignupWithGoogle";

  /// Input Controller
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  /// Global Form Key
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Button Loader
  bool isRegisterLoading = false;
  bool isGoogleLoading = false;

  final _isPasswordVisible = true.obs;
  final _isConfirmPasswordVisible = true.obs;

  /// Getter
  bool get ispasswordVisible => _isPasswordVisible.value;
  bool get isconfirmpasswordVisible => _isConfirmPasswordVisible.value;
  void get isPasswordMatched => password.text != confirmPassword.text
      ? throw "Password Not Matched"
      : null;
  void get checkFormValidation =>
      !signupFormKey.currentState!.validate() ? throw "" : null;

  /// Methods
  // Register User
  bool isMainLoading() {
    if (isRegisterLoading || isGoogleLoading) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> signupWithEmailPassword() async {
    log("signupWithEmailPassword method called");
    try {
      isPasswordMatched; // Checks Password is matched or not

      checkFormValidation; // Checks All Fields Validations

      isRegisterLoading = true;
      update([signupScreen]);

      // User Creation API Call For Firebase
      final userCredential = await AuthenticationRepository.instance
          .signUpWithEmailAndPassword(email.text.trim(), password.text.trim());

      if (userCredential.user != null) {
        final user = UserDataModel(
            id: userCredential.user!.uid,
            name: username.text.trim(),
            email: email.text.trim());
        Map<String, dynamic> jsonData = {
          "email": user.email,
          "UID": user.id,
          "username": username.text.trim(),
        };
        final userStatus = await DbAuthentication.instance.checkUser(jsonData);
        if (userStatus == 201) {
          // Store data into local database
          storeToLocal(user);

          navigateToUserDetails(user.name,user.email);
          TLoaders.successSnackBar(
              title: SLabels.accountCreatedTitle,
              message: SLabels.accountCreatedMessage);
        } else {
          throw CustomException(
              title: SLabels.unauthorizedTitle,
              message: SLabels.unauthorizedMessage);
        }
      }
      // ignore: unused_local_variable
      //final userCreated = await DbAuthentication.instance.createUser(user);
      isRegisterLoading = false;
      update([signupScreen]);
    } catch (e) {
      isRegisterLoading = false;
      update([signupScreen]);
      ExceptionHandler.errorHandler(e, () => signupWithEmailPassword());
    }
  }

  // Register User With Google
  Future<void> signupWithGoogle() async {
    log("signupWithGoogle method called");
    try {
      // repo call
      isGoogleLoading = true;
      update([signupScreen]);

      final userCredential =
          await AuthenticationRepository.instance.signUpWithGoogle();

      if (userCredential.user != null) {
        final user = UserDataModel(
            id: userCredential.user!.uid,
            name: userCredential.user!.displayName ?? "Unknown",
            email: userCredential.user!.email!);

        Map<String, dynamic> jsonData = {
          "email": user.email,
          "UID": user.id,
          "username": user.name,
        };
        final userStatus =
            await DbAuthentication.instance.checkUser(jsonData);
        if (userStatus == 200) {
          Get.offAllNamed(Routes.home);
          TLoaders.successSnackBar(
              title: SLabels.accountSignedInTitle,
              message: SLabels.accountSignedInMessage);
        } else if (userStatus == 201) {
          // Store data into local database
          storeToLocal(user);

          navigateToUserDetails(
              user.name, user.email);
          TLoaders.successSnackBar(
              title: SLabels.accountCreatedTitle,
              message: SLabels.accountCreatedMessage);
        } else {
          await GoogleSignIn().signOut();
          throw CustomException(
              title: SLabels.unauthorizedTitle,
              message: SLabels.unauthorizedMessage);
        }
      }
      isGoogleLoading = false; // Sets Register Loading to false
      update([signupScreen]);
    } catch (e) {
      await GoogleSignIn().signOut();
      ExceptionHandler.errorHandler(e, () => signupWithGoogle());
      isGoogleLoading = false;
      update([signupScreen]);
    }
  }

  void storeToLocal(UserDataModel user) {
    appStorage.setUserData(user);
    log(" data from read : ${appStorage.getUserData()!.email}");
    log("user created on local storage");
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

  showMessage(String title, String message) {
    return Get.snackbar(title, message,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM);
  }

  // Navigation Signup to UserDetails
  void navigateToUserDetails(String? username, String? userEmail) =>
      Get.offAllNamed(
        Routes.userDetail,
        // change to params
        arguments: {
          'username': username?.isNotEmpty == true ? username : 'Unknown',
          'useremail': userEmail?.isNotEmpty == true ? userEmail : 'Unknown',
        },
      );

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

// log(" ${creds.credential!.accessToken}");
// log(" ${creds.credential!.providerId}");
// //log("${creds.additionalUserInfo.}");
// log(" ${creds.user!.uid}");

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

// Strore Data into local Storage
// Future<void> storeToLocal(UserDataModel user) async {
//   try {
//     String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
//     appStorage.setUserData(user);
//     appStorage.setString(StorageKey.kAuthToken, token!);
//     log(appStorage.getUserData().toString());
//     log(appStorage.getString(StorageKey.kAuthToken)!);
//     return ;
//   } catch (e) {
//     throw "Data not store in local storage";
//   }
// }
