import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/user_profile/user_profile_controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
  Get.put<UserProfileController>(UserProfileController());
  }

}
