import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/components/nav/FloatingBottomBar.dart';
import 'package:susma/pages/nav/NavigationPage.dart';
import 'package:susma/screens/HomeScreen.dart';
import 'package:susma/screens/ReportsScreen.dart';
import 'package:susma/screens/SettingsScreen.dart';
import 'package:susma/components/nav/CustomAppBar.dart';

@RoutePage()
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;

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

  PreferredSizeWidget? _getAppBar(BuildContext context) {
    final data = appBarData[currentPageIndex];
    return CustomAppBar(
      title: data["title"],
      avatarUrl: data["avatarUrl"],
      avatarPlaceholder: data["avatarPlaceholder"],
      actionIcon: data["actionIcon"],
      onPressed: data["onPressed"],
      leadingType: data["leadingType"],
      icon: data["icon"],
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingBottomBar(
        pageIndex: currentPageIndex,
        destinationSelected: _onPageChanged,
      ),
      body: NavigationPage(
        screens: screens,
        currentPageIndex: currentPageIndex,
      ),
    );
  }
}
