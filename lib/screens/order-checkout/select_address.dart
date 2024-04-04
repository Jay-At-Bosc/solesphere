import 'package:solesphere/auth/auth_exports.dart';

import 'package:solesphere/screens/order-checkout/order_controller.dart';
import 'package:solesphere/screens/order-checkout/order_summary.dart';
import 'package:solesphere/screens/order-checkout/widgets/stepper.dart';
import 'package:solesphere/screens/user_profile/shipping_address_controller.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/constants/labels.dart';

import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../services/routes/app_pages.dart';
import '../../widgets/custom_accent_color_button.dart';
import '../user_profile/widgets/address_bottomsheet.dart';
import 'select_payment.dart';
import 'widgets/radio_tile.dart';

// ignore: must_be_immutable
class AddressSelection extends GetView<OrderController> {
  AddressSelection({super.key});

  List<Widget> pageContent = <Widget>[
    GetBuilder<OrderController>(
      id: 'address',
      builder: (ctx) => Column(
        children: [
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: ctx.userAddresses.length,
              itemBuilder: (context, index) {
                // final option = 'Option ${index + 1}';
                return Column(
                  children: [
                    CustomRadioListTile(
                      option: index.toString(),
                      title: ctx.userAddresses[index].adType,
                      subTitle: ctx.fullAddress(index),
                    ),
                  ],
                );
              },
            ),
          ),
          if (ctx.userAddresses.length != 3)
            GetBuilder<ShippingAdddressController>(
              init: ShippingAdddressController(),
              builder: (sctx) => TextButton(
                onPressed: () {
                  sctx.setInitialValue(-1);
                  Get.bottomSheet(const AddressBottomSheet(
                    index: -1,
                  ));
                },
                child: const Text("Add Address"),
              ),
            )
        ],
      ),
    ),
    const PaymentSelection(),
    const OrderSummary(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: ,
      backgroundColor: SColors.lightBackground.withOpacity(0.99),
      appBar: AppBar(
        title: GetBuilder<OrderController>(
          id: 'title',
          builder: (controller) => Text(
            controller.pageTitle[controller.activeStep.value],
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<OrderController>(
        id: 'btn',
        builder: (controller) => BottomAppBar(
          surfaceTintColor: Colors.white,
          height: 10.0.getHeight(),
          child: CustomAccentColorButton(
            buttonLabel: controller.activeStep.value != 2
                ? SLabels.next
                : SLabels.payNow,
            isLoading: false,
            onPressed: () async {
              if (controller.activeStep.value == 1) {
                await controller.getOrderSummary();
              }
              if (controller.activeStep.value == 2) {
                await controller.processOrder();
                return;
              }
              if (controller.userAddresses.isNotEmpty) {
                controller.setActiveStep(controller.activeStep.value + 1);
                Get.toNamed(Routes.order);
              }
            },
          ),
        ),
      ),

      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            const CustomeStepper(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //custom Stepper

                      SizedBox(
                        height: 1.0.getHeight(),
                      ),

                      //Page Contents
                      GetBuilder<OrderController>(
                        id: 'pageContent',
                        builder: (controller) => controller.isMainLoading()
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : SizedBox(
                                child: pageContent[controller.activeStep.value],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
