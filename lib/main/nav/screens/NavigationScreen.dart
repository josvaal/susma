import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:susma/main/nav/components/FloatingBottomBar.dart';
import 'package:susma/main/nav/pages/NavigationPage.dart';
import 'package:susma/main/nav/components/CustomAppBar.dart';
import 'package:susma/main/nav/utils/NavScreens.dart';

@RoutePage()
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;

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
