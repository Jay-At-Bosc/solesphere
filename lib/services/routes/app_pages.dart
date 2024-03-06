
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
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 2000),
      curve: Curves.easeInOut,
    ),
    // GetPage(
    //   name: _Paths.signin,
    //   page: () => const SigninScreen(),
    //   binding: SigninBinding(),
    //   // transition: Transition.fadeIn,
    //   // transitionDuration: const Duration(milliseconds: 2000),
    //   // curve: Curves.easeInOut,
    // ),
    // GetPage(
    //   name: _Paths.signup,
    //   page: () => const SignUpPage(),
    //   //binding: SigninBinding(),
    //   // transition: Transition.fadeIn,
    //   // transitionDuration: const Duration(milliseconds: 2000),
    //   // curve: Curves.easeInOut,
    // ),
    // GetPage(
    //   name: _Paths.userDetail,
    //   page: () => const UserDetails(),
    //   //binding: SigninBinding(),
    //   // transition: Transition.fadeIn,
    //   // transitionDuration: const Duration(milliseconds: 2000),
    //   // curve: Curves.easeInOut,
    // ),
  ];
}