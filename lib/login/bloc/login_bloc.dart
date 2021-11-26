import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:diet_app/auth/user_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserAuthRepository _userRep = UserAuthRepository();
  LoginBloc() : super(LoginInitial()) {
    on<LoginWithGoogleEvent>(_googleLogin);
  }

  Future _googleLogin(
    LoginEvent event,
    Emitter emitState,
  ) async {
    try {
      await _userRep.signInWithGoogle();
      var info = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid
              .toString()) // id del usuario autenticado
          .get()
        ..data();
      if (info.exists) {
        emitState(LoginSuccessState());
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid
                .toString()) // id del usuario autenticado
            .set({
          "name": "",
          "estatura": "",
          "peso": "",
          "porcentaje": "",
          "img": ""
          // "password": user["password"],
        });
        emitState(LoginSuccessState());
      }
    } catch (e) {
      emitState(
          // le mandamos los parámetros marcados como required en state
          LoginErrorState(
              error: 'Error al hacer login con google', code: e.toString()));
    }
  }
}
