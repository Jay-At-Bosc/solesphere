import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../services/routes/app_pages.dart';
import '../../../utils/constants/colors.dart';
import 'drawer_options.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 7.0.getHeight()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SDrawerOption(
            icon: Iconsax.user,
            text: "Profile",
            route: Routes.home,
          ),
          const SDrawerOption(
            icon: Iconsax.home_1,
            text: "Home",
            route: Routes.home,
          ),
          const SDrawerOption(
            icon: Iconsax.shopping_bag,
            text: "My Cart", route: Routes.cart,
            // onTap: () {},
          ),
          const SDrawerOption(
            icon: Iconsax.heart,
            text: "Favorite", route: Routes.favourite,
            // onTap: () {},
          ),
          const SDrawerOption(
            icon: Iconsax.truck_fast,
            text: "Orders", route: Routes.home,
            // onTap: () {},
          ),
          const SDrawerOption(
            icon: Iconsax.notification_bing,
            text: "Notifications",
            route: Routes.notification,

            // onTap: () {},
          ),
          SizedBox(
            width: 50.0.getWidth(),
            child: Divider(
              thickness: 2,
              color: SColors.textWhite.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 2.0.getHeight()),
          const SDrawerOption(
            icon: Iconsax.logout,
            text: "Sign Out", route: Routes.signin,
            // onTap: () {},
          ),
        ],
      ),
    );
  }
}
