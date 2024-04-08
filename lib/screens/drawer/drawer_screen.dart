import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/home/home.dart';

import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/constants/sizes.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import 'widget/drawer_menu_list.dart';

class DrawerScreen extends GetView<NavigationController> {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(NavigationController());
    // log(7.0.getHeight());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          left: 10,
        ),
        child: SingleChildScrollView(
          child: GetBuilder<NavigationController>(
            id: 'user',
            builder: (controller) => Column(
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45.0),
                    child: Image.network(
                      controller.userData['profilePic'],
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          // Image is still loading
                          return const Center(
                            child: CircularProgressIndicator(
                              color: SColors.accent,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: SColors.accent,
                            ),
                          ],
                        );
                      },
                    ),
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
                    controller.userData['username'],
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
      ),
    );
  }
}
