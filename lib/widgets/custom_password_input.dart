// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/labels.dart';

class CustomPasswordInput extends StatelessWidget {
  const CustomPasswordInput({
    super.key,
    required this.controller,
    this.keyboardType,
    required this.hintText,
    required this.node,
    required this.isObsecure,
    this.onIconTap,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final FocusNode node;
  final bool isObsecure;
  final void Function()? onIconTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: SColors.accent,
      cursorErrorColor: SColors.error,
      style: Theme.of(context).textTheme.titleSmall,
      focusNode: node,
      obscureText: isObsecure,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onIconTap,
          icon: !isObsecure
              ? const Icon(Iconsax.eye)
              : const Icon(Iconsax.eye_slash),
        ),
        errorStyle: Theme.of(context).textTheme.labelSmall,
        fillColor: SColors.primary,
        filled: true,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            color: SColors.error,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        hintText: node.hasFocus ? null : hintText,
        errorText: getErrorText(controller),
        hintStyle: Theme.of(context).textTheme.labelMedium,
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }

  String? getErrorText(TextEditingController controller) {
    if (node.hasFocus) return null;
    if (controller.text.trim().isEmpty) {
      return null;
    }
    // if (validator == null) {
    //   return null;
    // }
    return SLabels.hintText(hintText);
  }
}
