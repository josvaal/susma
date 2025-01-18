import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/main/auth/components/FormInput.dart';
import 'package:susma/main/auth/components/SufixPassword.dart';
import 'package:susma/main/auth/methods/auth_methods.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<ShadFormState> formKey;
  final VoidCallback togglePage;
  const LoginForm({super.key, required this.formKey, required this.togglePage});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscure = true;
  bool buttonEnabled = true;

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
              enabled: buttonEnabled,
              icon: !buttonEnabled
                  ? const CircularProgressIndicator(strokeWidth: 2)
                  : null,
              child: const Text('Iniciar Sesión'),
              onPressed: () {
                setState(() => buttonEnabled = false);
                if (widget.formKey.currentState!.saveAndValidate()) {
                  authLogin(widget.formKey.currentState!.value)
                      .then((userCredential) {
                    ShadToaster.of(context).show(
                      const ShadToast(
                        alignment: Alignment.topCenter,
                        description: Text('¡Inicio de sesión exitoso!'),
                      ),
                    );
                    widget.togglePage();
                  }).catchError((e) {
                    ShadToaster.of(context).show(
                      ShadToast.destructive(
                        alignment: Alignment.topCenter,
                        description: Text(
                          'Error al iniciar sesión: $e',
                        ),
                      ),
                    );
                  }).whenComplete(() {
                    setState(() => buttonEnabled = true);
                  });
                } else {
                  ShadToaster.of(context).show(
                    const ShadToast.destructive(
                      alignment: Alignment.topCenter,
                      description: Text('Error al validar.'),
                    ),
                  );
                  setState(() => buttonEnabled = true);
                }
              },
            ),
          ),
          ShadButton.link(
            height: 45.0,
            onPressed: widget.togglePage,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '¿Aún no tienes cuenta?\n',
                style: ShadTheme.of(context).textTheme.small,
                children: <TextSpan>[
                  TextSpan(
                    text: "Registrarme",
                    style: ShadTheme.of(context).textTheme.small.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
