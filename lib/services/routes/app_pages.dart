import 'package:solesphere/screens/cart/cart_binding.dart';
import 'package:solesphere/screens/cart/cart_screen.dart';
import 'package:solesphere/screens/favorite/favorite_screen.dart';
import 'package:solesphere/screens/home/home.dart';
import 'package:solesphere/screens/home/home_binding.dart';
import 'package:solesphere/screens/notification/notification_screen.dart';
import 'package:solesphere/screens/order-checkout/select_address.dart';
import 'package:solesphere/screens/order/view_order_binding.dart';
import 'package:solesphere/screens/order/view_order_screen.dart';
import 'package:solesphere/screens/product/product_detail_screen.dart';
import 'package:solesphere/screens/userdetail/user_detail_binding.dart';

import '../../auth/signin/signin_binding.dart';
import '../../auth/signin/signin_screen.dart';
import '../../auth/signup/signup_binding.dart';
import '../../auth/signup/signup_screen.dart';
import '../../screens/favorite/favorite_binding.dart';
import '../../screens/notification/notification_binding.dart';
import '../../screens/order-checkout/order_binding.dart';
import '../../screens/product/product_detail_binding.dart';
import '../../screens/user_profile/user_profile_binding.dart';
import '../../screens/user_profile/user_profile_screen.dart';
import '../../screens/userdetail/user_detail._screen.dart';

import 'app_route_exports.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.onboard,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBinding(),
      // transition: Transition.fadeIn,
      // transitionDuration: const Duration(milliseconds: 2000),
      // curve: Curves.easeInOut,
    ),
    GetPage(
      name: _Paths.signin,
      page: () => const SigninScreen(),
      binding: SigninBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),
    GetPage(
      name: _Paths.signup,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ),
    GetPage(
      name: _Paths.userDetail,
      page: () => const UserDetailScreen(),
      binding: UserDetailBinding(),
      //transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
      //transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.favourite,
      page: () => const FavoriteScreen(),
      binding: FavoriteBinding(),
      //transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.productDetail,
      page: () => const ProductDetail(),
      binding: ProductDetailBinding(),
      //transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.notification,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
      //transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.cart,
      page: () => const CartScreen(),
      binding: CartBinding(),
      //transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.userProfileDetail,
      page: () => const UserProfileScreen(),
      binding: UserProfileBinding(),
      //transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.order,
      page: () => AddressSelection(),
      binding: OrderBinding(),
      //transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.viewOrder,
      page: () => const ViewOrderScreen(),
      binding: OrderScreenBinding(),
      //transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
  ];
}
