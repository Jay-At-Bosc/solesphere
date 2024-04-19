import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:solesphere/auth/auth_exports.dart';
//import 'package:solesphere/auth/signup/signup_screen.dart';

import 'services/routes/app_pages.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      // navigatorObservers: <NavigatorObserver>[observer],
      title: 'Solesphere App',
      themeMode: ThemeMode.system,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBindings(),
      //home: const SignUpScreen(),
    );
  }
}

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(), permanent: true);
  }
}
