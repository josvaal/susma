import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/components/auth/RegisterForm.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback togglePage;
  const RegisterPage({super.key, required this.togglePage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<ShadFormState>();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 16,
          ),
          child: RegisterForm(
            formKey: formKey,
            togglePage: widget.togglePage,
          ),
        ),
      ),
    );
  }
}
