import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width = double.infinity,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = SColors.primary,
    this.fit = BoxFit.contain,
    this.isNetworkImage = true,
    required this.onPress,
    this.borderRadius = SSizes.md,
    this.padding,
  });
  final double? width;
  final double? height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback onPress;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image.network(
            imageUrl,
            fit: fit,
          ),
          // child: Image(
          //     fit: fit,
          //     image: isNetworkImage
          //         ? NetworkImage(imageUrl)
          //         : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}
