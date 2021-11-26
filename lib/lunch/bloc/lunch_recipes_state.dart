part of 'lunch_recipes_bloc.dart';

abstract class LunchRecipesState extends Equatable {
  const LunchRecipesState();

  @override
  List<Object> get props => [];
}

class LunchRecipesInitial extends LunchRecipesState {}

class LunchRecipesLoadingState extends LunchRecipesState {}

class LunchSearchErrorState extends LunchRecipesState {
  final String errorMsg;

  LunchSearchErrorState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

class LunchContentAvailableState extends LunchRecipesState {
  final List<Hit> recipesList;
  final int totalHits;

  LunchContentAvailableState({
    required this.recipesList,
    required this.totalHits,
  });

  @override
  List<Object> get props => [recipesList, totalHits];
}

class LunchSearchRecipesState extends LunchRecipesState {
  final String searchTerm;

  LunchSearchRecipesState({
    required this.searchTerm,
  });
  @override
  List<Object> get props => [searchTerm];
}

class LunchRecipeDetailState extends LunchRecipesState {
  final String searchTerm;

  LunchRecipeDetailState({
    required this.searchTerm,
  });
  @override
  List<Object> get props => [searchTerm];
}

class LunchRecipeAvailableState extends LunchRecipesState {
  final Recipe recipe;

  LunchRecipeAvailableState({
    required this.recipe,
  });
  @override
  List<Object> get props => [recipe];
}
