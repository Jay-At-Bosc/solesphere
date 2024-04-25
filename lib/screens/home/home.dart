import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';

import 'package:solesphere/screens/cart/cart_screen.dart';
import 'package:solesphere/screens/favorite/favorite_screen.dart';
import 'package:solesphere/screens/drawer/drawer_screen.dart';
import 'package:solesphere/screens/home/controller/drawer_controller.dart';
import 'package:solesphere/screens/order/view_order_screen.dart';
import 'package:solesphere/screens/user_profile/user_profile_screen.dart';
import 'package:solesphere/services/api/end_points.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';

import '../../common/widgets/popup/loaders.dart';
import '../../services/routes/app_pages.dart';
import 'widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() {
        switch (controller.page.value) {
          case 0:
            return _buildNavigator(
                const DrawerScreen(), const HomeScreenContent());
          case 1:
            return const FavoriteScreen();
          case 2:
            return const CartScreen();
          case 3:
            return const ViewOrderScreen();
          case 4:
            return const UserProfileScreen();
          default:
            return Container();
        }
      }),
      bottomNavigationBar: GetBuilder<NavigationController>(
        builder: (controller) => CurvedNavigationBar(
          iconPadding: 20,
          key: controller.bottomNavigationKey,
          index: controller.page.value,
          items: const [
            CurvedNavigationBarItem(
              child: Icon(Iconsax.home_1),
            ),
            CurvedNavigationBarItem(
              child: Icon(Iconsax.heart),
            ),
            CurvedNavigationBarItem(
              child: Icon(Iconsax.shopping_cart),
              //     child: Stack(
              //   children: [
              //     Icon(Iconsax.shopping_cart),
              //     Positioned(
              //       left: 1.0.getWidth(),
              //       // top: 1.0.getWidth(),
              //       child: GetBuilder<CartController>(
              //         id: 'cart_count',
              //         builder: (controller) => Container(
              //           width: 20,
              //           height: 20,
              //           decoration: BoxDecoration(
              //             // color: Colors.red,
              //             borderRadius: BorderRadius.circular(100),
              //           ),
              //           child: Center(
              //             child: STextStyle(
              //               text: controller.cartItemsList.length.toString(),
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .titleSmall!
              //                   .copyWith(fontSize: 3.0.getWidth()),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // )),
            ),
            CurvedNavigationBarItem(
              child: Icon(Iconsax.shopping_bag),
            ),
            CurvedNavigationBarItem(
              child: Icon(Iconsax.user),
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),   
          onTap: (index) {
            controller.page.value = index;
            // Update the UI
            controller.update();
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }

  Widget _buildNavigator(Widget drawerScreen, Widget homeContent) {
    return Navigator(
      key: Get.nestedKey(0),
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case Routes.home:
                return Stack(
                  children: [drawerScreen, homeContent],
                );
              case Routes.viewOrder:
                return const ViewOrderScreen();
              //  case Routes.favourite:
              // return FavoriteScreen;,

              // You can add more routes here
              default:
                return Container();
            }
          },
        );
      },
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();

  final page = 0.obs;
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  final controllerDrawer = Get.put(CustomDrawerController());
  Map<String, dynamic> userData = {};
  final profilePic = ''.obs;
  final userName = ''.obs;
  final email = ''.obs;

  String get userId => 'user';

  @override
  void onInit() async {
    await getUserInfo();
    super.onInit();
  }

  Future<void> getUserInfo() async {
    userData.clear();
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    var headers = {'auth-token': token, 'Content-Type': 'application/json'};
    var dio = Dio();
    var response = await dio.request(
      EndPoints.userDetail,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      
      if (response.data is Map<String, dynamic> &&
          response.data.containsKey('data')) {
        userData = response.data['data'];
    
      }

      // Map<String, dynamic> responseMap = jsonDecode(response.data);
      profilePic.value = response.data['data']['profilePic'];
      userName.value = response.data['data']['username'];
      email.value = response.data['data']['email'];
      // print(profilePic);
      update(['user']);
    } else {
      TLoaders.warningSnackBar(
          title: "Something Wrong!!", message: response.statusMessage);
    }
  }
}
