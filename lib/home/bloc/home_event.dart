part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

// evento para agarrar la info de cada user
class RequestDataEvent extends HomeEvent {}
