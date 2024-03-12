import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../utils/constants/colors.dart';

class SSizeRoundedContainer extends StatelessWidget {
  const SSizeRoundedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0.getWidth(),
      height: 12.0.getWidth(),
      decoration: BoxDecoration(
          color: SColors.accent,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [BoxShadow(color: SColors.accent, blurRadius: 8)]),
      child: Center(
        child: Text(
          '2',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}