import 'package:flutter/material.dart';
import 'package:susma/main/home/components/card_v_p_subscription.dart';
import 'package:susma/main/home/models/model_subscription.dart';

class ColumnPSubscriptions extends StatelessWidget {
  final List<ModelSubscription> items;
  const ColumnPSubscriptions({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 15,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final ModelSubscription item = items[index];
          return CardVPSubscription(item: item);
        },
      ),
    );
  }
}
