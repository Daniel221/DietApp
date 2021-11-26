part of 'dinner_recipes_bloc.dart';

abstract class DinnerRecipesEvent extends Equatable {
  const DinnerRecipesEvent();

  @override
  List<Object> get props => [];
}

class SearchRecipeEvent extends DinnerRecipesEvent {
  final String queryText;

  SearchRecipeEvent({required this.queryText});
  @override
  List<Object> get props => [queryText];
}

class AllDinnerRecipesEvent extends DinnerRecipesEvent {
  const AllDinnerRecipesEvent();

  @override
  List<Object> get props => [];
}

class RecipeDetailEvent extends DinnerRecipesEvent {
  final String recipeURI;

  RecipeDetailEvent({required this.recipeURI});
  @override
  List<Object> get props => [];
}
