import 'package:flutter/material.dart';

import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/text/text_style.dart';

import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../utils/theme/widget_themes/text_theme.dart';
import '../userdetail/custom_profile_upload.dart';
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
              const CustomProfileUpload(),

              //User Name and Email
              STextStyle(
                text: 'John Anderson',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .apply(color: SColors.textPrimaryWith80),
              ),
              STextStyle(
                text: 'johnanderson@gmail.com',
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
