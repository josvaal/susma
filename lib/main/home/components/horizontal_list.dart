import 'package:flutter/material.dart';
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
        final item = items[index];
        return Container(
          width: 100,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.1),
              width: 1.0,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.icon,
              SizedBox(height: 8),
              Text(
                item.title,
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
