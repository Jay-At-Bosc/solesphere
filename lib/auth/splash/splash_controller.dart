import '../auth_exports.dart';

class SplashController extends GetxController{
   @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offNamed("/onboard");
    });
  }

}