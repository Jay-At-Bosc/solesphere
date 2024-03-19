import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../services/repositories/authentication.dart';
import '../../../utils/constants/colors.dart';
import 'custom_divider.dart';
import 'custom_list_tile.dart';

class ProfileMenuItems extends StatelessWidget {
  const ProfileMenuItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.0.getHeight()),
      child: Column(
        children: [
          CustomListTile(
            title: 'Account',
            leading: Iconsax.user,
            trailing: Iconsax.arrow_right_3,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: SColors.textPrimaryWith80),
            onTap: () {},
          ),
          const CustomDivider(),
          CustomListTile(
            title: 'Shipping Address',
            leading: Iconsax.shopping_cart,
            trailing: Iconsax.arrow_right_3,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: SColors.textPrimaryWith80),
            onTap: () {},
          ),
          const CustomDivider(),
          CustomListTile(
            title: 'Payment Info',
            leading: Iconsax.wallet_1,
            trailing: Iconsax.arrow_right_3,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: SColors.textPrimaryWith80),
            onTap: () {},
          ),
          const CustomDivider(),
          CustomListTile(
            title: 'Notification Setting',
            leading: Iconsax.notification_bing,
            trailing: Iconsax.arrow_right_3,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: SColors.textPrimaryWith80),
            onTap: () {},
          ),
          const CustomDivider(),
          CustomListTile(
            title: 'Delete Account',
            leading: Iconsax.trash,
            trailing: Iconsax.arrow_right_3,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: SColors.textPrimaryWith80),
            onTap: () {},
          ),
          const CustomDivider(),
          CustomListTile(
            title: 'Help & Support',
            leading: Iconsax.call_calling,
            trailing: Iconsax.arrow_right_3,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: SColors.textPrimaryWith80),
            onTap: () {},
          ),
          const CustomDivider(),
          CustomListTile(
            title: 'Logout',
            leading: Iconsax.logout,
            color: Colors.red,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: Colors.red),
            onTap: () {
              AuthenticationRepository.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
