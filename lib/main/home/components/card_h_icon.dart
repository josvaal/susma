import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardHIcon extends StatelessWidget {
  final String path;
  const CardHIcon({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withValues(
              alpha: 0.08,
            ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(
        "assets/$path.svg",
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
