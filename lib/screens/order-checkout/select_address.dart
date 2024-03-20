import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/constants/labels.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

class AddressSelection extends StatelessWidget {
  const AddressSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.lightBackground.withOpacity(0.99),
      appBar: AppBar(
        title: Text(
          SLabels.selectAddress,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 2.0.getHeight(), left: 20.0, right: 20.0),
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
