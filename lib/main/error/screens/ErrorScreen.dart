import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.circleX,
              size: 50,
            ),
            SizedBox(height: 10.0),
            Text(
              '¡Error! Algo salió mal',
              style: ShadTheme.of(context).textTheme.h4,
            )
          ],
        ),
      ),
    );
  }
}
