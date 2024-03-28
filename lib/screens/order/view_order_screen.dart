import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/constants/labels.dart';
import '../../utils/constants/colors.dart';
import 'widget/my_order_card.dart';

class ViewOrderScreen extends StatelessWidget {
  const ViewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.lightBackground.withOpacity(0.99),
      appBar: AppBar(
        title: Text(
          SLabels.myOrder,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int j = 0; j < 5; j++)
                MyOrderCard(
                  j: j,
                  child: const Text("data"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
