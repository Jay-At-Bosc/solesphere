import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';

class NotificationImageContainer extends StatelessWidget {
  const NotificationImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0.getWidth(),
      height: 20.0.getWidth(),
      decoration: BoxDecoration(
        color: SColors.primary,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: SColors.textPrimaryWith60.withOpacity(0.1),
        ),
      ),
      child: ClipRRect(
        child: Center(
          child: Image.asset(
            SImages.shoe1,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
