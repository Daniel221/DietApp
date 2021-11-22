part of 'recipes_bloc.dart';

abstract class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object> get props => [];
}

class SearchRecipeEvent extends RecipesEvent {
  final String queryText;

  SearchRecipeEvent({required this.queryText});
  @override
  List<Object> get props => [queryText];
}

class AllRecipesEvent extends RecipesEvent {
  const AllRecipesEvent();

  @override
  List<Object> get props => [];
}
