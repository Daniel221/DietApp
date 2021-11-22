part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// estados a mostrar dependiendo de eventos
class AuthInitial extends AuthState {}

class AlreadyAuthState extends AuthState {}

class UnAuthState extends AuthState {}
