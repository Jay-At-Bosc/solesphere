import 'package:solesphere/auth/auth_exports.dart';

import '../../../utils/device/device_utility.dart';
import 'appbar_widgets/leading_drawer.dart';
import 'appbar_widgets/verticle_text.dart';

class SAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<CustomDrawerController>();

    return AppBar(
      leading: const SLeadingDrawer(),
      title: const SVerticalText(),
      actions: const [
        // SNotificationIcon(),
        SizedBox(
          height: 24,
          width: 24,
        )
      ],
      backgroundColor: Colors.transparent, // Set your desired background color
      elevation: 0, // Remove shadow
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
