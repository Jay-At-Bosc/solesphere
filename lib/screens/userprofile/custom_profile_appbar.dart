
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';

import '../../services/routes/app_pages.dart';
import '../../utils/constants/colors.dart';

import '../../utils/constants/labels.dart';
import '../../utils/theme/widget_themes/text_theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      titleTextStyle: STextTheme.lightTextTheme.bodyLarge,
      leadingWidth: 64.0,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: SColors.textWhite,
            // borderRadius: BorderRadius.circular(SSizes.buttonRadius),
            shape: BoxShape.circle,
          ),
          child: IconButton(
              onPressed: () {
                Get.offNamed(Routes.signup);
              },
              icon: const Icon(Iconsax.arrow_left)),
        ),
      ),
      title: const Text(
        SLabels.userDetails,
        overflow: TextOverflow.ellipsis,
        textScaler: TextScaler.linear(1),
      ),
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: TextButton(
            onPressed: () {
              Get.offAllNamed(Routes.home);
            },
            child: Text(
              SLabels.skip,
              style: STextTheme.lightTextTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
              textScaler: const TextScaler.linear(1),
            ),
          ),
        ),
      ],
    );
  }
}
