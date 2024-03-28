import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../common/widgets/buttons/secondary_button.dart';
import '../../../common/widgets/text/text_style.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/labels.dart';
import '../../notification/widgets/notification_image_container.dart';

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({
    super.key,
    this.j = 1,
    this.child = const SizedBox(),
  });

  final int j;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 2.0.getHeight()),
      color: SColors.textWhite,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //order id
            STextStyle(
              text: "${SLabels.orderId} 1234567",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: Colors.black),
            ),

            //Order date
            STextStyle(
              text: "${SLabels.orderDate} Jan 26, 2024",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .apply(color: SColors.textPrimaryWith60),
            ),

            //Ordered Product List
            for (int i = 0; i < j + 1; i++)
              Padding(
                padding: EdgeInsets.only(top: 2.0.getHeight()),
                child: Row(
                  children: [
                    const NotificationImageContainer(
                      url: SImages.shoe1,
                    ),
                    SizedBox(
                      width: 3.0.getWidth(),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          STextStyle(
                            text: "name of product",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(color: Colors.black),
                            maxLine: 1,
                          ),
                          STextStyle(
                            text: "₹123",
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLine: 1,
                          ),
                          Container(
                            padding: EdgeInsets.all(1.0.getWidth()),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color:
                                    SColors.textPrimaryWith60.withOpacity(0.1)),
                            child: STextStyle(
                              text: "Placed",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .apply(color: Colors.blue),
                              maxLine: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                    STextStyle(
                      text: "Qty: 1",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.black),
                      maxLine: 1,
                    ),
                  ],
                ),
              ),

            SizedBox(
              height: 2.0.getHeight(),
            ),

            //child
            child,

            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryButton(
                  label: SLabels.viewDetails,
                  style: Theme.of(context).textTheme.labelMedium!,
                ),
                SecondaryButton(
                  label: SLabels.reorder,
                  style: Theme.of(context).textTheme.labelMedium!,
                  forground: SColors.textWhite,
                  background: SColors.accent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
