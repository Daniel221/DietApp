import 'package:diet_app/card_controller.dart';
import 'package:flutter/material.dart';

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
      margin: EdgeInsets.fromLTRB(10, 25, 0, 0),
      child: ListView(
        children: [
          Center(
            child: Row(
              children: [
                Container(
                  width: 320,
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: "busca tus recetas aquí!",
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                        )),
                  ),
                ),
                Text("filtros")
              ],
            ),
          ),
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
        ],
      ),
    );
  }
}
