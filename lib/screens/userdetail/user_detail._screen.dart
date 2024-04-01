// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/labels.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/extensions/responsive_extension.dart';
import '../../widgets/custom_accent_color_button.dart';
import 'custom_profile_appbar.dart';
import 'custom_profile_upload.dart';
import 'custome_address_form.dart';
import 'user_detail_controller.dart';
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
                padding: mainPadding,
                child: Column(
                  children: [
                    const CustomProfileUpload(),
                    SizedBox(
                      height: 2.0.getHeight(),
                    ),

                    // User Information - Username, Email Address, Mobile No.
                    UserInfo(),

                    // User Address details and Phone No.
                    GetBuilder<UserDetailsController>(
                      id: UserDetailsController.userDetailFormId,
                      builder: (context) {
                        return Form(
                          key: controller.userdetailKey,
                          child: CustomAddressForm(),
                        );
                      },
                    ),

                    // Save Button
                    GetBuilder<UserDetailsController>(
                      id: UserDetailsController.saveButtonId,
                      builder: (controller) => Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.0.getWidth()),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: CustomAccentColorButton(
                            buttonLabel: SLabels.save,
                            isLoading: controller.isMainLoading,
                            onPressed: () async {
                              await controller.saveUserData();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  EdgeInsets get mainPadding => EdgeInsets.only(
        left: 5.0.getWidth(),
        right: 5.0.getWidth(),
        top: 2.0.getHeight(),
      );
}
