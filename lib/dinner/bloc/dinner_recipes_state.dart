part of 'dinner_recipes_bloc.dart';

abstract class DinnerRecipesState extends Equatable {
  const DinnerRecipesState();

  @override
  List<Object> get props => [];
}

class DinnerRecipesInitial extends DinnerRecipesState {}

class DinnerRecipesLoadingState extends DinnerRecipesState {}

class DinnerSearchErrorState extends DinnerRecipesState {
  final String errorMsg;

  DinnerSearchErrorState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

class DinnerContentAvailableState extends DinnerRecipesState {
  final List<Hit> recipesList;
  final int totalHits;

  DinnerContentAvailableState({
    required this.recipesList,
    required this.totalHits,
  });

  @override
  List<Object> get props => [recipesList, totalHits];
}

class SearchDinnerRecipesState extends DinnerRecipesState {
  final String searchTerm;

  SearchDinnerRecipesState({
    required this.searchTerm,
  });
  @override
  List<Object> get props => [searchTerm];
}

class DinnerRecipeDetailState extends DinnerRecipesState {
  final String searchTerm;

  DinnerRecipeDetailState({
    required this.searchTerm,
  });
  @override
  List<Object> get props => [searchTerm];
}

class DinnerRecipeAvailableState extends DinnerRecipesState {
  final Recipe recipe;

  DinnerRecipeAvailableState({
    required this.recipe,
  });
  @override
  List<Object> get props => [recipe];
}
