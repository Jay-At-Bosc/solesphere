import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
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
      automaticallyImplyLeading: false,
      centerTitle: true,
      titleTextStyle: STextTheme.lightTextTheme.displayMedium!
          .copyWith(color: SColors.textPrimaryWith80),
      title: const Text(
        SLabels.userDetails,
        overflow: TextOverflow.ellipsis,
        textScaler: TextScaler.linear(1),
      ),
      backgroundColor: SColors.textWhite,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 2.0.getWidth()),
          child: TextButton(
            onPressed: () => Get.offAllNamed(Routes.home),
            child: Text(
              SLabels.skip,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: SColors.textPrimaryWith60),
              overflow: TextOverflow.ellipsis,
              textScaler: const TextScaler.linear(1),
            ),
          ),
        ),
      ],
    );
  }
}
