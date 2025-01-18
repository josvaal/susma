import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardPreviewIcon extends StatelessWidget {
  final String path;
  const CardPreviewIcon({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withValues(
              alpha: 0.1,
            ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
