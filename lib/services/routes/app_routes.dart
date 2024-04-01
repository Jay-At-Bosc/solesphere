part of 'app_pages.dart';

abstract class Routes {
  static const String splash = _Paths.splash;
  static const String onboard = _Paths.onboard;
  static const String signin = _Paths.signin;
  static const String signup = _Paths.signup;
  static const String userDetail = _Paths.userDetail;
  static const String home = _Paths.home;
   static const String favourite = _Paths.favourite;
   static const String productDetail = _Paths.productDetail;
   static const String notification = _Paths.notification;
   static const String cart = _Paths.cart;
   static const String userProfile = _Paths.userProfileDetail;
   static const String order = _Paths.order;
   static const String viewOrder = _Paths.viewOrder;
}

abstract class _Paths {
  static const String splash = '/';
  static const String onboard = '/onboard';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String userDetail = '/userdetail';
  static const String home = '/home';
  static const String favourite = '/favourite';
  static const String productDetail = '/product_details';
  static const String notification = '/notification';
  static const String cart = '/cart';
  static const String userProfileDetail = '/user-profile-detail';
  static const String order = '/order';
  static const String viewOrder = '/view-orders';

}