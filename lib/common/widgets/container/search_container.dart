import 'package:flutter/material.dart';
import 'package:solesphere/utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = false,
    this.isSuffix = false,
    this.suffixIcon,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final bool isSuffix;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        height: 58,
        padding: const EdgeInsets.all(SSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? SColors.darkBackground
                  : SColors.textWhite
              : Colors.transparent,
          borderRadius: BorderRadius.circular(SSizes.buttonRadius),
          border: showBorder
              ? Border.all(color: dark ? SColors.darkBackground : SColors.secondary)
              : null,
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: SColors.textSecondary,
            ),
            const SizedBox(
              width: SSizes.spaceBtwItems,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 14.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: text,
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: SColors.textSecondary.withOpacity(0.7),
                          fontFamily: 'AirbnbCereal',
                        
                          overflow: TextOverflow.ellipsis,
                        ),
                    border: InputBorder.none,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: SColors.textSecondary,
                        fontFamily: 'AirbnbCereal',
                      ),
                ),
              ),
            ),
            // const Spacer(),
            if (isSuffix)
              GestureDetector(
                onTap: () {},
                child: Icon(
                  suffixIcon,
                  color: SColors.textSecondary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
