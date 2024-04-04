import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/home/controller/drawer_controller.dart';
import 'package:solesphere/services/routes/app_pages.dart';

import '../../../../utils/constants/colors.dart';

class SNotificationIcon extends GetView<CustomDrawerController> {
  const SNotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          key: controller.notification,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            icon: const Icon(Iconsax.notification),
            color: SColors.textSecondary, // Customize icon color if needed
            onPressed: () {
              Get.toNamed(Routes.notification);
            },
          ),
        ),
        Positioned(
          right: 24,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
