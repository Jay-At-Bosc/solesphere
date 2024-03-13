import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/routes/app_pages.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  /// Builder Id
  final String passwordId = "SigninPassword";

  /// Input Controller
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  final isPasswordVisible = true.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update([passwordId]);
  }

  bool get passwordVisible => isPasswordVisible.value;

  void skipSignIn() {
    // TODO: store user as null

    Get.offAllNamed(Routes.home);
  }

  void forgotPassword() {
    // TODO: api call for forgot password
  }
}
