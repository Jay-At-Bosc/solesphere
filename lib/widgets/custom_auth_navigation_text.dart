import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CustomAuthNavigationText extends StatelessWidget {
  const CustomAuthNavigationText(
      {super.key, required this.label1, required this.label2,required this.onTap});

  final String label1;
  final String label2;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: label1,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: SColors.textPrimaryWith60),
            ),
            TextSpan(
              text: label2,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
