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

  String _dietSelectedValue = "All";
  String _cuisineSelectedValue = "All";
  String _dishSelectedValue = "All";
  String _healthSelectedValue = "All";

  final _diet = [
    "All",
    "balanced",
    "high-fiber",
    "high-protein",
    "low-carb",
    "low-fat",
    "low-sodium"
  ];

  final _cuisine = [
    "All",
    "American",
    "Asian",
    "British",
    "Caribbean",
    "Central Europe",
    "Chinese",
    "Easter Europe",
    "French",
    "Indian",
    "Italian",
    "Japanese",
    "Mexican",
  ];

  final _dish = [
    "All",
    "Biscuits and cookies",
    "Bread",
    "Cereals",
    "Condiments and sauces",
    "Desserts",
    "Drinks",
    "Main course",
    "Pancake",
    "Preps",
    "Preserve",
    "Salad",
    "Sandwiches",
    "Side dish",
    "Soup"
  ];

  final _health = [
    "None",
    "alcohol-cocktail",
    "alcohol-free",
    "celery-free",
    "DASH",
    "egg-free",
    "fish-free",
    "roadmap-free",
    "gluten-free",
    "immuno-supportive",
    "keto-friendly",
    "kidney-friendly",
    "low-fat-abs",
    "low-potassium",
    "low-sugar",
  ];

  Widget _filterForm() {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      height: MediaQuery.of(context).size.height - 80,
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Filtros",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Divider(),
          ListTile(
            leading: Text("Diet type"),
            title: DropdownButtonFormField(
              items: _diet
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              hint: Text(_dietSelectedValue),
              onChanged: (String? value) {
                setState(() {
                  _dietSelectedValue = value!;
                });
              },
              onSaved: (String? value) {
                setState(() {
                  _dietSelectedValue = value!;
                });
              },
            ),
          ),
          Container(height: 10),
          ListTile(
            leading: Text("Cuisine type"),
            title: DropdownButtonFormField(
              items: _cuisine
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              hint: Text(_cuisineSelectedValue),
              onChanged: (String? value) {
                setState(() {
                  _cuisineSelectedValue = value!;
                });
              },
              onSaved: (String? value) {
                setState(() {
                  _cuisineSelectedValue = value!;
                });
              },
            ),
          ),
          Container(height: 10),
          ListTile(
            leading: Text("Dish type"),
            title: DropdownButtonFormField(
              items: _dish
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              hint: Text(_dishSelectedValue),
              onChanged: (String? value) {
                setState(() {
                  _dishSelectedValue = value!;
                });
              },
              onSaved: (String? value) {
                setState(() {
                  _dishSelectedValue = value!;
                });
              },
            ),
          ),
          Container(height: 10),
          ListTile(
            leading: Text("Health"),
            title: DropdownButtonFormField(
              items: _health
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              hint: Text(_healthSelectedValue),
              onChanged: (String? value) {
                setState(() {
                  _dishSelectedValue = value!;
                });
              },
              onSaved: (String? value) {
                setState(() {
                  _dishSelectedValue = value!;
                });
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Aceptar"),
          )
        ],
      ),
    );
  }

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
                                  parameters: {
                                    "diet": _dietSelectedValue,
                                    "cuisineType": _cuisineSelectedValue,
                                    "mealType": _dishSelectedValue,
                                    "health": _healthSelectedValue,
                                  },
                                ),
                              );
                            },
                            icon: Icon(Icons.search),
                          )),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (BuildContext buildContext,
                            Animation animation, Animation secondaryAnimation) {
                          return Scaffold(
                            body: _filterForm(),
                          );
                        },
                      );
                    },
                    child: Text("filters"),
                  )
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
