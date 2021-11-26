part of 'breakfast_recipes_bloc.dart';

abstract class BreakfastRecipesState extends Equatable {
  const BreakfastRecipesState();

  @override
  List<Object> get props => [];
}

class BreakfastRecipesInitial extends BreakfastRecipesState {}

class BreakfastRecipesLoadingState extends BreakfastRecipesState {}

class BreakfastSearchErrorState extends BreakfastRecipesState {
  final String errorMsg;

  BreakfastSearchErrorState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

class BreakfastContentAvailableState extends BreakfastRecipesState {
  final List<Hit> recipesList;
  final int totalHits;

  BreakfastContentAvailableState({
    required this.recipesList,
    required this.totalHits,
  });

  @override
  List<Object> get props => [recipesList, totalHits];
}

class SearchBreakfastRecipesState extends BreakfastRecipesState {
  final String searchTerm;

  SearchBreakfastRecipesState({
    required this.searchTerm,
  });
  @override
  List<Object> get props => [searchTerm];
}

class BreakfastRecipeDetailState extends BreakfastRecipesState {
  final String searchTerm;

  BreakfastRecipeDetailState({
    required this.searchTerm,
  });
  @override
  List<Object> get props => [searchTerm];
}

class BreakfastRecipeAvailableState extends BreakfastRecipesState {
  final Recipe recipe;

  BreakfastRecipeAvailableState({
    required this.recipe,
  });
  @override
  List<Object> get props => [recipe];
}
