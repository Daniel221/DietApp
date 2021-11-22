import 'package:diet_app/models/recipes.dart';
import 'package:diet_app/repositories/recipes_repository.dart';
import 'package:flutter/foundation.dart';

class RecipesProvider with ChangeNotifier {
  Recipes? _recipesData;
  Recipes? get getRecipes => _recipesData;

  Future getAllRecipes() async {
    _recipesData = await RecipesRepository().getRecipes();
    notifyListeners();
  }
}
