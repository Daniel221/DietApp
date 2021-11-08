import 'dart:convert';

import 'package:diet_app/models/hit.dart';
import 'package:diet_app/models/recipes.dart';
import 'package:http/http.dart';

class RecipesRepository {
  static final RecipesRepository _RecipesRepository =
      RecipesRepository._internal();
  factory RecipesRepository() {
    return _RecipesRepository;
  }
  RecipesRepository._internal();

  final String URL =
      "https://api.edamam.com/api/recipes/v2?app_id=8e34028a&app_key=5855870c7063ce2c4810878b6290b022&type=public&q=steak";

  Future<Recipes?> getRecipes() async {
    try {
      Response response = await get(Uri.parse(URL));
      if (response.statusCode == 200) {
        Recipes recipesData = Recipes.fromJson(jsonDecode(response.body));
        return recipesData;
      } else {
        return null;
      }
    } on Exception catch (e, stackTrace) {
      print("ERROR: ${e.toString()}\n ${stackTrace}");
      return null;
    }
  }
}
