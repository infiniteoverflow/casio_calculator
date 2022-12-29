import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.shadowOffset,
    this.borderWidth,
    this.child,
  });

  final double? height;
  final double? width;
  final double? borderRadius;
  final double? borderWidth;
  final Offset? shadowOffset;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
