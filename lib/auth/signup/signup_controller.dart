// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:auth_google/signup/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final passowrd = TextEditingController();

  void registerUser(String email, String password) {
    // AuthenticationRepository.instance
    //     .createUserWithEmailAndPassword(email, password);
  }
}