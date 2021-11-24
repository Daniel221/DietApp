import 'dart:js';

import 'package:diet_app/models/recipe.dart';
import 'package:diet_app/receta.dart';
import 'package:flutter/material.dart';

class CardController {
  static final testList = [
    "Ensalada Cesar",
    "Pollo rostizado con especias y panecito pa acompañar",
    "sandwich",
    "pizza hut"
  ];

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
            Placeholder(
              fallbackHeight: 160,
              fallbackWidth: 150,
            ),
            // Image.network(
            //   img,
            //   height: 160,
            //   width: 150,
            // ),
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
