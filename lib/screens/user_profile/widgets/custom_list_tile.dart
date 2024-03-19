import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.leading,
    required this.title,
    required this.style,
    this.iconSize = 24,
    this.color = SColors.borderPrimary,
    this.trailing,
    required this.onTap,
  });
  final IconData? leading;
  final String title;
  final TextStyle style;
  final Color color;
  final IconData? trailing;
  final double? iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          leading,
          size: iconSize,
          color: color,
        ),
        title: Text(
          title,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          textScaler: const TextScaler.linear(1),
          style: style,
        ),
        trailing: Icon(
          trailing,
          size: iconSize,
        ),
      ),
    );
  }
}
