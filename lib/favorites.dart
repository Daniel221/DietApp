import 'package:diet_app/card_controller.dart';
import 'package:diet_app/db_connection.dart';
import 'package:diet_app/favorites/bloc/favorites_bloc.dart';
import 'package:diet_app/models/recipe.dart';
import 'package:diet_app/receta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorites extends StatefulWidget {
  Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  Recipe _convertToRecipe(Map<String, dynamic> recipe) {
    return Recipe(
      label: recipe["label"],
      image: recipe["image"],
      dishType: recipe["dishType"],
      cuisineType: recipe["cuisineType"],
      mealType: recipe["mealType"],
      ingredientLines: recipe["ingredientLines"],
      healthLabels: recipe["healthLabels"],
      calories: recipe["calories"],
    );
  }

  Widget _card(Recipe recipe) {
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(recipe.image ??
                              "https://pbs.twimg.com/profile_images/1014984404769394688/px4PTUZm_400x400.jpg"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FutureBuilder(
                        future: getFavorite(recipe.label),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return IconButton(
                            onPressed: () {
                              removeFavorite(recipe.label);
                              BlocProvider.of<FavoritesBloc>(context)
                                  .add(GetAllFavoritesEvent());
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red[300],
                              size: 33,
                            ),
                          );
                        },
                      ),
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

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FavoritesBloc>(context).add(GetAllFavoritesEvent());
    return Container(
      margin: EdgeInsets.fromLTRB(10, 25, 0, 0),
      child: ListView(
        children: [
          Center(
            child: Text(
              "Favoritos",
              style: TextStyle(fontSize: 28),
            ),
          ),
          Divider(),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 260),
            child: BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, state) {
              if (state is FavoritesLoadState) {
                return Column(children: [
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  ),
                ]);
              } else if (state is FavoritesLoadErrorState) {
                return _error(state.errorMsg);
              } else if (state is FavoritesLoadSuccessfulState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: state.favoritesAmount,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      height: 240,
                      width: 260,
                      child:
                          _card(_convertToRecipe(state.favoritesList[index])),
                    );
                  },
                );
              }
              return Expanded(child: CircularProgressIndicator());
            }),
          ),
        ],
      ),
    );
  }
}

Widget _error(String msg) {
  return Center(child: Text("$msg"));
}
