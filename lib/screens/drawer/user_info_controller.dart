import 'package:firebase_auth/firebase_auth.dart';
import 'package:solesphere/auth/auth_exports.dart';

class UserInfoController extends GetxController {
  static UserInfoController get instance => Get.find();

  // ignore: prefer_typing_uninitialized_variables
  var currentUser;
  @override
  void onInit() {
    currentUser = FirebaseAuth.instance.currentUser;
    super.onInit();
  }
}
