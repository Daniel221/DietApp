// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:diet_app/models/recipe.dart';
import 'package:flutter/material.dart';

class Receta extends StatefulWidget {
  final Recipe recipeDetails;
  const Receta({
    Key? key,
    required this.recipeDetails,
  }) : super(key: key);

  @override
  _RecetaState createState() => _RecetaState();
}

class _RecetaState extends State<Receta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Text(
                  widget.recipeDetails.label!,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${widget.recipeDetails.calories!.toStringAsFixed(0)}kcl",
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                    "${widget.recipeDetails.dishType![0]} ${widget.recipeDetails.cuisineType![0]} ${widget.recipeDetails.mealType![0]}",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    )),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.recipeDetails.image ??
                            "https://pbs.twimg.com/profile_images/1014984404769394688/px4PTUZm_400x400.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 20),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.recipeDetails.ingredientLines!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Text(
                              "${widget.recipeDetails.ingredientLines![index]} \n"));
                    }),
                SizedBox(height: 20),
                Text(
                  "Labels",
                  style: TextStyle(fontSize: 30),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.recipeDetails.healthLabels!.length,
                  itemBuilder: (BuildContext context, int index) =>
                      Text("${widget.recipeDetails.healthLabels![index]}"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _ingredients(dynamic ing) {
  return Text("${ing} \n");
}
