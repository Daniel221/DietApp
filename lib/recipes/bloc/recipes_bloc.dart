import 'package:bloc/bloc.dart';
import 'package:diet_app/models/hit.dart';
import 'package:diet_app/models/recipe.dart';
import 'package:diet_app/models/recipes.dart';
import 'package:diet_app/repositories/recipes_repository.dart';
import 'package:equatable/equatable.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final RecipesRepository _recipesRepository = RecipesRepository();

  RecipesBloc() : super(RecipesInitial()) {
    on<RecipesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AllRecipesEvent>((event, emitState) async {
      try {
        emitState(RecipesLoadingState());
        var recipes = await _recipesRepository.getRecipes();
        emitState(ContentAvailableState(
          recipesList: recipes.hits ?? [],
          totalHits: (((recipes.from ?? 0) - 1) + (recipes.to ?? 0)),
        ));
      } catch (e) {
        emitState(SearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });

    on<SearchRecipeEvent>((event, emitState) async {
      try {
        emitState(RecipesLoadingState());
        var recipes = await _recipesRepository.searchRecipes(
            event.queryText, event.parameters);
        emitState(ContentAvailableState(
          recipesList: recipes.hits ?? [],
          totalHits: (((recipes.from ?? 0) - 1) + (recipes.to ?? 0)),
        ));
      } catch (e) {
        emitState(SearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });

    on<RecipeDetailEvent>((event, emitState) async {
      try {
        emitState(RecipesLoadingState());
        var recipe = await _recipesRepository.getRecipe(event.recipeURI);
        emitState(RecipeAvailableState(recipe: recipe));
      } catch (e) {
        emitState(SearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });
  }
}
