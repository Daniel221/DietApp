import 'package:diet_app/favorite_btn.dart';
import 'package:diet_app/favorites/bloc/favorites_bloc.dart';
import 'package:diet_app/models/recipe.dart';
import 'package:diet_app/receta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardController {
  static final testList = [
    "Ensalada Cesar",
    "Pollo rostizado con especias y panecito pa acompañar",
    "sandwich",
    "pizza hut"
  ];

  static bool _isFavorite(Recipe recipe, List<Map<String, dynamic>> favorites) {
    return favorites.contains({"label": recipe.label});
  }

  static createCard(BuildContext context, Recipe recipe) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: new InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Receta(recipeDetails: recipe)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.network(
                    recipe.image ??
                        "https://pbs.twimg.com/profile_images/1014984404769394688/px4PTUZm_400x400.jpg",
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    height: 160,
                    width: 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FavoriteBtn(recipe: recipe),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 68,
              child: Text(
                "${recipe.label}",
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
