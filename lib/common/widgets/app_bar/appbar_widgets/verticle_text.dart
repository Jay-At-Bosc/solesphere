
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/home/controller/home_controller.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/labels.dart';

class SVerticalText extends GetView<HomeController> {
  const SVerticalText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textScaler: const TextScaler.linear(1),
          SLabels.yourLocation,
          style: Theme.of(context).textTheme.bodySmall!.apply(
                overflow: TextOverflow.ellipsis,
              ),
        ),
        GetBuilder<HomeController>(
          id: 'location',
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 2.0),
                child: Icon(
                  Iconsax.location,
                  size: 14,
                  color: SColors.errorIcon,
                ),
              ),
              Text(
                '${controller.city.toString()} ${controller.state.toString()}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textScaler: const TextScaler.linear(1),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        )
      ],
    );
  }
}
