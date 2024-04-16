import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/labels.dart';
import '../order_controller.dart';

class CustomeStepper extends StatelessWidget {
  const CustomeStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 13.0.getHeight(),
      // color: Colors.white,
      child: GetBuilder<OrderController>(
        id: OrderController().stepperId,
        builder: (ctx) => EasyStepper(
          activeStep: ctx.activeStep.value,
          stepShape: StepShape.rRectangle,
          stepBorderRadius: 3.0.getWidth(),
          borderThickness: 2,
          // padding: const EdgeInsets.all(0.0),
          stepRadius: 3.4.getHeight(),
          // finishedStepBorderColor: SColors.accent,
          // finishedStepTextColor: SColors.accent,
          finishedStepBackgroundColor: SColors.accent,
          // activeStepIconColor: SColors.accent,
          unreachedStepBackgroundColor: SColors.buttonDisabled,
          showLoadingAnimation: false,
          steps: [
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: ctx.activeStep.value >= 0 ? 1 : 0.3,
                  child: Icon(
                    Iconsax.location,
                    color: ctx.activeStep.value >= 1 ? SColors.textWhite : null,
                  ),
                ),
              ),
              customTitle: const Text(
                SLabels.address,
                textAlign: TextAlign.center,
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: ctx.activeStep.value >= 1 ? 1 : 0.3,
                  child: Icon(
                    Iconsax.card,
                    color: ctx.activeStep.value >= 2 ? SColors.textWhite : null,
                  ),
                ),
              ),
              customTitle: const Text(
                SLabels.payment,
                textAlign: TextAlign.center,
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: ctx.activeStep.value >= 2 ? 1 : 0.3,
                  child: const Icon(Iconsax.clipboard_text),
                ),
              ),
              customTitle: const Text(
                SLabels.summary,
                textAlign: TextAlign.center,
              ),
            ),
          ],
          onStepReached: (index) async {
            if (ctx.userAddresses.isNotEmpty) {
              await ctx.setActiveStep(index);
              await ctx.getOrderSummary();
            }
          },
        ),
      ),
    );
  }
}
