import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:susma/pages/LoginPage.dart';
import 'package:susma/pages/RegisterPage.dart';
import 'package:animations/animations.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ValueNotifier<bool> isLoginPage = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isLoginPage,
      builder: (context, isLogin, child) {
        return Scaffold(
          body: PageTransitionSwitcher(
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
            child: isLogin
                ? LoginPage(
                    key: const ValueKey('LoginPage'),
                    togglePage: () {
                      isLoginPage.value = false;
                    },
                  )
                : RegisterPage(
                    key: const ValueKey('RegisterPage'),
                    togglePage: () {
                      isLoginPage.value = true;
                    },
                  ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    isLoginPage.dispose();
    super.dispose();
  }
}
