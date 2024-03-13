import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/labels.dart';
import '../../utils/theme/widget_themes/text_theme.dart';
import 'widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: STextTheme.lightTextTheme.bodyLarge,
        leadingWidth: 64.0,
        // leading: Padding(
        //   padding: const EdgeInsets.only(
        //     left: 20.0,
        //   ),
        //   child: Container(
        //     decoration: const BoxDecoration(
        //       color: SColors.textWhite,
        //       // borderRadius: BorderRadius.circular(SSizes.buttonRadius),
        //       shape: BoxShape.circle,
        //     ),
        //     child: IconButton(
        //         onPressed: () {
        //           Get.back();
        //         },
        //         icon: const Icon(Iconsax.arrow_left)),
        //   ),
        // ),
        title: const Text(
          SLabels.myCart,
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.linear(1),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartItem(),
              CartItem(),
              CartItem(),
            ],
          ),
        ),
      ),
    );
  }
}
