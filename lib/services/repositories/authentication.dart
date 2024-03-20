import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

//import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/services/api/end_points.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/exceptions/format_exceptions.dart';
import '../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/local_storage/app_storage.dart';
import '../routes/app_pages.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  final appStorage = Get.find<AppStorage>();

  @override
  void onInit() {
    super.onInit();
    //screenRedirect();
  }

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
    final _response = await http.get(Uri.parse(EndPoints.onboard));

    // TODO: make this private and reuse from single instance, same for the API call
    try {
      if (_response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(_response.body);
        final List<dynamic> data = responseData['data'];
        final jsonString = json.encode(data);
        await appStorage.setOnboardingItems(jsonString);
        return true;
      } else {
        log('Failed to load onboarding items: ${_response.statusCode}');
        throw Exception(
            'Failed to load onboarding items: ${_response.statusCode}');
      }
    } catch (e) {
      log('Error fetching onboarding items: $e');
      throw Exception('Error fetching onboarding items: $e');
    }
  }

  /* ------------------------- Email & Password sign-in ------------------------- */

  ///  EmailAunthentication - SignIn
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SFormatException();
    } catch (e) {
      throw "Something went wrong.Please try again later.";
    }
  }

  ///  EmailAunthentication - Register
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SFormatException();
    } catch (e) {
      throw "Something went wrong.Please try again later.";
    }
  }

  /// EmailAuthentication - Forgot Password

  /* ------------------------------ Social sign-in ------------------------------ */

  ///  GoogleAunthentication - SignIn/SignUp
  Future<UserCredential> signUpWithGoogle() async {
    try {
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
      throw "Something went wrong.Please try again later.";
    }
  }
  /* ------------------------------ User Logout ------------------------------ */

  ///  LogoutUser - valid for any authentication

  ///  Delete user - Remove user Auth and Firebase Account

  /// Forgot Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SFormatException();
    } catch (e) {
      throw "Something went wrong.Please try again later.";
    }
  }

  Future<void> signOut() async {
    try {

      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAllNamed(Routes.signin);
      // log("${_auth.authStateChanges()}");
    } catch (e) {
      throw "Something went wrong.Please try again later.";
    }
  }
}
