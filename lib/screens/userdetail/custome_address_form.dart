import 'package:flutter/material.dart';
import 'package:solesphere/utils/theme/widget_themes/text_theme.dart';
import 'package:solesphere/widgets/custom_simple_input.dart';


import '../../utils/constants/labels.dart';
import '../../utils/theme/widget_themes/checkbox_theme.dart';

import '../../widgets/custom_label.dart';
import 'custom_address_tab.dart';

class CustomAddressForm extends StatelessWidget {
  const CustomAddressForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomLabelText(labelText: SLabels.address),
        //TabBar of Address
        const CustomAddressTab(),
        const SizedBox(
          height: 8.0,
        ),

        CustomSimpleInput(
          hintText: SLabels.addresslineOne,
          controller: TextEditingController(),
          // node: FocusNode(),
          validator: (value) {
            return value;
          },
          keyboardType: TextInputType.multiline,maxLength: 2,
        ),
        const SizedBox(
          height: 8.0,
        ),
        CustomSimpleInput(
          hintText: SLabels.addresslineTwo,
          controller: TextEditingController(),
         keyboardType: TextInputType.multiline,maxLength: 2,
        ),

        const SizedBox(
          height: 8.0,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomSimpleInput(
                hintText: SLabels.state,
                controller: TextEditingController(),
        
                maxLength: 1,
              ),
            ),
            Expanded(
              child: CustomSimpleInput(
                hintText: SLabels.zipcode,
                controller: TextEditingController(),
               
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
            ),
          ],
        ),

        Row(
          children: [
            CheckboxTheme(
                data: SCheckboxTheme.lightCheckboxTheme,
                child: Checkbox(
                  value: true,
                  onChanged: (_) {},
                )),
            Text(
              SLabels.defaultAddress,
              style: STextTheme.lightTextTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}