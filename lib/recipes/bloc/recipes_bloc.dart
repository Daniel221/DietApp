import 'package:bloc/bloc.dart';
import 'package:diet_app/models/hit.dart';
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
          totalHits: (((recipes.from ?? 0) - 1) + (recipes.to ?? 0)) ?? 0,
        ));
      } catch (e) {
        emitState(SearchErrorState(
          errorMsg: e.toString(),
        ));
      }
    });
  }
}
