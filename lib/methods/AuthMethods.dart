import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> authRegister(Map<Object, dynamic> data) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: data["email"],
      password: data["password"],
    );
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      throw Exception('La contraseña es demasiado débil.');
    } else if (e.code == 'email-already-in-use') {
      throw Exception('La cuenta ya existe con ese correo electrónico.');
    }
  } catch (e) {
    throw Exception('Error desconocido: $e');
  }
  throw Exception('Registro fallido por razones desconocidas.');
}

Future<UserCredential> authLogin(Map<Object, dynamic> data) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: data["email"],
      password: data["password"],
    );
    return credential;
  } on FirebaseAuthException catch (e) {
    print(e.code);
    if (e.code == 'user-not-found') {
      throw Exception('Usuario no registrado.');
    } else if (e.code == 'wrong-password') {
      throw Exception('Contraseña incorrecta.');
    } else if (e.code == 'invalid-credential') {
      throw Exception('Credenciales inválidas.');
    }
  } catch (e) {
    throw Exception('Error desconocido: $e');
  }
  throw Exception('Registro fallido por razones desconocidas.');
}
