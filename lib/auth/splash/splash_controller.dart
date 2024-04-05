import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/services/repositories/authentication.dart';
import 'package:solesphere/services/repositories/network.dart';
import 'package:solesphere/services/routes/app_pages.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/exceptions/custom_exception.dart';
import 'package:solesphere/utils/exceptions/exception_handler.dart';

import '../../services/repositories/db_authentication.dart';
import '../../utils/local_storage/app_storage.dart';
import '../auth_exports.dart';

class SplashController extends GetxController {
  final appStorage = Get.find<AppStorage>();
  final authRepository = Get.find<AuthenticationRepository>();
  final checkConnection = Get.find<NetworkController>();

  @override
  void onInit() {
    super.onInit();
    checkMainProcess();
  }

  void checkMainProcess() {
    Future.wait([
      /// Check internet connection
      checkConnection.checkInternetConnection(),

      /// Fatch user data from
      //getUserData(),

      if (!appStorage.hasOnBoardingCompleted) getfetchOnboardingItems(),
      Future.delayed(const Duration(seconds: 3)),
    ]).then((_) async {
      bool hasOnboardCompleted = appStorage.hasOnBoardingCompleted;
      if (hasOnboardCompleted) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final userStatus = await DbAuthentication.instance.checkUser(user.uid,user.email!);
          if (userStatus == 200) {
            TLoaders.successSnackBar(
              title: "Welcome Back!",
              message:
                  "Congratulations! You've successfully logged in to your account.");
            Get.offAllNamed(Routes.home);
          } else {
            Get.offAllNamed(Routes.signin);
            throw CustomException(
                title: "Unauthorized",
                message: "This user blocked by admin.Please contact Admin.");
          }
        } else {
          Get.offAllNamed(Routes.signin);
        }
      } else {
        Get.offAllNamed(Routes.onboard);
      }
    }).onError((e, stackTrace) {
      ExceptionHandler.errorHandler(e, () => checkMainProcess());
    });
  }

  Future<void> getfetchOnboardingItems() async {
    bool hasOnboardCompleted = appStorage.hasOnBoardingCompleted;
    if (hasOnboardCompleted) {
      return;
    }

    try {
      bool isDataFatched = await authRepository.fetchOnboardingItems();
      if (isDataFatched) {
        return;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getUserData() async {
    // TODO: add api call to fetch user data
    await Future.delayed(const Duration(seconds: 0));
    return true;
  }

  void showDialog(String title, String message) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: title,
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  customSnackbar(String? message) {
    Get.snackbar(
      "No Internet Connection",
      message!,
      isDismissible: false,
      snackPosition: SnackPosition.BOTTOM,
      mainButton: TextButton(
        onPressed: () {
          checkConnection.checkInternetConnection();
        },
        child: const Text("Retry"),
      ),
    );
  }
}

// UserDataModel? loggedInUser = appStorage.getUserData();
//         if (loggedInUser != null) {
         
//           Get.offAllNamed(Routes.home);
//         } else {
//           Get.offAllNamed(Routes.signin);
//         }


