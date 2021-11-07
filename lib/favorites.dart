import 'package:flutter/material.dart';

import 'card_controller.dart';

class Favorites extends StatefulWidget {
  Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: CardController.testList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                    height: 240,
                    width: 260,
                    child: CardController.createCard(
                        CardController.testList[index], ""),
                  );
                },
              ),
            ),
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
