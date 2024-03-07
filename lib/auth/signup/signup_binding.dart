import 'package:get/get.dart';
import 'package:solesphere/auth/signup/signup_controller.dart';


class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
  }

}