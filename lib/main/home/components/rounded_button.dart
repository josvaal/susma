import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const RoundedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      decoration: ShadDecoration(
        border: ShadBorder(
          radius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: ShadTheme.of(context).textTheme.small.copyWith(
              fontSize: 12,
            ),
      ),
    );
  }
}
