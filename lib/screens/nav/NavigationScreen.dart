import 'package:animations/animations.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:susma/components/home/FloatingBottomBar.dart';
import 'package:susma/pages/nav/NavigationPage.dart';
import 'package:susma/screens/HomeScreen.dart';
import 'package:susma/screens/ReportsScreen.dart';
import 'package:susma/screens/SettingsScreen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingBottomBar(
        pageIndex: currentPageIndex,
        destinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      body: NavigationPage(
        screens: screens,
        currentPageIndex: currentPageIndex,
      ),
    );
  }
}
