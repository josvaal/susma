import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardVIcon extends StatelessWidget {
  final String path;
  const CardVIcon({super.key, required this.path});

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
        width: 32,
        height: 32,
        "assets/$path.svg",
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
