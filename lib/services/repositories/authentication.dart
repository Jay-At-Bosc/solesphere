import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';

//import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/services/api/end_points.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import '../../utils/local_storage/app_storage.dart';
import '../routes/app_pages.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

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
        throw Exception('Failed to load onboarding items: ${_response.statusCode}');
      }
    } catch (e) {
      log('Error fetching onboarding items: $e');
      throw Exception('Error fetching onboarding items: $e');
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
