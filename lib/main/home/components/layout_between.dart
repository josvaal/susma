import 'package:flutter/material.dart';

class LayoutBetween extends StatelessWidget {
  final Widget left;
  final Widget right;
  final double? spacing;
  final CrossAxisAlignment? crossAxis;
  const LayoutBetween({
    super.key,
    required this.left,
    required this.right,
    this.spacing,
    this.crossAxis,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: spacing ?? 0,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: crossAxis ?? CrossAxisAlignment.center,
      children: [
        left,
        right,
      ],
    );
  }
}
