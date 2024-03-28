// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// import 'package:solesphere/pages/user_detail/user_detail_controller.dart';

import '../../utils/constants/colors.dart';

import 'user_detail_controller.dart';

class CustomProfileUpload extends GetView<UserDetailsController> {
  const CustomProfileUpload({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              child: GetBuilder<UserDetailsController>(
                id: UserDetailsController.userProfilePictureId,
                builder: (controller) => controller.selectedImage.value != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(45.0),
                        child: Image.file(
                          File(controller.selectedImage.value!.path),
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      )
                    : SizedBox(),
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
              child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: controller.pickImage,
                alignment: Alignment.center,
                icon: Icon(
                  Iconsax.camera,
                  size: 16,
                  color: SColors.textWhite.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
