import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home Page!',
              style: ShadTheme.of(context).textTheme.h2,
            ),
            ShadButton(
              child: const Text('Cerrar Sesión'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                context.router.replaceNamed('/auth');
              },
            )
          ],
        ),
      ),
    );
  }
}
