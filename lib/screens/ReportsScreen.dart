import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Center(
        child: Text(
          'Reports',
          style: ShadTheme.of(context).textTheme.h2,
        ),
      ),
    );
  }
}
