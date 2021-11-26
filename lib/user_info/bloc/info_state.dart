part of 'info_bloc.dart';

abstract class InfoState extends Equatable {
  const InfoState();

  @override
  List<Object> get props => [];
}

class InfoInitial extends InfoState {}

class LoadingUserInfoState extends InfoState {}

class SuccessUserInfoState extends InfoState {
  final info;

  SuccessUserInfoState({required this.info});
  @override
  List<Object> get props => [info];
}

class FailedUserInfoState extends InfoState {
  final String errorMsg;

  FailedUserInfoState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
