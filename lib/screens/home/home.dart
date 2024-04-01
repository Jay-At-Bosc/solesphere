

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/cart/cart_screen.dart';

import 'package:solesphere/screens/favorite/favorite_screen.dart';
import 'package:solesphere/screens/drawer/drawer_screen.dart';
import 'package:solesphere/screens/home/controller/drawer_controller.dart';
import 'package:solesphere/screens/order/view_order_screen.dart';
import 'package:solesphere/screens/user_profile/user_profile_screen.dart';

import 'widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
   
    // print('Home :vishal');

    return Scaffold(
      body: Obx(() => controller.screens[controller.page.value]),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          iconPadding: 20,
          key: controller.bottomNavigationKey,
          index: controller.page.value,
          items: const [
            CurvedNavigationBarItem(
              child: Icon(Iconsax.home_1),
              // label: 'Home',
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Iconsax.heart,
              ),

              // label: 'Search',
            ),
            CurvedNavigationBarItem(
              child:
                  //     child: Stack(
                  //   children: [
                  //     GetBuilder<CartController>(
                  //       id: 'cart_count',
                  //       builder: (c) => Positioned(
                  //         top: 0.3.getWidth(),
                  //         left: 1.3.getWidth(),
                  //         child: SizedBox(
                  //           width: 4.0.getWidth(),
                  //           height: 4.0.getWidth(),
                  //           child: Center(
                  //             child: Text(c.initialized
                  //                 ? c.cartItemsList.length.toString()
                  //                 : '0'),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const Icon(
                  //       Iconsax.shopping_cart,
                  //     ),
                  //   ],
                  // )
                  Icon(
                Iconsax.shopping_cart,
              ),
              // label: '5',
            ),
            CurvedNavigationBarItem(
              child: Icon(Iconsax.shopping_bag),
              // label: '5',
            ),
            CurvedNavigationBarItem(
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
  static NavigationController get instance => Get.find();

  final page = 0.obs;
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  final controllerDrawer = Get.put(CustomDrawerController());

  @override
  void onInit() async {
    // CartController.instance.loadCartFromApi();
    super.onInit();
  }

  final screens = [
    const Stack(children: [DrawerScreen(), HomeScreenContent()]),
    const FavoriteScreen(),
    const CartScreen(),
    const ViewOrderScreen(),
    const UserProfileScreen(),
  ];
}
