import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/user_profile/shipping_address_controller.dart';
import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import 'package:solesphere/utils/theme/widget_themes/text_theme.dart';

class AddressTab extends GetView<ShippingAdddressController> {
  const AddressTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ButtonsTabBar(
            elevation: 1.0,
            controller: controller.adType,
            contentPadding: EdgeInsets.symmetric(horizontal: 4.0.getWidth()),
            splashColor: Colors.transparent,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: SColors.accent),
            unselectedDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: SColors.textWhite),
            labelStyle: STextTheme.lightTextTheme.bodySmall!
                .copyWith(color: SColors.textWhite),
            unselectedLabelStyle: STextTheme.lightTextTheme.bodySmall!
                .copyWith(color: SColors.secondary),
            tabs: const [
              Tab(
                icon: Icon(Iconsax.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Iconsax.bank),
                text: "Work",
              ),
              Tab(
                icon: Icon(Iconsax.location),
                text: "Other",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
