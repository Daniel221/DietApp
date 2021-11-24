import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final recipe;
  const FoodCard({
    Key? key,
    @required this.recipe,
  }) : super(key: key);

  test() {
    print(recipe == Null);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: new InkWell(
        onTap: () {
          test();
          // Navigator.of(context).push()
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder(
            //   fallbackHeight: 160,
            //   fallbackWidth: 150,
            // ),
            Image.network(
              // "https://pbs.twimg.com/profile_images/1014984404769394688/px4PTUZm_400x400.jpg",
              recipe != Null
                  ? recipe.image
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
              height: 160,
              width: 150,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 68,
              child: Text(
                recipe != Null ? "${recipe.label}" : "ya es toda we",
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardController {
  static final testList = [
    "Ensalada Cesar",
    "Pollo rostizado con especias y panecito pa acompañar",
    "sandwich",
    "pizza hut"
  ];

  static createCard(title, img) {
    img = img == ""
        ? "https://pbs.twimg.com/profile_images/1014984404769394688/px4PTUZm_400x400.jpg"
        : img;
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: new InkWell(
        onTap: () {
          // Navigator.of(context).push()
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder(
            //   fallbackHeight: 160,
            //   fallbackWidth: 150,
            // ),
            Image.network(
              img,
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
              height: 160,
              width: 150,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 68,
              child: Text(
                "$title",
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
