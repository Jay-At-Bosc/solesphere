import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/labels.dart';

class SVerticalText extends StatelessWidget {
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
        Row(
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaler: const TextScaler.linear(1),
              "Gandinagar, Gujarat",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        )
      ],
    );
  }
}
