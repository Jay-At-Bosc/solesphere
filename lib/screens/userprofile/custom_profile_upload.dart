import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:solesphere/pages/user_detail/user_detail_controller.dart';

import '../../utils/constants/colors.dart';

import 'user_detail_controller.dart';

class CustomProfileUpload extends StatelessWidget {
  const CustomProfileUpload({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserDetailsController());
    return Center(
      child: Stack(
        alignment: Alignment.center, // Align the stack at the center
        children: [
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(bottom: 14),
              width: 90.0,
              height: 90.0,
              decoration: const BoxDecoration(
                color: SColors.textSecondary,
                shape: BoxShape.circle,
              ),
              child: Obx(
                () => controller.selectedImage.value != null
                    ? ClipRRect(
                        borderRadius:
                            BorderRadius.circular(45.0), // Adjust as needed
                        child: Image.file(
                          controller.selectedImage.value!,
                          width: 90,
                          height: 90,
                          fit:
                              BoxFit.cover, // Ensure image covers the container
                        ),
                      )
                    : const Text(''),
              ),
            ),
          ),
          Positioned(
            top: 75,
            child: Container(
              height: 26,
              width: 26,
              decoration: const BoxDecoration(
                color: SColors.accent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: IconButton(
                  onPressed: controller.pickImage,
                  icon: const Icon(
                    Iconsax.camera,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
