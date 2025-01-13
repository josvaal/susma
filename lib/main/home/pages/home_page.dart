import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/main/auth/methods/auth_methods.dart';
import 'package:susma/main/home/components/horizontal_list.dart';
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
      title: 'Notion',
      icon: SvgPicture.asset(
        "assets/notion.svg",
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      currency: 'USD',
      ammount: '10.99',
      daysLeft: 30,
    ),
    PreviewSubscription(
      title: 'Netflix',
      icon: SvgPicture.asset(
        "assets/netflix.svg",
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      currency: 'USD',
      ammount: '5.99',
      daysLeft: 15,
    ),
    PreviewSubscription(
      title: 'Spotify',
      icon: SvgPicture.asset(
        "assets/spotify.svg",
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      currency: 'EUR',
      ammount: '12.50',
      daysLeft: 10,
    ),
    PreviewSubscription(
      title: 'Apple Music',
      icon: SvgPicture.asset(
        "assets/apple-music.svg",
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      currency: 'USD',
      ammount: '8.49',
      daysLeft: 20,
    ),
    PreviewSubscription(
      title: 'Google Drive',
      icon: SvgPicture.asset(
        "assets/google-drive.svg",
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      currency: 'GBP',
      ammount: '6.99',
      daysLeft: 25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 150.0,
          child: HorizontalList(items: items),
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
      ],
    );
  }
}
