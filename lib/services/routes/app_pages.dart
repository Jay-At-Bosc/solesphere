import 'package:solesphere/screens/home/home.dart';
import 'package:solesphere/screens/home/home_binding.dart';
import 'package:solesphere/screens/userprofile/user_detail_binding.dart';

import '../../auth/signin/signin_binding.dart';
import '../../auth/signin/signin_screen.dart';
import '../../auth/signup/signup_binding.dart';
import '../../auth/signup/signup_screen.dart';
import '../../screens/userprofile/user_detail.dart';
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
      //transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.signup,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
      //transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.userDetail,
      page: () => const UserDetails(),
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
  ];
}
