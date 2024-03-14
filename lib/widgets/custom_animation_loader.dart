import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/constants/icons.dart';
import '../utils/extensions/responsive_extension.dart';

class CustomAnimationLoader extends StatelessWidget {
  const CustomAnimationLoader({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(SJsons.loader, width: 8.0.getWidth()),
          SizedBox(
            height: 2.0.getHeight(),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2.0.getHeight(),
          ),
          showAction ? SizedBox(
            width: 250,
            child: OutlinedButton(
              onPressed: onActionPressed,
              child: Text(actionText!),
            ),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
