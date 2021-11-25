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
                SizedBox(
                  height: 142,
                  width: 343,
                  child: Placeholder(),
                ),
                SizedBox(height: 20),
                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 30),
                ),
                ListTile(
                  leading: Text("1 Cup", style: TextStyle(fontSize: 15)),
                  title: Text("Milt"),
                ),
                ListTile(
                  leading: Text("1 Teaspoon", style: TextStyle(fontSize: 15)),
                  title: Text("Sugar"),
                ),
                ListTile(
                  leading: Text("1 Tablespoon", style: TextStyle(fontSize: 15)),
                  title: Text("Cinnamon"),
                ),
                SizedBox(height: 20),
                Text(
                  "Steps",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt in diam in ultrices. Integer rhoncus ipsum eget efficitur sagittis. Sed ligula nunc, tincidunt mollis suscipit sit amet, semper ac ante. Cras nec lacinia odio, laoreet pharetra mi. In maximus dignissim metus vel tristique. In tincidunt nisl at ligula congue hendrerit. Donec dapibus tortor ut metus lobortis, id maximus lorem blandit. Proin et libero interdum, commodo tortor euismod, ullamcorper lorem. Phasellus sed nunc nisl. Mauris")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
