import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD

import 'services/routes/app_pages.dart';
=======
import 'package:solesphere/screens/home/home.dart';
>>>>>>> c87f241e056c228e76a1731abd1b9cff5f0e564f
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
<<<<<<< HEAD
      //home: const SplashScreen(),
=======
      home: const HomeScreen(),
>>>>>>> c87f241e056c228e76a1731abd1b9cff5f0e564f
    );
  }
}
