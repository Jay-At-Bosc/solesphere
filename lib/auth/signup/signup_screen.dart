import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../services/routes/app_pages.dart';
import '../../utils/constants/icons.dart';
import '../../utils/constants/labels.dart';
import '../../utils/extensions/responsive_extension.dart';
import '../../utils/helpers/helper_function.dart';
import '../../widgets/custom_auth_navigation_text.dart';
import '../../widgets/signup_signin_greetings.dart';
import 'signup_button.dart';
import 'signup_controller.dart';
import 'signup_form.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: GestureDetector(
          onTap: SHelperFunctions.hideKeyBoard,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 5.0.getWidth(),
                  right: 5.0.getWidth(),
                  top: 10.0.getHeight()),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Greetings Texts
                  const SignUpSignInGreetings(
                    titleText: SLabels.signUpTitle,
                    subTitleText: SLabels.signUpSubTitle,
                  ),
                  SizedBox(height: 3.0.getHeight()),

                  /// Signup Form
                  GetBuilder<SignUpController>(
                    id: 'freeSignUpForm',
                    builder: (_) {
                      return const Form(
                        //key: controller.form,
                        child: SignUpForm(),
                      );
                    },
                  ),
                  SizedBox(height: 5.0.getHeight()),

                  /// Buttons - Register & Signup With Google
                  const SignUpButton(),
                  SizedBox(height: 5.0.getHeight()),

                  /// Signin Page Navigation
                  CustomAuthNavigationText(
                    label1: SLabels.alreadyHaveAnAccount,
                    label2: SLabels.signIn,
                    onTap: () => Get.offAllNamed(Routes.signin),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------- Start Custom Button ---------------------------

class CustomButton extends StatelessWidget {
  final String btnText;
  final Color foregroundColor;
  final Color backgroundColor;
  final String? icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.btnText,
    required this.foregroundColor,
    required this.backgroundColor,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16.0,
          ),
          textStyle: const TextStyle(
            fontFamily: 'Airbnb',
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    SIcons.googleIcon,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    btnText,
                    textAlign: TextAlign.end,
                    textScaler: const TextScaler.linear(1),
                  ),
                ],
              )
            : Text(
                btnText,
                textAlign: TextAlign.end,
                textScaler: const TextScaler.linear(1),
              ),
      ),
    );
  }
}
