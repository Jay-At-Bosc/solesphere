import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solesphere/utils/constants/icons.dart';

import '../../services/routes/app_pages.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/labels.dart';

import '../../widgets/custom_label.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = Get.size;
    // double scale = Get.textScaleFactor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50),
                child: Column(
                  children: [
                    CustomLabelText(
                        labelText: SLabels.signUpTitle,
                        labelStyle: Theme.of(context).textTheme.headlineLarge),
                    CustomLabelText(
                      labelText: SLabels.signUpSubTitle,
                      labelStyle: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const CustomSignUpForm(),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const CustomLoginText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------- start Custom Sign Up Text ---------------------------

class CustomLoginText extends StatelessWidget {
  const CustomLoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAllNamed(Routes.signin);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            SLabels.alreadyHaveAnAccount,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(),
            textAlign: TextAlign.end,
            textScaler: const TextScaler.linear(1),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            SLabels.signIn,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .apply(color: SColors.accent),
            textAlign: TextAlign.end,
            textScaler: const TextScaler.linear(1),
          ),
        ],
      ),
    );
  }
}
// --------------------------- End Custom Sign Up Text ---------------------------

// --------------------------- Start Custom Login Form ---------------------------

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomLabelText(labelText: SLabels.username),
          const SizedBox(
            height: 6.0,
          ),
          CustomInputField(
            hintText: SLabels.username,
            onPressedSuffixIcon: null,
            suffixIconData: null,
            isObscure: false,
            suffixIconColor: SColors.textPrimaryWith80,
            obscuringCharacter: '',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Username';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            maxLength: 1,
          ),
          const SizedBox(
            height: 12.0,
          ),
          const CustomLabelText(labelText: SLabels.email),
          const SizedBox(
            height: 6.0,
          ),
          CustomInputField(
            hintText: SLabels.email,
            onPressedSuffixIcon: null,
            suffixIconData: null,
            isObscure: false,
            suffixIconColor: SColors.textPrimaryWith80,
            obscuringCharacter: '',
            keyboardType: TextInputType.emailAddress,
            maxLength: 1,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 12.0,
          ),
          const CustomLabelText(labelText: SLabels.password),
          const SizedBox(
            height: 6.0,
          ),
          CustomInputField(
            hintText: SLabels.password,
            onPressedSuffixIcon: null,
            suffixIconData: Icons.remove_red_eye_outlined,
            isObscure: true,
            obscuringCharacter: "●",
            suffixIconColor: SColors.textPrimaryWith60,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            maxLength: 1,
          ),
          const SizedBox(
            height: 12.0,
          ),
          const CustomLabelText(labelText: SLabels.confirmPassword),
          const SizedBox(
            height: 6.0,
          ),
          CustomInputField(
            hintText: SLabels.confirmPassword,
            onPressedSuffixIcon: null,
            suffixIconData: Icons.remove_red_eye_outlined,
            isObscure: true,
            obscuringCharacter: "●",
            suffixIconColor: SColors.textPrimaryWith60,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            maxLength: 1,
          ),
          const SizedBox(
            // height: 30.0,
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(
              backgroundColor: SColors.accent,
              btnText: SLabels.signup,
              foregroundColor: SColors.textWhite,
              icon: null,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  // print('Form is valid. Registered...');
                }
              },
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(
              foregroundColor: SColors.textPrimaryWith60,
              backgroundColor: SColors.primary,
              btnText: SLabels.signInWithGooogle,
              icon: SIcons.googleIcon,
              onPressed: () {
                // Add your logic for signing in with Google
                // print('Signing Up with Google...');
                Get.toNamed(Routes.userDetail);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// --------------------------- End Custom Login Form ---------------------------

// --------------------------- Start Custom Greeting Message ---------------------------

class CustomGreetingText extends StatelessWidget {
  final String greetTitle;
  final double fontSize;
  final Color color;

  const CustomGreetingText({
    super.key,
    required this.greetTitle,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      greetTitle,
      style: TextStyle(
        fontFamily: 'Airbnb',
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: color,
      ),
      textScaler: const TextScaler.linear(1),
    );
  }
}
// --------------------------- End Custom Greeting Message ---------------------------

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
// --------------------------- End Custom Button ---------------------------

// --------------------------- Start CustomLabelText ---------------------------

// class CustomLabelText extends StatelessWidget {
//   final String labelText;
//   const CustomLabelText({
//     super.key,
//     required this.labelText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       labelText,
//       style: const TextStyle(
//         fontFamily: 'Airbnb',
//         fontWeight: FontWeight.w500,
//         fontSize: 16.0,
//         color: darkColor,
//       ),
//       textScaler: const TextScaler.linear(1),
//     );
//   }
// }

// --------------------------- End CustomLabelText ---------------------------

// --------------------------- Start CustomInputField ---------------------------

class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIconData; // Nullable IconData for the suffix icon
  final Color suffixIconColor;
  final VoidCallback? onPressedSuffixIcon;
  final bool isObscure;
  final String? obscuringCharacter;
  final FormFieldValidator<String>? validator; // Add validator

  const CustomInputField({
    super.key,
    required this.hintText,
    this.suffixIconData,
    this.onPressedSuffixIcon,
    required this.suffixIconColor,
    required this.isObscure,
    required this.obscuringCharacter,
    required this.validator,
    required TextInputType keyboardType,
    required int maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: isObscure,
      obscuringCharacter: isObscure ? obscuringCharacter! : " ",
      cursorColor: SColors.accent,
      style: TextStyle(
        color: SColors.textPrimaryWith60,
        fontFamily: 'Airbnb',
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIconData != null
            ? InkWell(
                child: IconButton(
                  splashColor: Colors.red,
                  onPressed: onPressedSuffixIcon,
                  icon: Icon(suffixIconData, size: 24),
                ),
              )
            : null,
        suffixIconColor: suffixIconColor.withOpacity(0.6),
        fillColor: SColors.primary,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        // border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14.0),
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }
}

// --------------------------- End CustomInputField ---------------------------