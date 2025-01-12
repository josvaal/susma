import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:susma/components/auth/FormInput.dart';
import 'package:susma/components/auth/SufixPassword.dart';
import 'package:susma/methods/AuthMethods.dart';
import 'package:susma/methods/AuthValidators.dart';

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
  bool buttonEnabled = true;

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
              validator: emailValidator,
              icon: LucideIcons.mail,
            ),
            const SizedBox(height: 16),
            FormInput(
              id: "password",
              obscureText: obscure,
              keyboardType: TextInputType.visiblePassword,
              label: 'Contraseña',
              placeholder: "",
              validator: passwordValidator,
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
              validator: (v) => repeatPasswordValidator(
                v,
                widget.formKey.currentState?.value["password"] ?? "",
              ),
              icon: LucideIcons.lock,
            ),
            const SizedBox(height: 16),
            FormInput(
              id: "name",
              obscureText: false,
              keyboardType: TextInputType.name,
              label: 'Nombres',
              placeholder: "Juan",
              validator: nameValidator,
              icon: LucideIcons.caseSensitive,
            ),
            const SizedBox(height: 16),
            FormInput(
              id: "lastname",
              obscureText: false,
              keyboardType: TextInputType.name,
              label: 'Apellidos',
              placeholder: "Pérez",
              validator: lastnameValidator,
              icon: LucideIcons.caseSensitive,
            ),
            const SizedBox(height: 16),
            FormInput(
              id: "username",
              obscureText: false,
              keyboardType: TextInputType.text,
              label: 'Nombre de usuario',
              placeholder: "Usuario123",
              validator: usernameValidator,
              icon: LucideIcons.user,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ShadButton(
                enabled: buttonEnabled,
                icon: !buttonEnabled
                    ? const CircularProgressIndicator(strokeWidth: 2)
                    : null,
                onPressed: () {
                  setState(() => buttonEnabled = false);
                  if (widget.formKey.currentState!.saveAndValidate()) {
                    authRegister(widget.formKey.currentState!.value)
                        .then((userCredential) {
                      ShadToaster.of(context).show(
                        const ShadToast(
                          description: Text('¡Usuario registrado con éxito!'),
                        ),
                      );
                      widget.togglePage();
                    }).catchError((e) {
                      ShadToaster.of(context).show(
                        ShadToast.destructive(
                          alignment: Alignment.topCenter,
                          description: Text(
                            'Error al registrar el usuario: $e',
                          ),
                        ),
                      );
                    }).whenComplete(() {
                      setState(() => buttonEnabled = true);
                    });
                    ;
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
                child: const Text('Registrar Cuenta'),
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
