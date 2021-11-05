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
      margin: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ],
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
