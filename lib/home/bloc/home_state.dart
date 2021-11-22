part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

// estado en el que hay info
// recibimos nombre de uuser, y foto
class ExistingDataState extends HomeState {
  final List<Map<String, dynamic>> usersList;

  ExistingDataState({required this.usersList});
  @override
  List<Object> get props => [usersList];
}

// pendientes, puede que no sea necesario, porque a huevo tiene info
class NoDataState extends HomeState {}

class LoadingState extends HomeState {}
