part of 'create_bloc.dart';

abstract class CreateState extends Equatable {
  const CreateState();

  @override
  List<Object> get props => [];
}

class CreateInitial extends CreateState {}

class CreatedUserState extends CreateState {}

class LoadingState extends CreateState {}

class ErrorUserState extends CreateState {
  final errorMsg;
  // a huevo tiene que venir un error
  ErrorUserState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
