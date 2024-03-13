import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../common/widgets/text/text_style.dart';
import '../../../utils/constants/colors.dart';

class NotificationTitlePrice extends StatelessWidget {
  const NotificationTitlePrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50.0.getWidth(),
          child: STextStyle(
            text: "We have new Product with offers",
            style: Theme.of(context).textTheme.labelMedium,
            maxLine: 2,
          ),
        ),
        SizedBox(
          height: 1.0.getHeight(),
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.black, fontWeightDelta: 2),
            children: [
              const TextSpan(
                text: '₹364 ',
              ),
              TextSpan(
                text: '₹499',
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: SColors.textPrimaryWith60,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}