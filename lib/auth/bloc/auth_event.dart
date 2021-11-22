part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// dos eventos
class VerifyAuthEvent extends AuthEvent {}

// sacar de la app. al user
class SignOutAuthEvent extends AuthEvent {}
