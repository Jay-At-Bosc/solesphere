// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants/colors.dart';

class CustomPasswordInput extends StatelessWidget {
  const CustomPasswordInput({
    super.key,
    required this.controller,
    this.keyboardType,
    required this.hintText,
    required this.isObsecure,
    this.onIconTap,
    this.validator,
    this.enable =true,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final bool isObsecure;
  final void Function()? onIconTap;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enable,
      validator: validator,
      
      cursorColor: SColors.accent,
      cursorErrorColor: SColors.error,
      style: Theme.of(context).textTheme.titleSmall,
      obscureText: isObsecure,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          highlightColor: Colors.transparent,
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
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
