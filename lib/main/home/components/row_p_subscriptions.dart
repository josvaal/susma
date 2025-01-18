import 'package:flutter/material.dart';
import 'package:susma/main/home/components/card_h_p_subscriptions.dart';
import 'package:susma/main/home/models/model_subscription.dart';

class RowPSubscriptions extends StatelessWidget {
  final List<ModelSubscription> items;
  const RowPSubscriptions({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 15,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final ModelSubscription item = items[index];
        return CardHPSubscriptions(item: item);
      },
    );
  }
}
