import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/shoes_loading.dart';
import 'package:solesphere/screens/order/order_detail.screen.dart';
import 'package:solesphere/screens/order/view_order_controller.dart';
import 'package:solesphere/services/routes/app_pages.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/constants/icons.dart';
import 'package:solesphere/utils/constants/labels.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import '../../utils/constants/colors.dart';
import 'widget/my_order_card.dart';

class ViewOrderScreen extends GetView<ViewOrderController> {
  const ViewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final ct = Get.put(ViewOrderController());

    return Scaffold(
      backgroundColor: SColors.lightBackground.withOpacity(0.99),
      appBar: AppBar(
        title: Text(
          SLabels.myOrder,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: Get.previousRoute == '/home' ||
                Get.previousRoute == '/product-details'
            ? IconButton(
                onPressed: () {
                  Get.offAllNamed(Routes.home);
                },
                icon: const Icon(Iconsax.arrow_left))
            : null,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getUserOrders();
        },
        child: FutureBuilder(
          future: controller.getUserOrders(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                  // width: 50.0.getWidth(),
                  height: 31.0.getHeight(),
                  child: const ShoesLoading(loader: SJsons.loader));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: GetBuilder<ViewOrderController>(
                      id: controller.ordersId,
                      builder: (controller) => controller.isLoading
                          ? const ShoesLoading(loader: SJsons.loader)
                          : Column(
                              children: [
                                if (controller.orders.isNotEmpty)
                                  for (int i = 0;
                                      i < controller.orders.length;
                                      i++)
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const OrderDetailScreen(),
                                            arguments: {'index': i});
                                      },
                                      child: MyOrderCard(
                                        j: i,
                                      ),
                                    ),
                                if (controller.orders.isEmpty)
                                  const Center(
                                    child: Text("No Order Found"),
                                  )
                              ],
                            ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
