import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/components/auth/FormInput.dart';
import 'package:susma/components/auth/SufixPassword.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<ShadFormState> formKey;
  final VoidCallback togglePage;
  const LoginForm({super.key, required this.formKey, required this.togglePage});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ShadForm(
      key: widget.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Iniciar Sesión',
            style: ShadTheme.of(context).textTheme.h1,
          ),
          const SizedBox(height: 30),
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
              child: const Text('Iniciar Sesión'),
              onPressed: () {
                if (widget.formKey.currentState!.saveAndValidate()) {
                  print(
                      'validation succeeded with ${widget.formKey.currentState!.value}');
                } else {
                  print('validation failed');
                }
              },
            ),
          ),
          ShadButton.link(
            onPressed: widget.togglePage,
            child: const Text('¿Aún no tienes cuenta? Regístrate'),
          ),
        ],
      ),
    );
  }
}
