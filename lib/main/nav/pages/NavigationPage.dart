import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  final List<Widget> screens;
  final int currentPageIndex;
  const NavigationPage(
      {super.key, required this.screens, required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        );
      },
      child: screens[currentPageIndex],
    );
  }
}
