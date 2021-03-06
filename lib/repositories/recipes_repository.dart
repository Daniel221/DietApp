import 'dart:convert';
import 'dart:io';

import 'package:diet_app/models/hit.dart';
import 'package:diet_app/models/recipe.dart';
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
        "q": "orange",
      },
    );

    try {
      Response response = await get(_url);
      // Response response = await get(Uri.parse(URL));
      if (response.statusCode == HttpStatus.ok) {
        Recipes recipesData = Recipes.fromJson(jsonDecode(response.body));
        return recipesData;
      } else {
        return Recipes(count: 0);
      }
    } on Exception catch (e, stackTrace) {
      print("ERROR: ${e.toString()}\n ${stackTrace}");
      throw "Error in API request";
    }
  }

  Future<Recipes> searchRecipes(
      String searchTerm, Map<String, String> parameters) async {
    // final String URL =
    //     "https://api.edamam.com/api/recipes/v2?app_id=8e34028a&app_key=5855870c7063ce2c4810878b6290b022&type=public&q=steak";
    Map<String, dynamic> query_parameters = {
      "app_id": "8e34028a",
      "app_key": "5855870c7063ce2c4810878b6290b022",
      "type": "public",
      "q": searchTerm,
    };

    parameters.forEach((key, value) {
      if (value != "All" && value != "None") {
        query_parameters[key] = value;
      }
    });

    final _url = Uri(
      scheme: "https",
      host: "api.edamam.com",
      path: "api/recipes/v2",
      queryParameters: query_parameters,
    );
    try {
      Response response = await get(_url);
      // Response response = await get(Uri.parse(URL));
      if (response.statusCode == HttpStatus.ok) {
        Recipes recipesData = Recipes.fromJson(jsonDecode(response.body));
        return recipesData;
      } else {
        return Recipes(count: 0);
      }
    } on Exception catch (e, stackTrace) {
      print("ERROR: ${e.toString()}\n ${stackTrace}");
      throw "Error in API request";
    }
  }

  Future<Recipes> searchRecipesMealType(String mealType) async {
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
        "q": "pumpkin",
        "mealType": mealType,
      },
    );
    try {
      Response response = await get(_url);
      // Response response = await get(Uri.parse(URL));
      if (response.statusCode == HttpStatus.ok) {
        Recipes recipesData = Recipes.fromJson(jsonDecode(response.body));
        return recipesData;
      } else {
        return Recipes(count: 0);
      }
    } on Exception catch (e, stackTrace) {
      print("ERROR: ${e.toString()}\n ${stackTrace}");
      throw "Error in API request";
    }
  }

  Future<Recipes> searchRecipesDinner(String mealType) async {
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
        "q": "Ham",
        "mealType": mealType,
      },
    );
    try {
      Response response = await get(_url);
      // Response response = await get(Uri.parse(URL));
      if (response.statusCode == HttpStatus.ok) {
        Recipes recipesData = Recipes.fromJson(jsonDecode(response.body));
        return recipesData;
      } else {
        return Recipes(count: 0);
      }
    } on Exception catch (e, stackTrace) {
      print("ERROR: ${e.toString()}\n ${stackTrace}");
      throw "Error in API request";
    }
  }

  Future<Recipe> getRecipe(String recipeURI) async {
    // final String URL =
    //     "https://api.edamam.com/api/recipes/v2?app_id=8e34028a&app_key=5855870c7063ce2c4810878b6290b022&type=public&q=steak";

    final int idx = recipeURI.indexOf('recipe_');
    String recipeId = '';

    if (idx > 0) {
      recipeId = recipeURI.substring(idx);
    } else {
      throw "Recipe URI is not valid";
    }

    final _url = Uri(
      scheme: "https",
      host: "api.edamam.com",
      path: "api/recipes/v2/" + recipeId,
      queryParameters: {
        "app_id": "8e34028a",
        "app_key": "5855870c7063ce2c4810878b6290b022",
        "type": "public",
        "id": recipeId,
      },
    );

    try {
      Response response = await get(_url);
      // Response response = await get(Uri.parse(URL));
      if (response.statusCode == HttpStatus.ok) {
        Recipe recipesData = Recipe.fromJson(jsonDecode(response.body));
        return recipesData;
      } else {
        throw "Error in API request";
      }
    } on Exception catch (e, stackTrace) {
      print("ERROR: ${e.toString()}\n ${stackTrace}");
      throw "Error in API request";
    }
  }
}
