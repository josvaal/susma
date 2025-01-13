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
        "https://i.pinimg.com/736x/8e/a0/2d/8ea02d032fc7bc6855db955ee4a2a665.jpg",
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
