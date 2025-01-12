String? emailValidator(String v) {
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  if (v.isEmpty) {
    return 'El campo no puede estar vacío.';
  } else if (!emailRegex.hasMatch(v)) {
    return 'Ingrese un correo electrónico válido.';
  }
  return null;
}

String? passwordValidator(String v) {
  final pwdRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{5,}$');
  if (v.isEmpty) {
    return 'El campo no puede estar vacío.';
  }

  if (!pwdRegex.hasMatch(v)) {
    return 'Debe tener al menos 1 letra, 1 número y 5 caracteres.';
  }
  return null;
}

String? repeatPasswordValidator(String v, String pwd) {
  if (v != pwd) {
    return "Las contraseñas deben coincidir";
  }
  if (v.isEmpty) {
    return 'El campo no puede estar vacío.';
  }
  return null;
}

String? nameValidator(String v) {
  if (v.isEmpty) {
    return 'El campo no puede estar vacío.';
  }
  if (v.length < 2) {
    return 'El nombre tiene que ser mas largo que 2 carácteres';
  }
  return null;
}

String? lastnameValidator(String v) {
  if (v.isEmpty) {
    return 'El campo no puede estar vacío.';
  }
  if (v.length < 2) {
    return 'El apellido tiene que ser mas largo que 2 carácteres';
  }
  return null;
}

String? usernameValidator(String v) {
  if (v.isEmpty) {
    return 'El campo no puede estar vacío.';
  }
  if (v.length < 5) {
    return 'El nombre de usuario tiene que ser mas largo que 5 carácteres';
  }
  return null;
}
