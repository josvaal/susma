import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/main/home/components/card_v_icon.dart';
import 'package:susma/main/home/components/layout_between.dart';
import 'package:susma/main/home/models/model_subscription.dart';

class CardVPSubscription extends StatelessWidget {
  final ModelSubscription item;
  const CardVPSubscription({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(
                alpha: 0.1,
              ),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: LayoutBetween(
        left: LayoutBetween(
          spacing: 10.0,
          left: CardVIcon(path: item.icon),
          right: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5.0,
            children: [
              SizedBox(
                width: 75,
                child: Text(
                  item.title,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  style: ShadTheme.of(context).textTheme.small.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Text(
                item.renewalFrequency == "Mes"
                    ? DateFormat.MMMMd('es_ES').format(item.renewalDate)
                    : DateFormat('dd/MM/yyyy').format(item.renewalDate),
                style: ShadTheme.of(context).textTheme.small.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(
                            alpha: 0.5,
                          ),
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ),
        right: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 5.0,
          children: [
            Text(
              "${item.ammount} ${item.currency}",
              style: ShadTheme.of(context).textTheme.small.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "Cada ${item.renewalFrequency}",
              style: ShadTheme.of(context).textTheme.small.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(
                          alpha: 0.5,
                        ),
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
