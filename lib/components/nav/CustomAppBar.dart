import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/components/nav/NavActionButton.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String leadingType;
  final String? avatarUrl;
  final String? avatarPlaceholder;
  final IconData? icon;
  final String title;
  final IconData? actionIcon;
  final void Function()? onPressed;

  const CustomAppBar({
    super.key,
    required this.leadingType,
    this.avatarUrl,
    this.avatarPlaceholder,
    this.icon,
    required this.title,
    this.actionIcon,
    this.onPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget? _buildLeading() {
    switch (leadingType) {
      case "icon":
        return icon != null
            ? Icon(
                icon,
                size: 30,
              )
            : null;
      case "avatar":
        if (avatarUrl != null && avatarPlaceholder != null) {
          return ShadAvatar(
            avatarUrl!,
            placeholder: Text(avatarPlaceholder!),
          );
        }
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: _buildLeading(),
      ),
      title: Text(
        title,
        style: ShadTheme.of(context).textTheme.h4,
      ),
      actions: actionIcon != null
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: NavActionButton(
                  icon: actionIcon!,
                  onPressed: onPressed!,
                ),
              ),
            ]
          : null,
      elevation: 0,
    );
  }
}
