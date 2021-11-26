part of 'lunch_recipes_bloc.dart';

abstract class LunchRecipesEvent extends Equatable {
  const LunchRecipesEvent();

  @override
  List<Object> get props => [];
}

class SearchLunchRecipeEvent extends LunchRecipesEvent {
  final String queryText;

  SearchLunchRecipeEvent({required this.queryText});
  @override
  List<Object> get props => [queryText];
}

class AllLunchRecipesEvent extends LunchRecipesEvent {
  const AllLunchRecipesEvent();

  @override
  List<Object> get props => [];
}

class LunchRecipeDetailEvent extends LunchRecipesEvent {
  final String recipeURI;

  LunchRecipeDetailEvent({required this.recipeURI});
  @override
  List<Object> get props => [];
}
