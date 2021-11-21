import 'dart:convert';
import 'dart:io';

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

  Future<Recipes> getRecipes() async {
    // final String URL =
    //     "https://api.edamam.com/api/recipes/v2?app_id=8e34028a&app_key=5855870c7063ce2c4810878b6290b022&type=public&q=steak";

    final _url = Uri(
      scheme: "https",
      host: "api.edamam.com",
      path: "api/recipes/v2",
      queryParameters: {
        "app_id": "8e34028a",
        "app_key": "5855870c7063ce2c4810878b6290b022",
        "type": "public",
        "q": "steak",
      },
    );

    try {
      Response response = await get(_url);
      // Response response = await get(Uri.parse(_url));
      if (response.statusCode == HttpStatus.ok) {
        Recipes recipesData = Recipes.fromJson(jsonDecode(response.body));
        return recipesData;
      } else {
        return Recipes(count: 0);
      }
    } on Exception catch (e, stackTrace) {
      print("ERROR: ${e.toString()}\n ${stackTrace}");
      throw "Error en request a API";
    }
  }
}
