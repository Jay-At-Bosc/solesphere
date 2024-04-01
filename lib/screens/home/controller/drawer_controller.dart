

import 'package:get/get.dart';


class CustomDrawerController extends GetxController {
  static CustomDrawerController get instance => Get.find();
  // RxDouble xOffset = 0.0.obs;
  // RxDouble yOffset = 0.0.obs;
  bool isDrawerOpen = false;

  void openDrawer() {
    // xOffset.value = 45.0.getWidth();
    // yOffset.value = 55.0.getHeight();
    isDrawerOpen = true;
    // log(xOffset.toString());
    // log(yOffset.toString());
    // print('open drawer :vishal');

    update(['drawer']);
  }

  void closeDrawer() {
    // xOffset.value = 0.0;
    // yOffset.value = 0.0;
    isDrawerOpen = false;
    // print('close drawer : vishal');

    update(['drawer']);
    // log(xOffset.toString());
    // log(yOffset.toString());
  }

  void navigateTo(route) async {
    // xOffset.value = 0.0;
    // yOffset.value = 0.0;
    isDrawerOpen = false;
    closeDrawer();
    // update(['drawer']);
    Get.toNamed(route);
    update(['drawer']);
  }
}
