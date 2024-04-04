import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/drawer/user_info_controller.dart';

import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/constants/sizes.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import 'widget/drawer_menu_list.dart';

class DrawerScreen extends GetView<UserInfoController> {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<UserInfoController>(UserInfoController());
    // log(7.0.getHeight());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          left: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 18.0.getWidth(),
                height: 18.0.getWidth(),
                decoration: BoxDecoration(
                  color: SColors.secondary,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: SColors.primary),
                ),
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),
              Text(
                "Hey, 👋",
                style: Theme.of(context).textTheme.displayMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textScaler: const TextScaler.linear(1),
              ),
              SizedBox(
                width: 45.0.getWidth(),
                // color: Colors.red,
                child: Text(
                  controller.user!.name.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 22.0, color: SColors.textWhite),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textScaler: const TextScaler.linear(1),
                ),
              ),
              const DrawerMenu()
            ],
          ),
        ),
      ),
    );
  }
}
