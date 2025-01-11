import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/components/login/FormInput.dart';
import 'package:susma/components/login/SufixPassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<ShadFormState>();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child: ShadForm(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Iniciar Sesión',
                  style: ShadTheme.of(context).textTheme.h1,
                ),
                const SizedBox(height: 20),
                FormInput(
                  id: "email",
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  label: 'Correo Electrónico',
                  placeholder: "usuario@mail.com",
                  validator: (v) {
                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (v.isEmpty) {
                      return 'El campo no puede estar vacío.';
                    } else if (!emailRegex.hasMatch(v)) {
                      return 'Ingrese un correo electrónico válido.';
                    }
                    return null; // Válido
                  },
                  icon: LucideIcons.mail,
                ),
                const SizedBox(height: 16),
                FormInput(
                  id: "password",
                  obscureText: obscure,
                  keyboardType: TextInputType.visiblePassword,
                  label: 'Contraseña',
                  placeholder: "",
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'El campo no puede estar vacío.';
                    }
                    return null;
                  },
                  icon: LucideIcons.lock,
                  sufix: SufixPassword(
                    obscure: obscure,
                    onPressed: () {
                      setState(() => obscure = !obscure);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ShadButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      if (formKey.currentState!.saveAndValidate()) {
                        print(
                            'validation succeeded with ${formKey.currentState!.value}');
                      } else {
                        print('validation failed');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
