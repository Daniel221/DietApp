import 'package:bloc/bloc.dart';
import 'package:diet_app/models/hit.dart';
import 'package:diet_app/models/recipe.dart';
import 'package:diet_app/repositories/recipes_repository.dart';
import 'package:equatable/equatable.dart';

part 'dinner_recipes_event.dart';
part 'dinner_recipes_state.dart';

class DinnerRecipesBloc extends Bloc<DinnerRecipesEvent, DinnerRecipesState> {
  final RecipesRepository _recipesRepository = RecipesRepository();

  DinnerRecipesBloc() : super(DinnerRecipesInitial()) {
    on<DinnerRecipesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SearchDinnerRecipeEvent>((event, emitState) async {
      try {
        emitState(DinnerRecipesLoadingState());
        var recipes = await _recipesRepository.getRecipes();
        emitState(DinnerContentAvailableState(
          recipesList: recipes.hits ?? [],
          totalHits: (((recipes.from ?? 0) - 1) + (recipes.to ?? 0)),
        ));
      } catch (e) {
        emitState(DinnerSearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });

    on<AllDinnerRecipesEvent>((event, emitState) async {
      try {
        emitState(DinnerRecipesLoadingState());
        var recipes = await _recipesRepository.searchRecipesDinner("Dinner");
        emitState(DinnerContentAvailableState(
          recipesList: recipes.hits ?? [],
          totalHits: (((recipes.from ?? 0) - 1) + (recipes.to ?? 0)),
        ));
      } catch (e) {
        emitState(DinnerSearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });

    on<DinnerRecipeDetailEvent>((event, emitState) async {
      try {
        emitState(DinnerRecipesLoadingState());
        var recipe = await _recipesRepository.getRecipe(event.recipeURI);
        emitState(DinnerRecipeAvailableState(recipe: recipe));
      } catch (e) {
        emitState(DinnerSearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });
  }
}
