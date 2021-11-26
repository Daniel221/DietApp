part of 'lunch_recipes_bloc.dart';

abstract class LunchRecipesEvent extends Equatable {
  const LunchRecipesEvent();

  @override
  List<Object> get props => [];
}

class SearchRecipeEvent extends LunchRecipesEvent {
  final String queryText;

  SearchRecipeEvent({required this.queryText});
  @override
  List<Object> get props => [queryText];
}

class AllLunchRecipesEvent extends LunchRecipesEvent {
  const AllLunchRecipesEvent();

  @override
  List<Object> get props => [];
}

class RecipeDetailEvent extends LunchRecipesEvent {
  final String recipeURI;

  RecipeDetailEvent({required this.recipeURI});
  @override
  List<Object> get props => [];
}
