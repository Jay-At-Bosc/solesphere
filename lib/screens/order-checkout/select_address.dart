import 'package:solesphere/auth/auth_exports.dart';

import 'package:solesphere/screens/order-checkout/order_controller.dart';
import 'package:solesphere/screens/order-checkout/order_summary.dart';
import 'package:solesphere/screens/order-checkout/widgets/stepper.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/constants/labels.dart';

import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../services/routes/app_pages.dart';
import '../../widgets/custom_accent_color_button.dart';
import 'select_payment.dart';
import 'widgets/radioTile.dart';

// ignore: must_be_immutable
class AddressSelection extends GetView<OrderController> {
  AddressSelection({super.key});

  List<String> title = [
    SLabels.selectAddress,
    SLabels.selectPaymentMethod,
    SLabels.checkout,
  ];

  List<Widget> pageContent = <Widget>[
    GetBuilder<OrderController>(
      id: 'address',
      builder: (ctx) => SizedBox(
        height: Get.size.height * 0.5,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            final option = 'Option ${index + 1}';
            return CustomRadioListTile(
              option: option,
              title: SLabels.work,
              subTitle: '4517 Washington Ave. Manchester, Kentuky 39495',
            );
          },
        ),
      ),
    ),
    const PaymentSelection(),
    const OrderSummary(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.lightBackground.withOpacity(0.99),
      appBar: AppBar(
        title: GetBuilder<OrderController>(
          id: 'title',
          builder: (controller) => Text(
            title[controller.activeStep.value],
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 2.0.getHeight(), left: 20.0, right: 20.0),
          child: Column(
            children: [
              //custom Stepper
              const CustomeStepper(),

              SizedBox(
                height: 4.0.getHeight(),
              ),

              //Page Contents
              GetBuilder<OrderController>(
                id: 'pageContent',
                builder: (controller) => SizedBox(
                  child: pageContent[controller.activeStep.value],
                ),
              ),

              //Process Button
              GetBuilder<OrderController>(
                id: 'btn',
                builder: (controller) => SizedBox(
                  width: double.infinity,
                  // height: 10.0.getHeight(),
                  child: CustomAccentColorButton(
                    buttonLabel: controller.activeStep.value != 2
                        ? SLabels.next
                        : SLabels.payNow,
                    isLoading: false,
                    onPressed: () {
                      controller.setActiveStep(controller.activeStep.value + 1);
                      Get.toNamed(Routes.order);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
