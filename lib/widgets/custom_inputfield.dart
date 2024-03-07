// --------------------------- Start CustomInputField --------------------------- 

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solesphere/utils/constants/colors.dart';


import '../utils/theme/widget_themes/text_field_theme.dart';
import '../utils/theme/widget_themes/text_theme.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String? suffixIconData; // Nullable IconData for the suffix icon
  final String? suffixIconData1; // Nullable IconData for the suffix icon
  final Color? suffixIconColor;
  final VoidCallback? onPressedSuffixIcon;
  final bool isObscure;
  final String? obscuringCharacter;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator; // Add validator
  final int? maxLength;

  const CustomInputField({
    super.key,
    required this.hintText,
    this.suffixIconData,
    this.onPressedSuffixIcon,
    required this.suffixIconColor,
    required this.isObscure,
    required this.obscuringCharacter,
    required this.validator,
    this.suffixIconData1,
     this.keyboardType,
     this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    RxBool check = isObscure.obs;
    final FocusNode node = FocusNode();

    return Obx(
      () => TextFormField(
        inputFormatters: [ LengthLimitingTextInputFormatter(maxLength)],
        focusNode: node,
        validator: validator,
        obscureText: check.value,
        obscuringCharacter: isObscure ? obscuringCharacter! : " ",
        cursorColor: SColors.accent,
        style: STextTheme.lightTextTheme.titleSmall,
        keyboardType: keyboardType,
        
        decoration: InputDecoration(
          errorStyle: STextTheme.lightTextTheme.labelSmall,
          suffixIcon: suffixIconData != null
              ? InkWell(
                  child: Obx(
                    () => IconButton(
                      onPressed: () {
                        check.value = !check.value;
                        print(check);
                      },
                      icon: check.value
                          ? SvgPicture.asset(suffixIconData!)
                          : SvgPicture.asset(suffixIconData1!),
                    ),
                  ),
                )
              : null,
          suffixIconColor: SColors.primaryIcon,
          // fillColor: SColors.textWhite,
          fillColor: STextFormFieldTheme.lightInputDecorationTheme.fillColor,
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
          // border: InputBorder.none,
          hintText: node.hasFocus ? "" : hintText,
          hintStyle: STextTheme.lightTextTheme.labelMedium,
          contentPadding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}

// --------------------------- End CustomInputField ---------------------------