// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/screens/userdetail/user_detail_controller.dart';



import 'package:solesphere/utils/constants/labels.dart';
import 'package:solesphere/utils/constants/sizes.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import 'package:solesphere/widgets/custom_accent_color_button.dart';



import 'custom_profile_appbar.dart';
import 'custom_profile_upload.dart';
import 'custome_address_form.dart';

import 'user_info_.dart';

class UserDetailScreen extends GetView<UserDetailsController> {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, SSizes.appBarHeight),
        child: CustomAppBar(),
      ),
      body: GetBuilder<UserDetailsController>(
          id: UserDetailsController.userDetailScreenId,
          builder: (context) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 5.0.getWidth(),
                    right: 5.0.getWidth(),
                    top: 2.0.getHeight()),
                child: Column(
                  children: [
                    CustomProfileUpload(),
                    SizedBox(
                      height: 2.0.getHeight(),
                    ),


                    GetBuilder<UserDetailsController>(
                        id: UserDetailsController.userDetailFormId,
                        builder: (context) {
                          return Form(
                            child: Column(
                              children: [
                                UserInfo(),

                                CustomAddressForm(),
                                
                                GetBuilder<UserDetailsController>(
                                  id: UserDetailsController.saveButtonId,
                                  builder: (controller) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0.getWidth()),
                                    child: SizedBox(
                                      width: double.maxFinite,
                                      child: CustomAccentColorButton(
                                        buttonLabel: SLabels.save,
                                        isLoading: false,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
