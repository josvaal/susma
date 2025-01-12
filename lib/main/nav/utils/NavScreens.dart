import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/main/home/screens/HomeScreen.dart';
import 'package:susma/main/reports/screens/ReportsScreen.dart';
import 'package:susma/main/settings/screens/SettingsScreen.dart';

final List<Widget> screens = [
  HomeScreen(),
  ReportsScreen(),
  SettingsScreen(),
];

final List<Map<String, dynamic>> appBarData = [
  {
    "title": "José Valentino",
    "leadingType": 'avatar',
    "avatarUrl":
        "https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4",
    "avatarPlaceholder": "JV",
    "actionIcon": LucideIcons.plus,
    "onPressed": () {}
  },
  {
    "title": "Reportes",
    "leadingType": 'icon',
    "icon": LucideIcons.chartBar,
  },
  {
    "title": "Ajustes",
    "leadingType": 'icon',
    "icon": LucideIcons.settings2,
    "actionIcon": LucideIcons.user,
    "onPressed": () {}
  },
];
