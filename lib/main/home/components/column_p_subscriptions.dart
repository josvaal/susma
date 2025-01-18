import 'package:flutter/material.dart';
import 'package:susma/main/home/components/card_v_p_subscription.dart';
import 'package:susma/main/home/models/preview_subscription.dart';

class ColumnPSubscriptions extends StatelessWidget {
  final List<PreviewSubscription> items;
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
          final PreviewSubscription item = items[index];
          return CardVPSubscription(item: item);
        },
      ),
    );
  }
}
