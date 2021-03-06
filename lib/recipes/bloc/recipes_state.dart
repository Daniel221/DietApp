part of 'recipes_bloc.dart';

abstract class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object> get props => [];
}

class RecipesInitial extends RecipesState {}

class RecipesLoadingState extends RecipesState {}

class SearchErrorState extends RecipesState {
  final String errorMsg;

  SearchErrorState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

class ContentAvailableState extends RecipesState {
  final List<Hit> recipesList;
  final int totalHits;

  ContentAvailableState({
    required this.recipesList,
    required this.totalHits,
  });

  @override
  List<Object> get props => [recipesList, totalHits];
}

class SearchRecipesState extends RecipesState {
  final String searchTerm;

  SearchRecipesState({
    required this.searchTerm,
  });
  @override
  List<Object> get props => [searchTerm];
}

class RecipeDetailState extends RecipesState {
  final String searchTerm;

  RecipeDetailState({
    required this.searchTerm,
  });
  @override
  List<Object> get props => [searchTerm];
}

class RecipeAvailableState extends RecipesState {
  final Recipe recipe;

  RecipeAvailableState({
    required this.recipe,
  });
  @override
  List<Object> get props => [recipe];
}
