import 'package:flutter/material.dart';
import 'package:solesphere/widgets/custom_label.dart';

import '../../utils/constants/labels.dart';


import '../../widgets/custom_simple_input.dart';


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
        CustomSimpleInput(
          hintText: SLabels.username,
         controller: TextEditingController(),
         
        ),
        const SizedBox(
          height: 8.0,
        ),
        const CustomLabelText(labelText: SLabels.email),
        CustomSimpleInput(
          hintText: SLabels.email,
          controller: TextEditingController(),
        
        ),
        const SizedBox(
          height: 8.0,
        ),
        const CustomLabelText(labelText: SLabels.mobileNumber),
        CustomSimpleInput(
            hintText: SLabels.mobileNumber,
           controller: TextEditingController(),
        
            keyboardType: TextInputType.phone,
            maxLength: 10),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}