// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'food_card.dart';

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
          Placeholder(
            fallbackHeight: 300,
          ),
          Container(height: 20),
          Text(
            "Desayuno",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(height: 25),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 250),
            child: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: CardController.testList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(right: 30),
                  height: 240,
                  width: 160,
                  //child: FoodCard(),
                );
              },
            ),
          ),
          Container(height: 20),
          Text(
            "Comida",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(height: 25),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 250),
            child: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: CardController.testList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(right: 30),
                  height: 240,
                  width: 160,
                  child: FoodCard(),
                );
              },
            ),
          ),
          Container(height: 20),
          Text(
            "Cena",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(height: 25),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 250),
            child: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: CardController.testList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(right: 30),
                  height: 240,
                  width: 160,
                  child: FoodCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
