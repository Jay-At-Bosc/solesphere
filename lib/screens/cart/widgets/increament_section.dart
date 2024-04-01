
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/cart/cart_controller.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';

import '../../../common/widgets/text/text_style.dart';
import '../../../services/models/cart_model.dart';
import '../../../utils/constants/colors.dart';
import 'increament_item_button.dart';

class IncreamentSection extends GetView<CartController> {
  const IncreamentSection({
    super.key,
    required this.product,
  });
  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IncreaseItemButton(
          icon: Iconsax.minus,
          onTap: () async {
            await controller.deleteFromCartApi(product, 0);
            Get.back();
          },
          isLoading: controller.isDecrement.value,
          // color: SColors.accent,
        ),
        const SizedBox(
          width: 12.0,
        ),
        // STextStyle(
        //   text: controller.cartItemsList[index].quantity.toString(),
        //   style: Theme.of(context).textTheme.labelMedium,
        //   maxLine: 1,
        // ),
        GetBuilder<CartController>(
          id: 'quantity',
          builder: (controller) =>
              STextStyle(text: product.quantity.toString()),
        ),
        const SizedBox(
          width: 12.0,
        ),
        IncreaseItemButton(
          icon: Iconsax.add,
          onTap: () async {
            await controller.increaseQuantity(product);
            Get.back();
          },
          isLoading: controller.isIncreament.value,
          color: SColors.accent,
          iconColor: SColors.primary,
        ),
      ],
    );
  }
}
