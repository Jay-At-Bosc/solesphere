import 'package:flutter/material.dart';

import 'package:solesphere/utils/constants/colors.dart';

import 'package:solesphere/utils/constants/labels.dart';
import 'package:solesphere/utils/constants/sizes.dart';


import '../../auth/signup/signup_screen.dart';

import 'custom_profile_appbar.dart';
import 'custom_profile_upload.dart';
import 'custome_address_form.dart';

import 'user_info_.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, SSizes.appBarHeight),
        child: CustomAppBar(),
      ),

      //
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomProfileUpload(),
              const SizedBox(
                height: 62.0,
              ),
              Form(
                child: Column(
                  children: [
                    const UserInfo(),
                    const CustomAddressForm(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomButton(
                        btnText: SLabels.save,
                        foregroundColor: SColors.textWhite,
                        backgroundColor: SColors.accent,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}