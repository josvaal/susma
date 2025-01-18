import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/main/auth/methods/auth_methods.dart';
import 'package:susma/main/home/components/column_p_subscriptions.dart';
import 'package:susma/main/home/components/row_p_subscriptions.dart';
import 'package:susma/main/home/components/layout_between.dart';
import 'package:susma/main/home/components/rounded_button.dart';
import 'package:susma/main/home/models/preview_subscription.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PreviewSubscription> items = [
    PreviewSubscription(
      title: 'Notion Team',
      icon: "assets/notion.svg",
      currency: 'USD',
      ammount: '10.99',
      daysLeft: 30,
      renewalDate: DateTime.now().add(Duration(days: 30)),
      renewalFrequency: 'Mes',
    ),
    PreviewSubscription(
      title: 'Netflix Premium',
      icon: "assets/netflix.svg",
      currency: 'USD',
      ammount: '5.99',
      daysLeft: 15,
      renewalDate: DateTime.now().add(Duration(days: 15)),
      renewalFrequency: 'Mes',
    ),
    PreviewSubscription(
      title: 'Spotify Premium',
      icon: "assets/spotify.svg",
      currency: 'EUR',
      ammount: '12.50',
      daysLeft: 10,
      renewalDate: DateTime.now().add(Duration(days: 10)),
      renewalFrequency: 'Mes',
    ),
    PreviewSubscription(
      title: 'Apple Music',
      icon: "assets/apple-music.svg",
      currency: 'USD',
      ammount: '8.49',
      daysLeft: 20,
      renewalDate: DateTime.now().add(Duration(days: 20)),
      renewalFrequency: 'Mes',
    ),
    PreviewSubscription(
      title: 'Google Drive',
      icon: "assets/google-drive.svg",
      currency: 'GBP',
      ammount: '6.99',
      daysLeft: 25,
      renewalDate: DateTime.now().add(Duration(days: 25)),
      renewalFrequency: 'Año',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LayoutBetween(
            left: Text(
              'Siguientes',
              style: ShadTheme.of(context).textTheme.large,
            ),
            right: RoundedButton(
              text: "Ver Todo",
              onPressed: () async {
                await accountSignOut();
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 94.0,
            child: RowPSubscriptions(items: items),
          ),
          SizedBox(
            height: 10.0,
          ),
          LayoutBetween(
            left: Text(
              'Todos',
              style: ShadTheme.of(context).textTheme.large,
            ),
            right: RoundedButton(
              text: "Ver Todo",
              onPressed: () async {
                await accountSignOut();
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ColumnPSubscriptions(items: items),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
