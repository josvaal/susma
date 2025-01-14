import 'package:firebase_auth/firebase_auth.dart';
import 'package:susma/database/firebase_instances.dart';
import 'package:susma/main/auth/models/account_metadata.dart';
import 'package:susma/database/firestore_refs.dart';

Future<UserCredential> authRegister(Map<Object, dynamic> data) async {
  try {
    final docRef = await accountMetadataRef.add(
      AccountMetadata(
        uid: '',
        name: data["name"],
        lastname: data["lastname"],
        username: data["username"],
        avatarUrl:
            "https://res.cloudinary.com/dahazkbrf/image/upload/v1736745266/susma/pfps/default.jpg",
      ),
    );

    final credential = await auth.createUserWithEmailAndPassword(
      email: data["email"],
      password: data["password"],
    );

    await docRef.update({
      'uid': credential.user!.uid,
    });

    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      throw Exception('La contraseña es demasiado débil.');
    } else if (e.code == 'email-already-in-use') {
      throw Exception('La cuenta ya existe con ese correo electrónico.');
    }
  } catch (e) {
    print('Error desconocido: $e');
    throw Exception('Error desconocido: $e');
  }
  throw Exception('Registro fallido por razones desconocidas.');
}

Future<UserCredential> authLogin(Map<Object, dynamic> data) async {
  try {
    final credential = await auth.signInWithEmailAndPassword(
      email: data["email"],
      password: data["password"],
    );

    return credential;
  } on FirebaseAuthException catch (e) {
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

Future<void> accountSignOut() async {
  await auth.signOut();
}
