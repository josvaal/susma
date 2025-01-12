import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NavActionButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  const NavActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      decoration: ShadDecoration(
        border: ShadBorder(
          radius: BorderRadius.circular(30),
        ),
      ),
      icon: ShadImage(icon),
      onPressed: onPressed,
    );
  }
}
