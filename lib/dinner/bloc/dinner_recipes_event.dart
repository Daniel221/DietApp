part of 'dinner_recipes_bloc.dart';

abstract class DinnerRecipesEvent extends Equatable {
  const DinnerRecipesEvent();

  @override
  List<Object> get props => [];
}

class SearchDinnerRecipeEvent extends DinnerRecipesEvent {
  final String queryText;

  SearchDinnerRecipeEvent({required this.queryText});
  @override
  List<Object> get props => [queryText];
}

class AllDinnerRecipesEvent extends DinnerRecipesEvent {
  const AllDinnerRecipesEvent();

  @override
  List<Object> get props => [];
}

class DinnerRecipeDetailEvent extends DinnerRecipesEvent {
  final String recipeURI;

  DinnerRecipeDetailEvent({required this.recipeURI});
  @override
  List<Object> get props => [];
}
