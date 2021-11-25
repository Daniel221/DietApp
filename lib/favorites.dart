import 'package:diet_app/card_controller.dart';
import 'package:diet_app/favorites/bloc/favorites_bloc.dart';
import 'package:diet_app/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorites extends StatefulWidget {
  Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  void initState() {
    BlocProvider.of<FavoritesBloc>(context).add(GetAllFavoritesEvent());
    super.initState();
  }

  Recipe _convertToRecipe(Map<String, dynamic> recipe) {
    return Recipe(label: recipe["label"]);
  }

  @override
  Widget build(BuildContext context) {
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
                    print(index);
                    print(state.favoritesList.runtimeType);
                    return Container(
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      height: 240,
                      width: 260,
                      child: CardController.createCard(
                        context,
                        _convertToRecipe(state.favoritesList[index]),
                      ),
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            }),
          ),
          // ConstrainedBox(
          //   constraints: BoxConstraints(maxWidth: 400),
          //   child: GridView.builder(
          //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //           maxCrossAxisExtent: 200,
          //           childAspectRatio: 3 / 2,
          //           crossAxisSpacing: 20,
          //           mainAxisSpacing: 20),
          //       itemCount: CardController.testList.length,
          //       itemBuilder: (context, index) {
          //         return CardController.createCard(
          //             CardController.testList[index], "");
          //       }),
          // ),
        ],
      ),
    );
  }
}

Widget _error(String msg) {
  return Center(child: Text("$msg"));
}
