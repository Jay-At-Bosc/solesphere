import '../../services/routes/app_pages.dart';
import '../../utils/constants/labels.dart';
import '../../utils/extensions/responsive_extension.dart';
import '../../utils/helpers/helper_function.dart';
import '../../widgets/custom_auth_navigation_text.dart';
import '../../widgets/signup_signin_greetings.dart';
import '../auth_exports.dart';
import 'signin_button.dart';
import 'signin_controller.dart';
import 'signin_forgot_password.dart';
import 'signin_form.dart';
import 'signin_to_home_screen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: SHelperFunctions.hideKeyBoard,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 5.0.getWidth(),
                right: 5.0.getWidth(),
                top: 15.0.getHeight(),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Greetings Texts
                  const SignUpSignInGreetings(
                    titleText: SLabels.signInTitle,
                    subTitleText: SLabels.signInSubTitle,
                  ),
                  SizedBox(height: 5.0.getHeight()),

                  /// Signup Form
                  GetBuilder<SignInController>(
                    id: 'freeSignUpForm',
                    builder: (_) {
                      return const Form(
                        //key: controller.form,
                        child: SignInForm(),
                      );
                    },
                  ),
                  SizedBox(height: 2.0.getHeight()),

                  /// Forgot Password
                  const SignInForgotPassword(),
                  SizedBox(height: 12.0.getHeight()),

                  /// Buttons - Register & Signup With Google
                  const SignInButton(),
                  SizedBox(height: 3.0.getHeight()),

                  /// Signin Page Navigation
                  CustomAuthNavigationText(
                    label1: SLabels.dontHaveAnAccount,
                    label2: SLabels.signup,
                    onTap: () => Get.offAllNamed(Routes.signup),
                  ),
                  SizedBox(height: 3.0.getHeight()),

                  /// Skip to redirect Home Screen
                  const SignInToHomeScreen(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
