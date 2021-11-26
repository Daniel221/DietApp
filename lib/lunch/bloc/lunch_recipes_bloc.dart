import 'package:bloc/bloc.dart';
import 'package:diet_app/models/hit.dart';
import 'package:diet_app/models/recipe.dart';
import 'package:diet_app/repositories/recipes_repository.dart';
import 'package:equatable/equatable.dart';

part 'lunch_recipes_event.dart';
part 'lunch_recipes_state.dart';

class LunchRecipesBloc extends Bloc<LunchRecipesEvent, LunchRecipesState> {
  final RecipesRepository _recipesRepository = RecipesRepository();

  LunchRecipesBloc() : super(LunchRecipesInitial()) {
    on<LunchRecipesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AllLunchRecipesEvent>((event, emitState) async {
      try {
        emitState(LunchRecipesLoadingState());
        var recipes = await _recipesRepository.searchRecipesMealType("Lunch");
        emitState(LunchContentAvailableState(
          recipesList: recipes.hits ?? [],
          totalHits: (((recipes.from ?? 0) - 1) + (recipes.to ?? 0)),
        ));
      } catch (e) {
        emitState(LunchSearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });

    on<SearchRecipeEvent>((event, emitState) async {
      try {
        emitState(LunchRecipesLoadingState());
        var recipes = await _recipesRepository.searchRecipes(event.queryText);
        emitState(LunchContentAvailableState(
          recipesList: recipes.hits ?? [],
          totalHits: (((recipes.from ?? 0) - 1) + (recipes.to ?? 0)),
        ));
      } catch (e) {
        emitState(LunchSearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });

    on<RecipeDetailEvent>((event, emitState) async {
      try {
        emitState(LunchRecipesLoadingState());
        var recipe = await _recipesRepository.getRecipe(event.recipeURI);
        emitState(LunchRecipeAvailableState(recipe: recipe));
      } catch (e) {
        emitState(LunchSearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });
  }
}
