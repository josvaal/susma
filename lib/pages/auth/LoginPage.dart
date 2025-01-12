import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/components/auth/LoginForm.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback togglePage;
  const LoginPage({super.key, required this.togglePage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 16,
          ),
          child: LoginForm(
            formKey: formKey,
            togglePage: widget.togglePage,
          ),
        ),
      ),
    );
  }
}
