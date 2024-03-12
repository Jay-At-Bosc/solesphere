import 'package:solesphere/auth/auth_exports.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class SRoundedProductImage extends StatelessWidget {
  const SRoundedProductImage({
    super.key,
    this.width,
    this.height,
    required this.imgUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = SColors.primary,
    this.padding,
    this.isNetworkImage = false,
    this.onPress,
    this.fit = BoxFit.contain,
    this.borderRadius = SSizes.md,
  });

  final double? width, height;
  final String imgUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPress;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imgUrl)
                : AssetImage(
                    imgUrl,
                  ) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
