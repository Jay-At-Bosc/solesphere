import 'dart:developer';

import 'package:solesphere/auth/auth_exports.dart';

import '../../services/models/onboarding_model.dart';
import '../../services/routes/app_pages.dart';
import '../../utils/local_storage/app_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables

  RxList<OnboardingItem> onboardingItems = <OnboardingItem>[].obs;
  final pageController = PageController();
  Rx<int> currentIndex = 0.obs;
  Rx<bool> isLoading = false.obs;
  final appStorage = Get.find<AppStorage>();

  @override
  void onInit() {
    getOnboardingItemsFromStorage();
    pageController.addListener(_handlePageChange);
    super.onInit();
  }

  void _handlePageChange() {
    currentIndex.value = pageController.page!.round();
  }

  bool getOnboardingItemsFromStorage() {
    List<OnboardingItem> items = appStorage.getOnboardingItems();
    try {
      onboardingItems.assignAll(items);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  /// Update current index when page scroll
  void updatePageIndicator(index) => currentIndex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  /// Update current index & jump to next page
  void nextPage() {
    if (currentIndex.value < onboardingItems.length - 1) {
      currentIndex.value++;
      pageController.animateToPage(currentIndex.value,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      // update(['First Part']);
    } else {
      // Navigate to next screen after onboarding, or do something else
      final appStorage = Get.find<AppStorage>();
      appStorage.setBool(StorageKey.kHasOnBoardingCompleted, true);
      Get.offAllNamed(Routes.signin);
    }
  }
}
