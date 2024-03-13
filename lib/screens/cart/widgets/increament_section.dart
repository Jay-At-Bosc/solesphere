import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../../../common/widgets/text/text_style.dart';
import '../../../utils/constants/colors.dart';
import 'increament_item_button.dart';

class IncreamentSection extends StatelessWidget {
  const IncreamentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IncreaseItemButton(
          icon: Iconsax.minus,
          onTap: () {},
          // color: SColors.accent,
        ),
        const SizedBox(
          width: 12.0,
        ),
        STextStyle(
          text: "100",
          style: Theme.of(context).textTheme.labelMedium,
          maxLine: 1,
        ),
        const SizedBox(
          width: 12.0,
        ),
        IncreaseItemButton(
          icon: Iconsax.add,
          onTap: () {},
          color: SColors.accent,
          iconColor: SColors.primary,
        ),
      ],
    );
  }
}