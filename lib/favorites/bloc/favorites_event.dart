part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class AddFavoritesEvent extends FavoritesEvent {
  final Recipe recipe;

  AddFavoritesEvent({required this.recipe});

  @override
  List<Object> get props => [recipe];
}

class RemoveFavoriteEvent extends FavoritesEvent {
  final String? label;

  RemoveFavoriteEvent({required this.label});

  @override
  List<Object> get props => [label.toString()];
}

class GetAllFavoritesEvent extends FavoritesEvent {}
