import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../common/widgets/text/text_style.dart';
import '../../notification/widgets/notification_image_container.dart';
import 'increament_section.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NotificationImageContainer(),
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
                  text: "Air Jordan",
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLine: 1,
                ),
              ),

              STextStyle(
                text: "₹499",
                style: Theme.of(context).textTheme.labelMedium,
                maxLine: 2,
              ),

              //add or minus car
              const IncreamentSection(),
            ],
          ),
          IconButton(
            onPressed: () {},
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
