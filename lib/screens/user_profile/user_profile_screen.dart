import 'package:iconsax/iconsax.dart';

import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/text/text_style.dart';
import 'package:solesphere/screens/home/controller/drawer_controller.dart';
import 'package:solesphere/screens/home/home.dart';

import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../utils/theme/widget_themes/text_theme.dart';

import 'widgets/profile_menu_item.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.lightBackground,
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: STextTheme.lightTextTheme.bodyLarge,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 2.0.getWidth(), vertical: 24.0),
          child: Column(
            children: [
              //Change Profile Picture
              Center(
                child: Stack(
                  alignment: Alignment.center, // Align the stack at the center
                  children: [
                    Positioned(
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          width: 90.0,
                          height: 90.0,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(45.0),
                            child: Image.network(
                              NavigationController.instance.userData[0]
                                  ['profile'],
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  // Image is still loading
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: SColors.accent,
                                    ),
                                  );
                                }
                              },
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      color: SColors.accent,
                                    ),
                                  ],
                                );
                              },
                            ),
                          )),
                    ),
                    // Positioned(
                    //   top: 75,
                    //   child: Container(
                    //     height: 26,
                    //     width: 26,
                    //     decoration: const BoxDecoration(
                    //       color: SColors.accent,
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: IconButton(
                    //       padding: const EdgeInsets.all(0),
                    //       onPressed: () {},
                    //       alignment: Alignment.center,
                    //       icon: Icon(
                    //         Iconsax.camera,
                    //         size: 16,
                    //         color: SColors.textWhite.withOpacity(0.7),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

              //User Name and Email
              STextStyle(
                text: NavigationController.instance.userData[0]['name'],
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .apply(color: SColors.textPrimaryWith80),
              ),
              STextStyle(
                text: NavigationController.instance.userData[0]['email'],
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: SColors.textPrimaryWith60),
              ),

              const ProfileMenuItems(),
            ],
          ),
        ),
      ),
    );
  }
}
