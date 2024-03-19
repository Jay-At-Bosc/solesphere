import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';

import '../../utils/theme/widget_themes/text_theme.dart';

class CustomAddressTab extends StatelessWidget {
  const CustomAddressTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: SColors.accent),
            unselectedDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: SColors.textWhite),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            labelStyle: STextTheme.lightTextTheme.bodySmall!
                .copyWith(color: SColors.textWhite),
            unselectedLabelStyle: STextTheme.lightTextTheme.bodySmall!
                .copyWith(color: SColors.secondary),
            tabs: const  [
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
