import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_app/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<GetAllFavoritesEvent>((event, emit) async {
      emit(FavoritesLoadState());
      try {
        List<Map<String, dynamic>>? saved = await _getFavorites();
        emit(FavoritesLoadSuccessfulState(
            favoritesList: saved ?? [], favoritesAmount: saved?.length));
      } catch (e) {
        emit(FavoritesLoadErrorState(errorMsg: e.toString()));
      }
    });

    on<AddFavoritesEvent>((event, emit) async {
      try {
        bool saved = await _addFavorite(event.recipe);
        emit(FavoritesChangeSuccessState(saved: saved));
      } catch (e) {}
    });

    on<RemoveFavoriteEvent>((event, emit) async {
      try {
        bool removed = await _removeFavorite(event.label);
        emit(FavoritesChangeSuccessState(saved: removed));
      } catch (e) {}
    });
  }

  Future _getFavorites() async {
    try {
      final query = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .collection('favorites')
          .get();
      final favorites = query.docs.map((doc) => doc.data()).toList();

      return favorites;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _addFavorite(Recipe recipe) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection('favorites') // id del usuario autenticado
        .doc(recipe.label)
        .set({
      "label": recipe.label,
      "image": recipe.image,
      "dishType": recipe.dishType,
      "cuisineType": recipe.cuisineType,
      "mealType": recipe.mealType,
      "ingredientLines": recipe.ingredientLines,
      "healthLabels": recipe.healthLabels,
      "calories": recipe.calories,
    });
    print("Add favorite!");

    return true;
  }

  Future<bool> _removeFavorite(String? label) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection('favorites')
        .doc(label)
        .delete();

    print("Remove favorite!");
    return true;
  }
}
