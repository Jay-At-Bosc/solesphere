import 'package:get/get.dart';

//import 'package:get_storage/get_storage.dart';

import '../../utils/local_storage/app_storage.dart';
import '../routes/app_pages.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Called from main.dart on app launch
  // @override
  // void onReady() {
  //   screenRedirect();
  //   super.onReady();
  // }

  final appStorage = Get.find<AppStorage>();

  @override
  void onInit() {
    super.onInit();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  Future<void> screenRedirect() async {
    bool hasOnboardCompleted = appStorage.hasOnBoardingCompleted;

    if (hasOnboardCompleted) {
      Get.offAllNamed(Routes.signin);
    } else {
      Get.offAllNamed(Routes.onboard);
    }
  }

  /* ------------------------- Email & Password sign-in ------------------------- */

  ///  EmailAunthentication - SignIn
  // Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
  //   try{
  //     return await _auth.signINWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch(e){
  //     throw SFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw SFirebaseException(e.code).message;
  //   }
  // }

  ///  EmailAunthentication - Register

  /// EmailAuthentication - Forgot Password

  /* ------------------------------ Social sign-in ------------------------------ */

  ///  GoogleAunthentication - SignIn

  ///  GoogleAunthentication - Register

  /* ------------------------------ User Logout ------------------------------ */

  ///  LogoutUser - valid for any authentication

  ///  Delete user - Remove user Auth and Firebase Account
}
