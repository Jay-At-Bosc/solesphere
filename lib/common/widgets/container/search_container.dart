import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';
import 'package:solesphere/utils/constants/sizes.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';

class TSearchContainer extends GetView<ProductController> {
  const TSearchContainer(
   {
    super.key,
    required this.text,
    this.icon,
    this.isDisable = false,
    this.showBackground = true,
    this.showBorder = false,
    this.isSuffix = false,
    this.suffixIcon,
    this.suffixOnTap,
    this.prefficOnTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final bool isSuffix;
  final bool isDisable;
  final IconData? suffixIcon;
  final Function()? suffixOnTap;
  final Function()? prefficOnTap;

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
              ? Border.all(
                  color: dark ? SColors.darkBackground : SColors.secondary)
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                prefficOnTap!();
              },
              child: Icon(
                icon,
                color: SColors.textSecondary,
              ),
            ),
            const SizedBox(
              width: SSizes.spaceBtwItems,
            ),
            Expanded(
              child: TextField(
                controller: controller.searchProduct,
                enabled: isDisable ? false : true,
                decoration: InputDecoration(
                  hintText: text,
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: SColors.textSecondary.withOpacity(0.7),
                        fontFamily: 'AirbnbCereal',
                        overflow: TextOverflow.ellipsis,
                      ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 2.4.getWidth(), horizontal: 0.0),
                  border: InputBorder.none,
                  // Center the hint text vertically
                  alignLabelWithHint: true,
                ),
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: SColors.textSecondary,
                      fontFamily: 'AirbnbCereal',
                    ),
              ),
            ),
            if (isSuffix)
              GestureDetector(
                onTap: () {
                  suffixOnTap!();
                },
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
