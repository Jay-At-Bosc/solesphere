import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../utils/constants/colors.dart';
import '../../home/controller/drawer_controller.dart';

class SDrawerOption extends StatelessWidget {
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
    final controller = Get.put(CustomDrawerController());
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
            onTap: () => controller.navigateTo(route),
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
