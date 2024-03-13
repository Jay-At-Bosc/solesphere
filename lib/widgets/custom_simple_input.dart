// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:solesphere/utils/constants/colors.dart';

import '../utils/constants/labels.dart';

class CustomSimpleInput extends StatelessWidget {
  const CustomSimpleInput({
    super.key,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.maxLength,
    required this.node,
    required this.hintText,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final String hintText;
  final FocusNode node;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: SColors.accent,
      cursorErrorColor: SColors.error,
      style: Theme.of(context).textTheme.titleSmall,
      focusNode: node,
      decoration: InputDecoration(
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
    if (validator == null) {
      return null;
    }
    return SLabels.hintText(hintText);
  }
}
