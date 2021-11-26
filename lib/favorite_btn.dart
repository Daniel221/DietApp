// ignore_for_file: must_be_immutable

import 'package:diet_app/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'db_connection.dart';
import 'favorites/bloc/favorites_bloc.dart';

class FavoriteBtn extends StatefulWidget {
  Recipe? recipe;
  FavoriteBtn({
    Key? key,
    @required this.recipe,
  }) : super(key: key);

  @override
  _FavoriteBtnState createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFavorite(widget.recipe?.label),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return IconButton(
          onPressed: () {
            if (snapshot.hasData && snapshot.data) {
              BlocProvider.of<FavoritesBloc>(context)
                  .add(RemoveFavoriteEvent(label: widget.recipe?.label));
            } else {
              BlocProvider.of<FavoritesBloc>(context)
                  .add(AddFavoritesEvent(recipe: widget.recipe!));
            }
            setState(() {});
          },
          icon: Icon(
            Icons.favorite,
            color: snapshot.hasData && snapshot.data
                ? Colors.red[300]
                : Colors.grey[400],
            size: 33,
          ),
        );
      },
    );
  }
}
