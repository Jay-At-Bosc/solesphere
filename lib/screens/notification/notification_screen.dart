import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/heading/section_heading1.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/labels.dart';
import '../../utils/theme/widget_themes/text_theme.dart';

import 'widgets/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.lightBackground,
      appBar: AppBar(
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
                  Get.back();
                },
                icon: const Icon(Iconsax.arrow_left)),
          ),
        ),
        title: const Text(
          SLabels.notification,
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.linear(1),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Clear All",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: SColors.accent, fontSizeFactor: 0.8),
                overflow: TextOverflow.ellipsis,
                textScaler: const TextScaler.linear(1),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Day Heading
              SectionHeading(
                text: "Today",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              //Notification
              for (int i = 0; i < 10; i++) const NotificationTile(),
            ],
          ),
        ),
      ),
    );
  }
}
