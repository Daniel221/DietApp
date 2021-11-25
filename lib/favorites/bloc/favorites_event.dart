part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class AddFavoritesEvent extends FavoritesEvent {
  final food;

  AddFavoritesEvent({required this.food});

  @override
  List<Object> get props => [food];
}

class RemoveFavoriteEvent extends FavoritesEvent {
  final food;

  RemoveFavoriteEvent({required this.food});

  @override
  List<Object> get props => [food];
}

class GetAllFavoritesEvent extends FavoritesEvent {}
