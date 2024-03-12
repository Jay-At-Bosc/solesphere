import 'package:flutter/material.dart';

import '../../../common/widgets/heading/deal_label.dart';
import '../../../utils/constants/colors.dart';


class ProductDealOfTheDay extends StatelessWidget {
  const ProductDealOfTheDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DealLabel(
          text: 'Deal Of The Day',
          color: SColors.accent,
          padding: 10.0,
          radius: 10,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: Colors.white),
        ),
        RichText(
          text: TextSpan(
            text: '-45% ',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .apply(color: Colors.red, fontSizeFactor: 1.1),
            children: <TextSpan>[
              TextSpan(
                text: '₹499',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .apply(color: Colors.black, fontSizeFactor: 1.4),
              ),
            ],
          ),
        ),
        Text(
          'M.R.P.: ₹999',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: SColors.textPrimaryWith80),
        ),
      ],
    );
  }
}