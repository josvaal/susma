import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const RoundedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      decoration: ShadDecoration(
        border: ShadBorder(
          radius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
