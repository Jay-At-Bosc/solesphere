import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/services/api/end_points.dart';

import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/exceptions/custom_exception.dart';
import 'package:solesphere/utils/exceptions/format_exceptions.dart';
import '../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/local_storage/app_storage.dart';
import '../routes/app_pages.dart';
import 'network.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  final appStorage = Get.find<AppStorage>();
  final connection = Get.find<NetworkController>();

  // @override
  // void onInit() {
  //   super.onInit();
  //   //screenRedirect();
  // }

  /// Function to Show Relevant Screen
  Future<void> screenRedirect() async {
    await Future.delayed(const Duration(seconds: 1));
    bool hasOnboardCompleted = appStorage.hasOnBoardingCompleted;

    if (hasOnboardCompleted) {
      Get.offAllNamed(Routes.signin);
    } else {
      Get.offAllNamed(Routes.onboard);
    }
  }

  Future<bool> fetchOnboardingItems() async {
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      final _response = await http.get(Uri.parse(EndPoints.onboard));

      if (_response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(_response.body);
        final List<dynamic> data = responseData['data'];
        final jsonString = json.encode(data);
        await appStorage.setOnboardingItems(jsonString);
        return true;
      } else {
        throw CustomException(
            title: "Error", message: "Faild to fetch onboard item");
      }
    } catch (e) {
      rethrow;
    }
  }

  /* ------------------------- Email & Password sign-in ------------------------- */

  ///  EmailAunthentication - SignIn
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      connection.checkInternetConnection();
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SFormatException();
    } catch (e) {
      rethrow;
    }
  }

  ///  EmailAunthentication - Register
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      connection.checkInternetConnection();
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SFormatException();
    } catch (e) {
      rethrow;
    }
  }

  /// EmailAuthentication - Forgot Password

  /* ------------------------------ Social sign-in ------------------------------ */

  ///  GoogleAunthentication - SignIn/SignUp
  Future<UserCredential> signUpWithGoogle() async {
    try {
      connection.checkInternetConnection();
      // Popup with User alreday logged in accounts
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credentials
      final userCredentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await _auth.signInWithCredential(userCredentials);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SFormatException();
    } catch (e) {
      rethrow;
    }
  }
  /* ------------------------------ User Logout ------------------------------ */

  ///  LogoutUser - valid for any authentication

  ///  Delete user - Remove user Auth and Firebase Account

  /// Forgot Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      connection.checkInternetConnection();
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SFormatException();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      connection.checkInternetConnection();
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAllNamed(Routes.signin);
      TLoaders.successSnackBar(
          title: "See You Soon!", message: "You've successfully signed out.");
    } catch (e) {
      rethrow;
    }
  }
}
