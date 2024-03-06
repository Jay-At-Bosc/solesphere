import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/routes/app_pages.dart';
import 'utils/theme/theme.dart';


class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Solesphere App',
      themeMode: ThemeMode.system,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
       initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      //home: const SplashScreen(),
    );
  }
}
