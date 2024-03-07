import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class SLeadingDrawer extends StatelessWidget {
  const SLeadingDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        icon: const Icon(Iconsax.menu5),
        color: SColors.textSecondary,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}
