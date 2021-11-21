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
