import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.forground = Colors.black,
    this.background = const Color.fromARGB(255, 237, 236, 236),
    this.elevation = 0,
    this.style,
    required this.label,
    this.index,
    required this.onPress,
  });
  final Color forground;
  final Color background;
  final double? elevation;
  final TextStyle? style;
  final String label;
  final int? index;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38.0.getWidth(),
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: forground,
          backgroundColor: background,
          padding:
              EdgeInsets.symmetric(vertical: 1.5.getHeight()), // Button padding

          elevation: elevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: style,
        ),
        child: Text(label),
      ),
    );
  }
}
