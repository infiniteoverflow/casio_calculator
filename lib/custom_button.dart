import 'package:casio_calculator/app_constants.dart';
import 'package:casio_calculator/notifiers.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.shadowOffset,
    this.borderWidth,
    this.child,
    this.buttonType,
    this.buttonValue,
  });

  final double? height;
  final double? width;
  final double? borderRadius;
  final double? borderWidth;
  final Offset? shadowOffset;
  final Widget? child;
  final KeyTypes? buttonType;
  final String? buttonValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String screenValue = Notifiers.mainDigitsNotifier.value.toString();
        switch (buttonType) {
          case KeyTypes.action:
            if (buttonValue == 'AC') {
              Notifiers.mainDigitsNotifier.value = 0;
            }
            break;
          case KeyTypes.operator:
            // TODO: Handle this case.
            break;
          case KeyTypes.digit:
            if (screenValue == '0') {
              Notifiers.mainDigitsNotifier.value =
                  int.parse(buttonValue ?? '0');
            } else {
              Notifiers.mainDigitsNotifier.value = int.parse(
                  Notifiers.mainDigitsNotifier.value.toString() +
                      (buttonValue ?? ''));
            }
            break;
          default:
        }
      },
      child: Container(
        height: height ?? 80,
        width: width ?? 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          border: Border.all(
            color: Colors.black,
            width: borderWidth ?? 4,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: shadowOffset ?? const Offset(4, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
