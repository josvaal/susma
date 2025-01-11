import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SufixPassword extends StatelessWidget {
  final bool obscure;
  final void Function() onPressed;

  const SufixPassword(
      {super.key, required this.onPressed, required this.obscure});

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      width: 24,
      height: 24,
      padding: EdgeInsets.zero,
      decoration: const ShadDecoration(
        secondaryBorder: ShadBorder.none,
        secondaryFocusedBorder: ShadBorder.none,
      ),
      icon: ShadImage.square(
        size: 16,
        obscure ? LucideIcons.eyeOff : LucideIcons.eye,
      ),
      onPressed: onPressed,
    );
  }
}
