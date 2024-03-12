import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/constants/colors.dart';

import '../../services/routes/app_pages.dart';
import '../../utils/constants/labels.dart';
import '../../utils/theme/widget_themes/text_theme.dart';
import '../../widgets/custom_label.dart';
import '../signup/signup_screen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = Get.size;
    // double scale = Get.textScaleFactor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 84.0),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50),
              child: Column(
                children: [
                  Text(
                    SLabels.signInTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textScaler: const TextScaler.linear(1),
                  ),
                  Text(
                    SLabels.signInSubTitle,
                    style: Theme.of(context).textTheme.displayMedium,
                    textScaler: const TextScaler.linear(1),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Expanded(
                    child: CustomLoginForm(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAllNamed(Routes.signup);
                        },
                        child: CustomSignUpText(
                          label: SLabels.dontHaveAnAccount,
                          style: Theme.of(context).textTheme.bodySmall!,
                        ),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      CustomSignUpText(
                        label: SLabels.signup,
                        style: Theme.of(context).textTheme.displaySmall!,
                      ),
                    ],
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

// --------------------------- start Custom Sign Up Text ---------------------------

class CustomSignUpText extends StatelessWidget {
  final String label;
  final TextStyle style;
  const CustomSignUpText({
    super.key,
    required this.label,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: style,
      textAlign: TextAlign.end,
      overflow: TextOverflow.ellipsis,
      textScaler: const TextScaler.linear(1),
    );
  }
}
// --------------------------- End Custom Sign Up Text ---------------------------

// --------------------------- Start Custom Login Form ---------------------------

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({
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
          const CustomLabelText(labelText: SLabels.email),
          const SizedBox(
            height: 6.0,
          ),
          CustomInputField(
            hintText: SLabels.email,
            onPressedSuffixIcon: null,
            suffixIconData: null,
            isObscure: false,
            keyboardType: TextInputType.emailAddress,
            maxLength: 1,
            suffixIconColor: SColors.textHint,
            obscuringCharacter: '',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 18.0,
          ),
          const CustomLabelText(labelText: SLabels.password),
          const SizedBox(
            height: 6.0,
          ),
          CustomInputField(
            hintText: SLabels.password,
            onPressedSuffixIcon: () {},
            suffixIconData: Iconsax.eye_slash,
            //suffixIconData1: Iconsax.eye,
            isObscure: true,
            obscuringCharacter: "●",
            suffixIconColor: SColors.textHint,
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
            height: 18.0,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  SLabels.forgotPassword,
                  style: STextTheme.lightTextTheme.bodySmall!
                      .copyWith(fontSize: 14.0),
                  textAlign: TextAlign.end,
                  textScaler: const TextScaler.linear(1),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(
              backgroundColor: SColors.accent,
              btnText: SLabels.signIn,
              foregroundColor: SColors.textWhite,
              icon: null,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  // print('Form is valid. Logging in...');
                }
              },
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(
              foregroundColor: SColors.buttonSecondary,
              backgroundColor: SColors.textWhite,
              btnText: SLabels.signInWithGooogle,
              icon: "assest/icons/ic_google.svg",
              onPressed: () {
                // Add your logic for signing in with Google
                // print('Signing in with Google...');
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
      style: STextTheme.lightTextTheme.headlineLarge,
      textScaler: const TextScaler.linear(1),
    );
  }
}
// --------------------------- End Custom Greeting Message ---------------------------

