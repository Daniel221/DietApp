part of 'recipes_bloc.dart';

abstract class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object> get props => [];
}

class SearchRecipeEvent extends RecipesEvent {
  final String queryText;
  final Map<String, String> parameters;

  SearchRecipeEvent({required this.queryText, required this.parameters});
  @override
  List<Object> get props => [queryText, parameters];
}

class AllRecipesEvent extends RecipesEvent {
  const AllRecipesEvent();

  @override
  List<Object> get props => [];
}

class RecipeDetailEvent extends RecipesEvent {
  final String recipeURI;

  RecipeDetailEvent({required this.recipeURI});
  @override
  List<Object> get props => [];
}
