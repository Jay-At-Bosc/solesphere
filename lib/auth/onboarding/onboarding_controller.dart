import 'dart:convert';
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
  final storageBox = Get.find<AppStorage>();

  @override
  void onInit() {
    //fetchOnboardingItems();
    getOnboardingItemsFromStorage();
    pageController.addListener(_handlePageChange);
    super.onInit();
  }

  void _handlePageChange() {
    currentIndex.value = pageController.page!.round();
  }

  void getOnboardingItemsFromStorage() {
    final jsonString = storageBox.read('onboardingItems');
    print(jsonString);
    
    if (jsonString != null) {
      final List<dynamic> decodedData = jsonDecode(jsonString);
      final items =
          decodedData.map((item) => OnboardingItem.fromMap(item)).toList();
      onboardingItems.assignAll(items);
    } else {
      // final controller = Get.find<SplashController>();
      // controller.fetchOnboardingItems();
      // final List<dynamic> decodedData = jsonDecode(jsonString);
      // final items =
      //     decodedData.map((item) => OnboardingItem.fromMap(item)).toList();
      // onboardingItems.assignAll(items);
      // print("Data from onboarding null condition \n" +
      //     storageBox.read('onboardingData'));
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
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      // update(['First Part']);
    } else {
      // Navigate to next screen after onboarding, or do something else
      final appStorage = Get.find<AppStorage>();
      appStorage.write('hasOnboardCompleted', true);
      print("");
      Get.offAllNamed(Routes.signin);
    }
  }
}
