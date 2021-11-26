// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:diet_app/breakfast/bloc/breakfast_recipes_bloc.dart';
import 'package:diet_app/card_controller.dart';
import 'package:diet_app/dinner/bloc/dinner_recipes_bloc.dart';
import 'package:diet_app/lunch/bloc/lunch_recipes_bloc.dart';
import 'package:diet_app/recipes/bloc/recipes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                margin: EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://www.consumidorglobal.com/uploads/s1/32/79/3/cocinandomelavida.jpeg"),
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 150, 0),
                padding: EdgeInsets.all(10),
                color: Color(0xa8dbdbdb),
                child: Center(
                  child: Text(
                    "Discover & try new recipes every day, with us",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(height: 20),
          Text(
            "Breakfast",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(height: 25),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 286),
            child: BlocBuilder<BreakfastRecipesBloc, BreakfastRecipesState>(
                builder: (context, state) {
              if (state is BreakfastRecipesLoadingState) {
                return Column(children: [
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  ),
                ]);
              } else if (state is BreakfastSearchErrorState) {
                return _error(state.errorMsg);
              } else if (state is BreakfastContentAvailableState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.totalHits,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 30, 20),
                      height: 240,
                      width: 180,
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
          Container(height: 20),
          Text(
            "Lunch",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(height: 25),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 286),
            child: BlocBuilder<LunchRecipesBloc, LunchRecipesState>(
                builder: (context, state) {
              if (state is LunchRecipesLoadingState) {
                return Column(children: [
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  ),
                ]);
              } else if (state is LunchSearchErrorState) {
                return _error(state.errorMsg);
              } else if (state is LunchContentAvailableState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.totalHits,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 30, 20),
                      height: 240,
                      width: 180,
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
          Container(height: 20),
          Text(
            "Dinner",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(height: 25),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 286),
            child: BlocBuilder<DinnerRecipesBloc, DinnerRecipesState>(
                builder: (context, state) {
              if (state is DinnerRecipesLoadingState) {
                return Column(children: [
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  ),
                ]);
              } else if (state is DinnerSearchErrorState) {
                return _error(state.errorMsg);
              } else if (state is DinnerContentAvailableState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.totalHits,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 30, 20),
                      height: 240,
                      width: 180,
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
    );
  }
}

Widget _error(String msg) {
  return Center(child: Text("$msg"));
}
