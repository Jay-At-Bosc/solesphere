// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:solesphere/utils/constants/colors.dart';

class CustomSimpleInput extends StatelessWidget {
  const CustomSimpleInput({
    super.key,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.maxLength,
    this.hintText,
    this.enable = true,
    this.value,
    this.prefixText
  });

  final TextEditingController controller;
  final String? value;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final String? hintText;
  final String? prefixText;


  final bool enable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // initialValue: value,
      enabled: enable,
      controller: controller,
      validator: validator,
      maxLines: maxLength,
      cursorColor: SColors.accent,
      cursorErrorColor: SColors.error,
      style: Theme.of(context).textTheme.titleSmall,

      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.labelSmall,
        fillColor: SColors.primary,
        filled: true,
        prefixText: prefixText,
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
