import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/route_config.dart';
import 'package:susma/screens/AuthScreen.dart';
import 'package:susma/screens/StartScreen.dart';

class AuthStateScreen extends StatefulWidget {
  final AppRouter appRouter;
  const AuthStateScreen({super.key, required this.appRouter});

  @override
  State<AuthStateScreen> createState() => _AuthStateScreenState();
}

class _AuthStateScreenState extends State<AuthStateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return StartScreen();
          } else if (snapshot.hasData && snapshot.data != null) {
            return ShadApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: widget.appRouter.config(),
            );
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}
