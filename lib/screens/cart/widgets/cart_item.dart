
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/cart/cart_controller.dart';

import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../common/widgets/text/text_style.dart';
import '../../../services/models/cart_model.dart';
import '../../notification/widgets/notification_image_container.dart';
import 'increament_section.dart';

class CartItem extends GetView<CartController> {
  const CartItem({
    super.key,
    required this.product,
  });
  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NotificationImageContainer(
            url: product.imgUrl,
          ),
          SizedBox(
            width: 2.0.getWidth(),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50.0.getWidth(),
                child: STextStyle(
                  text: product.productName,
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLine: 1,
                ),
              ),

              STextStyle(
                text: "₹${product.discountedPrice}",
                style: Theme.of(context).textTheme.labelMedium,
                maxLine: 2,
              ),

              //add or minus car
              IncreamentSection(product: product),
            ],
          ),
          IconButton(
            onPressed: () {
              controller.deleteFromCartApi(
                product,
                1,
              );
              Get.back();
            },
            icon: const Icon(
              Iconsax.trash,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
