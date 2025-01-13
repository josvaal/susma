import 'package:flutter/material.dart';

class LayoutBetween extends StatelessWidget {
  final Widget left;
  final Widget right;
  const LayoutBetween({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        left,
        right,
      ],
    );
  }
}
