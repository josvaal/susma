import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingAnimationWidget.halfTriangleDot(
              color: Theme.of(context).colorScheme.onSurface,
              size: 50,
            ),
            SizedBox(height: 10.0),
            Text(
              'Cargando...',
              style: ShadTheme.of(context).textTheme.h4,
            )
          ],
        ),
      ),
    );
  }
}
