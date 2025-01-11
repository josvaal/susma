import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:susma/pages/LoginPage.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
