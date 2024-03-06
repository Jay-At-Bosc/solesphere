import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/helpers/helper_functions.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final bool isDark = THelperFunctions.isDarkMode(Get.context!);
  final pageController = PageController();
  Rx<int> currentIndex = 0.obs;
   

  /// Update current index when page scroll
  void updatePageIndicator(index) => currentIndex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update current index & jump to next page
  void nextPage() {
    if (currentIndex.value == 2) {
      // redirect to login page
    } else {
      int page = currentIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  
}
