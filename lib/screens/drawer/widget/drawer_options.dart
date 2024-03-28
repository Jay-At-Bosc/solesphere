import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/services/repositories/authentication.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../services/routes/app_pages.dart';
import '../../../utils/constants/colors.dart';
import '../../home/controller/drawer_controller.dart';

class SDrawerOption extends GetView<CustomDrawerController> {
  const SDrawerOption({
    super.key,
    required this.icon,
    required this.text,
    required this.route,
  });
  final IconData icon;
  final String text;
  final String route;
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CustomDrawerController());
    return Padding(
      padding: EdgeInsets.only(bottom: 4.0.getHeight()),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            color: SColors.primary,
            size: 24,
          ),
          SizedBox(width: 6.0.getWidth()),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () async {
              if (route == Routes.signin) {
                try {
                  await AuthenticationRepository.instance.signOut();
                  Get.offAllNamed(route);
                  return;
                } catch (e) {
                  Get.snackbar("Error", e.toString(),
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 2));
                }
                Get.offAllNamed(route);
              } else {
                print('Drawwer_option :vishal');

                controller.navigateTo(route);
              }
            },
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: SColors.primary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textScaler: const TextScaler.linear(1),
            ),
          ),
        ],
      ),
    );
  }
}
