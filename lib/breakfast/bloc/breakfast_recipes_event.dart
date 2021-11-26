part of 'breakfast_recipes_bloc.dart';

abstract class BreakfastRecipesEvent extends Equatable {
  const BreakfastRecipesEvent();

  @override
  List<Object> get props => [];
}

class SearchRecipeEvent extends BreakfastRecipesEvent {
  final String queryText;

  SearchRecipeEvent({required this.queryText});
  @override
  List<Object> get props => [queryText];
}

class AllBreakfastRecipesEvent extends BreakfastRecipesEvent {
  const AllBreakfastRecipesEvent();

  @override
  List<Object> get props => [];
}

class RecipeDetailEvent extends BreakfastRecipesEvent {
  final String recipeURI;

  RecipeDetailEvent({required this.recipeURI});
  @override
  List<Object> get props => [];
}
