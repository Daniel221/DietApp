import 'dart:convert';

import 'package:diet_app/models/recipes.dart';
import 'package:http/http.dart';

class RecipeRepository {
  static final RecipeRepository _RecipeRepository =
      RecipeRepository._internal();
  factory RecipeRepository() {
    return _RecipeRepository;
  }
  RecipeRepository._internal();

  final String URL =
      "https://api.edamam.com/api/recipes/v2?app_id=8e34028a&app_key=5855870c7063ce2c4810878b6290b022&type=public&health=alcohol-cocktail&diet=balanced&q=steak";

  Future<Recipes?> getRecipes() async {
    try {
      Response response = await get(Uri.parse(URL));
      if (response.statusCode == 200) {
        Recipes recipes = Recipes.fromJson(jsonDecode(response.body));
        return recipes;
      } else {
        return null;
      }
    } on Exception catch (e, stackTrace) {
      print("ERROR: ${e.toString()}\n ${stackTrace}");
      return null;
    }
  }
}
