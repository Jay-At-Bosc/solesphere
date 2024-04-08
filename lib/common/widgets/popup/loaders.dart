import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';

class TLoaders {
  static errorDialog(
      {required String title,
      required String message,
      required Function() ontap}) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      onWillPop: () async => false,
      textConfirm: "Retry",
      textCancel: "Exit",
      barrierDismissible: false,
      radius: 50,
      onConfirm: () async {
        Get.back();
        ontap();
      },
      onCancel: () {
        Get.back();
        SystemNavigator.pop();
      },
    );
  }

  static errorSnackBar({title = "Error", message = "something went wrong"}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: SColors.textWhite,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      //duration: const Duration(seconds: 1),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2,
        color: SColors.textWhite,
      ),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: SColors.textWhite,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2,
        color: SColors.textWhite,
      ),
    );
  }

  static successSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: SColors.textWhite,
      backgroundColor: SColors.accent,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        IconData(0x1F389, fontFamily: 'EmojiOne'),
        color: SColors.textWhite,
      ),
    );
  }

  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: SHelperFunctions.isDarkMode(Get.context!)
                ? SColors.textPrimaryWith80.withOpacity(0.9)
                : SColors.textSecondary.withOpacity(0.9),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }
}
