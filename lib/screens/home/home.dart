import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/cart/cart_screen.dart';
import 'package:solesphere/screens/favorite/favorite_screen.dart';
import 'package:solesphere/screens/drawer/drawer_screen.dart';

import 'widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          key: controller.bottomNavigationKey,
          index: controller.page.value,
          items: const [
            CurvedNavigationBarItem(
              child: Icon(Iconsax.home_1),
              // label: 'Home',
            ),
            CurvedNavigationBarItem(
              child: Icon(Iconsax.heart),
              // label: 'Search',
            ),
            CurvedNavigationBarItem(
              child: Icon(Iconsax.shopping_cart),
              // label: 'Chat',
            ),
            CurvedNavigationBarItem(
              child: Icon(Iconsax.shopping_bag),
              // label: 'Feed',
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
      body: Obx(() => controller.screens[controller.page.value]),
    );
  }
}

class NavigationController extends GetxController {
  final page = 0.obs;
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  final screens = [
    const Stack(children: [DrawerScreen(), HomeScreenContent()]),
    const FavoriteScreen(),
    const CartScreen(),
    // Container(
    //   color: Colors.pink,
    //   child: const Center(
    //     child: Icon(Iconsax.heart),
    //   ),
    // ),
    // Container(color: const Color.fromARGB(255, 0, 0, 0)),
    Container(color: Colors.red),
    Container(color: Colors.amberAccent),
  ];
}
