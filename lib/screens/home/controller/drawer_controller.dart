import 'package:get/get.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

class CustomDrawerController extends GetxController {
  static CustomDrawerController get instance => Get.find();
  RxDouble xOffset = 0.0.obs;
  RxDouble yOffset = 0.0.obs;
  RxBool isDrawerOpen = false.obs;

  void openDrawer() {
    xOffset.value = 45.0.getWidth();
    yOffset.value = 55.0.getHeight();
    isDrawerOpen.value = true;
    print(xOffset);
    print(yOffset);
    update();
  }

  void closeDrawer() {
    xOffset.value = 0.0;
    yOffset.value = 0.0;
    isDrawerOpen.value = false;
    log(xOffset.toString());
    log(yOffset.toString());
    update();
  }

  void navigateTo(route) async{
    xOffset.value = 0.0;
    yOffset.value = 0.0;
    isDrawerOpen.value = false;
    Get.toNamed(route);
    update();
  }
}
