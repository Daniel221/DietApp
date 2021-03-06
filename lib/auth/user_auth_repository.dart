import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// métodos disponibles para auth
class UserAuthRepository {
  // final Widget? email;
  // final Widget? password;
  // UserAuthRepository({
  //   @required this.email,
  //   @required this.password,
  // });
  // para iniciar sesión en google
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // para la auth con firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isAlreadyLogged() {
    var user = _auth.currentUser;
    // si null, significa el user no se ha autenticado nunca
    print('User: ${user?.displayName}');
    return user != null;
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFirebase() async {
    await _auth.signOut();
  }

  // para usuarios que no quieren usar google
  Future anonymousSignIn() async {
    // try {
    //   var user =
    //       _auth.signInWithEmailAndPassword(email: email, password: password);
    //   if (user != null) {
    //     return user;
    //   } else {
    //     return null;
    //   }
    // } catch (e) {
    //   return e;
    // }
    try {
      final anonymousUser = (await _auth.signInAnonymously()).user;
      print(anonymousUser);
    } catch (e) {
      return e;
    }
    // user trae nombre de usuario, foto, id...
    // await anonymousUser!.updateDisplayName(
    //   '${anonymousUser.uid.substring(0, 5)}_invitado',
    // );
    // await anonymousUser.reload();
    // return anonymousUser;
  }

  Future<void> signInWithGoogle() async {
    // sign in with google
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    print('User: ${googleUser.displayName}');
    print('User: ${googleUser.email}');

    // credenciales para firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // firebase sign in
    final authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user!;
    // sacar token de firebase
    final firebaseToken = await user.getIdToken();
    final User currentUser = _auth.currentUser!;

    print('Firebase token: ${firebaseToken}');
  }
}
