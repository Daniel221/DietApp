import 'package:diet_app/recipes/bloc/recipes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'card_controller.dart';

class Favorites extends StatefulWidget {
  Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  void initState() {
    BlocProvider.of<RecipesBloc>(context).add(
      SearchRecipeEvent(
        queryText: "lemon",
      ),
    );
    super.initState();
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
            child: BlocBuilder<RecipesBloc, RecipesState>(
                builder: (context, state) {
              if (state is RecipesLoadingState) {
                return Column(children: [
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  ),
                ]);
              } else if (state is SearchErrorState) {
                return _error(state.errorMsg);
              } else if (state is ContentAvailableState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: state.totalHits,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      height: 240,
                      width: 260,
                      child: CardController.createCard(
                        context,
                        state.recipesList[index].recipe!,
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
