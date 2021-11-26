part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoadState extends FavoritesState {}

class FavoritesLoadSuccessfulState extends FavoritesState {
  final favoritesList;
  final favoritesAmount;

  FavoritesLoadSuccessfulState(
      {required this.favoritesList, required this.favoritesAmount});
  @override
  List<Object> get props => [favoritesList, favoritesAmount];
}

class FavoritesLoadErrorState extends FavoritesState {
  final errorMsg;

  FavoritesLoadErrorState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

class FavoritesChangeSuccessState extends FavoritesState {
  final bool saved;

  FavoritesChangeSuccessState({required this.saved});
  @override
  List<Object> get props => [saved];
}
