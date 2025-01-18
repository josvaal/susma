import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/main/home/components/card_preview_icon.dart';
import 'package:susma/main/home/components/layout_between.dart';
import 'package:susma/main/home/models/preview_subscription.dart';

class CardPreviewSubscriptions extends StatelessWidget {
  final PreviewSubscription item;
  const CardPreviewSubscriptions({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
          width: 1.0,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBetween(
            spacing: 10.0,
            left: CardPreviewIcon(path: item.icon),
            right: Column(
              spacing: 5.0,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.ammount} ${item.currency}",
                  style: ShadTheme.of(context).textTheme.small.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Quedan ${item.daysLeft} días",
                  style: ShadTheme.of(context).textTheme.small.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSurface.withValues(
                                  alpha: 0.5,
                                ),
                        fontSize: 12,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Text(
            item.title,
            style: ShadTheme.of(context).textTheme.small.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
