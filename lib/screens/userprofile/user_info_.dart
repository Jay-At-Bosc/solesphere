import 'package:flutter/material.dart';
import 'package:solesphere/widgets/custom_label.dart';

import '../../utils/constants/labels.dart';

import '../../widgets/custom_inputfield.dart';


class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomLabelText(labelText: SLabels.username),
        CustomInputField(
          hintText: SLabels.username,
          isObscure: false,
          validator: (value) {
            return value;
          },
          suffixIconColor: null,
          obscuringCharacter: "",
        ),
        const SizedBox(
          height: 8.0,
        ),
        const CustomLabelText(labelText: SLabels.email),
        CustomInputField(
          hintText: SLabels.email,
          isObscure: false,
          validator: (value) {
            return value;
          },
          suffixIconColor: null,
          obscuringCharacter: "",
        ),
        const SizedBox(
          height: 8.0,
        ),
        const CustomLabelText(labelText: SLabels.mobileNumber),
        CustomInputField(
            hintText: SLabels.mobileNumber,
            isObscure: false,
            validator: (value) {
              return value;
            },
            suffixIconColor: null,
            obscuringCharacter: "",
            keyboardType: TextInputType.phone,
            maxLength: 10),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}