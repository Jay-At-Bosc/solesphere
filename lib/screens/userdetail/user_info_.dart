import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/userdetail/user_detail_controller.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import 'package:solesphere/widgets/custom_label.dart';
import '../../utils/constants/labels.dart';
import '../../widgets/custom_simple_input.dart';

class UserInfo extends GetView<UserDetailsController> {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// UserName label & input Field
        CustomLabelText(
          labelText: SLabels.username,
          labelStyle: Theme.of(context).textTheme.labelLarge,
        ),
        CustomSimpleInput(
          controller: TextEditingController(text: controller.username),
          enable: false,
        ),
        SizedBox(
          height: 1.0.getHeight(),
        ),

        // User Email
        CustomLabelText(
          labelText: SLabels.email,
          labelStyle: Theme.of(context).textTheme.labelLarge,
        ),
        CustomSimpleInput(
          controller: TextEditingController(text: controller.useremail),
          enable: false,
        ),
        SizedBox(
          height: 1.0.getHeight(),
        ),
      ],
    );
  }
}
