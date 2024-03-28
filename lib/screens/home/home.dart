import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/cart/cart_controller.dart';
import 'package:solesphere/screens/cart/cart_screen.dart';
import 'package:solesphere/screens/favorite/favorite_screen.dart';
import 'package:solesphere/screens/drawer/drawer_screen.dart';
import 'package:solesphere/screens/home/controller/drawer_controller.dart';
import 'package:solesphere/screens/order/view_order_screen.dart';
import 'package:solesphere/screens/user_profile/user_profile_screen.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import 'widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    print('Home :vishal');

    return Scaffold(
      body: Obx(() => controller.screens[controller.page.value]),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          iconPadding: 20,
          key: controller.bottomNavigationKey,
          index: controller.page.value,
          items: [
            const CurvedNavigationBarItem(
              child: Icon(Iconsax.home_1),
              // label: 'Home',
            ),
            const CurvedNavigationBarItem(
              child: Icon(
                Iconsax.heart,
              ),

              // label: 'Search',
            ),
            CurvedNavigationBarItem(
              child:
                  //     child: Stack(
                  //   children: [
                  //     Positioned(
                  //       right: controller.page.value == 2
                  //           ? 2.0.getWidth()
                  //           : 0.9.getWidth(),
                  //       top: controller.page.value == 2
                  //           ? 1.9.getWidth()
                  //           : 0.3.getWidth(),
                  //       child: Container(
                  //         width: controller.page.value == 2
                  //             ? 4.0.getWidth()
                  //             : 4.0.getWidth(),
                  //         height: controller.page.value == 2
                  //             ? 4.0.getWidth()
                  //             : 4.0.getWidth(),
                  //         decoration:
                  //             BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  //         child: GetBuilder<CartController>(
                  //           id: 'cart_count',
                  //           builder: (ctx) => Center(
                  //             child: Text(
                  //               ctx.cartItemsList.length.toString(),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Icon(
                  //       Iconsax.shopping_cart,
                  //       size: controller.page.value == 2 ? 34 : 24,
                  //     ),
                  //   ],
                  // )
                  Icon(
                Iconsax.shopping_cart,
                size: controller.page.value == 2 ? 34 : 24,
              ),
              // label: '5',
            ),
            const CurvedNavigationBarItem(
              child: Icon(Iconsax.shopping_bag),
              // label: '5',
            ),
            const CurvedNavigationBarItem(
              child: Icon(Iconsax.user),
              // label: 'Personal',
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            controller.page.value = index;
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final page = 0.obs;
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  final controllerDrawer = Get.put(CustomDrawerController());

  final screens = [
    const Stack(children: [DrawerScreen(), HomeScreenContent()]),
    const FavoriteScreen(),
    const CartScreen(),
    const ViewOrderScreen(),
    const UserProfileScreen(),
  ];

  @override
  void onInit() async {
    await CartController.instance.loadCartFromApi();
    super.onInit();
  }
}
