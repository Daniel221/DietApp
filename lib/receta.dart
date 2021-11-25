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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Color(0xFFABABAB),
            ),
          ),
        ],
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
                    "${widget.recipeDetails.dishType![0]} ${widget.recipeDetails.cuisineType![0]} ${widget.recipeDetails.mealType![0]}"),
                SizedBox(height: 20),
                Image.network(
                  // "https://pbs.twimg.com/profile_images/1014984404769394688/px4PTUZm_400x400.jpg",
                  widget.recipeDetails != Null
                      ? widget.recipeDetails.image!
                      : "https://pbs.twimg.com/profile_images/1014984404769394688/px4PTUZm_400x400.jpg",
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
                  // height: 160,
                  // width: 150,
                ),
                // SizedBox(
                //   height: 142,
                //   width: 343,
                //   child: Placeholder(),
                // ),
                SizedBox(height: 20),
                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.recipeDetails.ingredientLines!.length,
                  itemBuilder: (BuildContext context, int index) => Text(
                      "${widget.recipeDetails.ingredientLines![index]} \n"),
                ),
                SizedBox(height: 20),
                Text(
                  "Labels",
                  style: TextStyle(fontSize: 30),
                ),
                ListView.builder(
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
