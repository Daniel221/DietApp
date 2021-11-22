part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String error;
  final String code;

  LoginErrorState({
    required this.error,
    required this.code,
  });

  // info que se le pasa al consumer
  @override
  List<Object> get props => [error, code];
}
