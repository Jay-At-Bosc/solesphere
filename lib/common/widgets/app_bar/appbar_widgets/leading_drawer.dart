import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/screens/home/home.dart';


import '../../../../screens/home/controller/drawer_controller.dart';
import '../../../../utils/constants/colors.dart';

class SLeadingDrawer extends GetView<CustomDrawerController> {
  const SLeadingDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<CustomDrawerController>();
    return Container(
      key: controller.drawer,
      margin: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        icon: const Icon(Iconsax.menu5),
        color: SColors.textSecondary,
        onPressed: () async {
          log("user data");

          final ctx = Get.find<NavigationController>();
          ctx.getUserInfo();

          controller.isDrawerOpen
              ? controller.closeDrawer()
              : controller.openDrawer();
          // Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}
