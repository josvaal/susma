import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/components/auth/FormInput.dart';
import 'package:susma/components/auth/SufixPassword.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<ShadFormState> formKey;
  final VoidCallback togglePage;
  const RegisterForm(
      {super.key, required this.formKey, required this.togglePage});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 20),
      child: ShadForm(
        key: widget.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registrarme',
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
                final pwdRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{5,}$');
                if (v.isEmpty) {
                  return 'El campo no puede estar vacío.';
                }

                if (!pwdRegex.hasMatch(v)) {
                  return 'Debe tener al menos 1 letra, 1 número y 5 caracteres.';
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
            FormInput(
              id: "repeat_password",
              obscureText: obscure,
              keyboardType: TextInputType.visiblePassword,
              label: 'Repetir Contraseña',
              placeholder: "",
              validator: (v) {
                if (v != widget.formKey.currentState!.value["password"]) {
                  return "Las contraseñas deben coincidir";
                }
                if (v.isEmpty) {
                  return 'El campo no puede estar vacío.';
                }
                return null;
              },
              icon: LucideIcons.lock,
            ),
            const SizedBox(height: 16),
            FormInput(
              id: "name",
              obscureText: false,
              keyboardType: TextInputType.text,
              label: 'Nombres',
              placeholder: "Juan",
              validator: (v) {
                if (v.isEmpty) {
                  return 'El campo no puede estar vacío.';
                }
                if (v.length < 2) {
                  return 'El nombre tiene que ser mas largo que 2 carácteres';
                }
                return null; // Válido
              },
              icon: LucideIcons.caseSensitive,
            ),
            const SizedBox(height: 16),
            FormInput(
              id: "lastname",
              obscureText: false,
              keyboardType: TextInputType.text,
              label: 'Apellidos',
              placeholder: "Pérez",
              validator: (v) {
                if (v.isEmpty) {
                  return 'El campo no puede estar vacío.';
                }
                if (v.length < 2) {
                  return 'El nombre tiene que ser mas largo que 2 carácteres';
                }
                return null; // Válido
              },
              icon: LucideIcons.caseSensitive,
            ),
            const SizedBox(height: 16),
            FormInput(
              id: "username",
              obscureText: false,
              keyboardType: TextInputType.text,
              label: 'Nombre de usuario',
              placeholder: "Usuario123",
              validator: (v) {
                if (v.isEmpty) {
                  return 'El campo no puede estar vacío.';
                }
                if (v.length < 5) {
                  return 'El nombre tiene que ser mas largo que 5 carácteres';
                }
                return null; // Válido
              },
              icon: LucideIcons.user,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ShadButton(
                child: const Text('Registrar Cuenta'),
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
              child: const Text('¿Ya tienes una cuenta? Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
