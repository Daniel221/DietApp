import 'package:diet_app/card_controller.dart';
import 'package:diet_app/providers/recipes_provider.dart';
import 'package:diet_app/recipes/bloc/recipes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class RecipeSearch extends StatefulWidget {
  RecipeSearch({Key? key}) : super(key: key);

  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 32, 0, 0),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25),
            child: ListView(
              children: [
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
                    return Center(
                      child: Text("Recetas"),
                    );
                  }),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 10),
            child: Container(
              margin: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Container(
                    width: 280,
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: "orange",
                          suffixIcon: IconButton(
                            onPressed: () {
                              BlocProvider.of<RecipesBloc>(context).add(
                                SearchRecipeEvent(
                                  queryText: searchController.text,
                                ),
                              );
                            },
                            icon: Icon(Icons.search),
                          )),
                    ),
                  ),
                  Text("filtros")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _error(String msg) {
  return Center(child: Text("$msg"));
}
