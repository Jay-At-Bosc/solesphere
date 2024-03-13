import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../common/widgets/text/text_style.dart';
import 'notification_image_container.dart';
import 'notification_title_price.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 4.0.getWidth()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NotificationImageContainer(),
          SizedBox(
            width: 1.0.getWidth(),
          ),

          const NotificationTitlePrice(),
          SizedBox(
            width: 1.0.getWidth(),
          ),

          //Time of notification
          SizedBox(
            width: 14.0.getWidth(),
            child: STextStyle(
              text: "60 min ago",
              style: Theme.of(context).textTheme.labelMedium!.apply(
                    fontSizeFactor: 0.9,
                  ),
              maxLine: 3,
            ),
          ),
        ],
      ),
    );
  }
}
