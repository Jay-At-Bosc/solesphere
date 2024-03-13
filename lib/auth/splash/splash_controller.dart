import 'dart:developer';

import 'package:solesphere/services/models/user_data_model.dart';
import 'package:solesphere/services/repositories/authentication.dart';
import 'package:solesphere/services/routes/app_pages.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';

import '../../utils/local_storage/app_storage.dart';
import '../auth_exports.dart';

class SplashController extends GetxController {
  final appStorage = Get.find<AppStorage>();
  final authRepository = Get.find<AuthenticationRepository>();

  @override
  void onInit() {
    super.onInit();
    Future.wait([
      getUserData(),
      getfetchOnboardingItems(),
      Future.delayed(const Duration(seconds: 3)),
    ]).then((_) {
      bool hasOnboardCompleted = appStorage.hasOnBoardingCompleted;
      if (hasOnboardCompleted) {
        UserDataModel? loggedInUser = appStorage.getUserData();
        if (loggedInUser != null) {
          Get.offAllNamed(Routes.home);
        } else {
          Get.offAllNamed(Routes.signin);
        }
      } else {
        Get.offAllNamed(Routes.onboard);
      }
    }).onError((error, stackTrace) {
      log("jnnckjas");
    });
  }

  Future<bool> getfetchOnboardingItems() async {
    bool hasOnboardCompleted = appStorage.hasOnBoardingCompleted;
    if (hasOnboardCompleted) {
      return true;
    }

    // TODO: make this private and reuse from single instance, same for the API call

    try {
      await authRepository.fetchOnboardingItems();
      return true;
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.contains('SocketException')) {
        _showErrorDialog('Please turn on your internet connection.');
      } else {
        _showErrorDialog('Network request failed. Please try again later.');
      }
      return false;
    }
  }

  Future<bool> getUserData() async {
    // TODO: add api call to fetch user data
    await Future.delayed(const Duration(seconds: 0));
    return true;
  }

  void _showErrorDialog(String message) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: const Text('OK'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle retry action
              Get.back(); // Close the dialog
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
