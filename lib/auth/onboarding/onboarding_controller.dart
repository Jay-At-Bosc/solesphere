import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/models/onboarding_model.dart';

import 'package:http/http.dart' as http;

import '../../services/routes/app_pages.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables

  RxList<OnboardingItem> onboardingItems = <OnboardingItem>[].obs;
  final pageController = PageController();
  Rx<int> currentIndex = 0.obs;
  Rx<bool> isLoading = true.obs;

  @override
  void onInit() {
    fetchOnboardingItems();
    pageController.addListener(_handlePageChange);
    super.onInit();
  }

  void _handlePageChange() {
    currentIndex.value = pageController.page!.round();
  }

  Future<void> fetchOnboardingItems() async {
    const apiUrl =
        'https://solesphere-backend.onrender.com/api/v1/splashScreen';
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> data = responseData['data']; // Extract 'data' array

        List<OnboardingItem> items =
            data.map((item) => OnboardingItem.fromMap(item)).toList();
        onboardingItems.assignAll(items);
        isLoading.value = false;
        update(['Main Onboard']);
      } else {
        // Handle error
        log('Failed to load onboarding items: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or decoding errors
      log('Error fetching onboarding items: $e');
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
      update(['First Part']);
    } else {
      // Navigate to next screen after onboarding, or do something else
      Get.offAllNamed(Routes.signin);
    }
  }
}
