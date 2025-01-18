import 'package:flutter/material.dart';
import 'package:susma/main/home/components/card_preview_subscriptions.dart';
import 'package:susma/main/home/models/preview_subscription.dart';

class HorizontalList extends StatelessWidget {
  final List<PreviewSubscription> items;
  const HorizontalList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final PreviewSubscription item = items[index];
        return CardPreviewSubscriptions(item: item);
      },
    );
  }
}
