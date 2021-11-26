import 'package:diet_app/models/hit.dart';
import 'package:diet_app/models/recipe.dart';
import 'package:diet_app/models/recipes.dart';
import 'package:bloc/bloc.dart';
import 'package:diet_app/repositories/recipes_repository.dart';
import 'package:equatable/equatable.dart';

part 'breakfast_recipes_event.dart';
part 'breakfast_recipes_state.dart';

class BreakfastRecipesBloc
    extends Bloc<BreakfastRecipesEvent, BreakfastRecipesState> {
  final RecipesRepository _recipesRepository = RecipesRepository();

  BreakfastRecipesBloc() : super(BreakfastRecipesInitial()) {
    on<BreakfastRecipesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AllBreakfastRecipesEvent>((event, emitState) async {
      try {
        emitState(BreakfastRecipesLoadingState());
        var recipes =
            await _recipesRepository.searchRecipesMealType("Breakfast");
        emitState(BreakfastContentAvailableState(
          recipesList: recipes.hits ?? [],
          totalHits: (((recipes.from ?? 0) - 1) + (recipes.to ?? 0)),
        ));
      } catch (e) {
        emitState(BreakfastSearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });

    on<SearchRecipeEvent>((event, emitState) async {
      try {
        emitState(BreakfastRecipesLoadingState());
        var recipes =
            await _recipesRepository.searchRecipes(event.queryText, {});
        emitState(BreakfastContentAvailableState(
          recipesList: recipes.hits ?? [],
          totalHits: (((recipes.from ?? 0) - 1) + (recipes.to ?? 0)),
        ));
      } catch (e) {
        emitState(BreakfastSearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });

    on<RecipeDetailEvent>((event, emitState) async {
      try {
        emitState(BreakfastRecipesLoadingState());
        var recipe = await _recipesRepository.getRecipe(event.recipeURI);
        emitState(BreakfastRecipeAvailableState(recipe: recipe));
      } catch (e) {
        emitState(BreakfastSearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });
  }
}
