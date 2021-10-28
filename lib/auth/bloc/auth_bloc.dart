import 'package:bloc/bloc.dart';
import 'package:diet_app/auth/user_auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // instancia al repo de auth
  UserAuthRepository _authRepo = UserAuthRepository();

  AuthBloc() : super(AuthInitial()) {
    // cuando llegue este evento, hacemos esta función
    on<VerifyAuthEvent>(_authVerification);
    on<SignOutAuthEvent>(_signOut);
  }

  void _authVerification(
    AuthEvent event, // recibe un evento
    Emitter emitState, // el estado a emitir
  ) {
    // HTTP rqs.
    // acceso a BD
    // revisar si hay acceso a internet
    if (_authRepo.isAlreadyLogged()) {
      // si ya está auth, se emit el already state
      emitState(AlreadyAuthState());
    } else {
      // si no, se emite el unauth (aún no está auth)
      emitState(UnAuthState());
    }
  }

  Future<void> _signOut(
    AuthEvent event,
    Emitter emitState,
  ) async {
    // si se loggeó anónimamente
    if (FirebaseAuth.instance.currentUser!.isAnonymous) {
      await _authRepo.signOutFirebase();
    } else {
      // log out firebase
      await _authRepo.signOutFirebase();
      // log out google
      await _authRepo.signOutGoogle();
    }
    emitState(UnAuthState());
  }
}
