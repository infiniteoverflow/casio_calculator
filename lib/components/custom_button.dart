import 'package:casio_calculator/constants/app_constants.dart';
import 'package:casio_calculator/constants/strings.dart';
import 'package:casio_calculator/utils/notifiers.dart';
import 'package:casio_calculator/utils/operations_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.shadowOffset,
    this.borderWidth,
    this.child,
    this.buttonType,
    this.buttonValue,
    this.color,
  });

  final double? height;
  final double? width;
  final double? borderRadius;
  final double? borderWidth;
  final Offset? shadowOffset;
  final Widget? child;
  final KeyTypes? buttonType;
  final String? buttonValue;
  final Color? color;

  final List operators = ['+', '-', 'x', '/'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String screenValue = Notifiers.screenDisplayNotifier.value;

        switch (buttonType) {
          case KeyTypes.action:
            if (buttonValue == 'AC') {
              Notifiers.screenDisplayNotifier.value = '';
              Notifiers.historyDisplayNotifier.value.clear();
            }
            break;
          case KeyTypes.operator:
            String displayValue = Notifiers.screenDisplayNotifier.value;
            Notifiers.screenDisplayNotifier.value =
                buttonValue == '=' ? '' : buttonValue;
            Notifiers.historyDisplayNotifier.value.add(displayValue);

            if (buttonValue == '=') {
              Notifiers.screenDisplayNotifier.value = OperationUtil.total(
                Notifiers.historyDisplayNotifier.value,
              );
              Notifiers.historyDisplayNotifier.value.clear();
            } else {
              Notifiers.historyDisplayNotifier.value.add(buttonValue!);
            }
            break;
          case KeyTypes.digit:
            if (operators.contains(Notifiers.screenDisplayNotifier.value)) {
              screenValue = '';
            }
            if (buttonValue == '.') {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Row(
                    children: [
                      Expanded(
                        child: Text(
                          Strings.decimalCtaMessage,
                          style: GoogleFonts.roboto(
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }

            Notifiers.screenDisplayNotifier.value =
                screenValue + (buttonValue ?? '');
            break;
          default:
        }
      },
      child: Container(
        height: height ?? 80,
        width: width ?? 80,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
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
