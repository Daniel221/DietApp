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
        bool saved = await _addFavorite(event.food);
        emit(FavoritesChangeSuccessState(saved: saved));
      } catch (e) {}
    });

    on<RemoveFavoriteEvent>((event, emit) async {
      try {
        bool removed = await _removeFavorite(event.food);
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

  Future<bool> _addFavorite(food) async {
    await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid.toString())
            .collection('favorites') // id del usuario autenticado
            .doc('food name') //TODO: food["label"]
        // .set({
        //   "label": food["name"],
        //   "estatura": food["estatura"],
        //   "peso": food["peso"],
        //   "porcentaje": food["porcentaje"],
        //   // "password": user["password"],
        // })
        ;
    return true;
  }

  Future<bool> _removeFavorite(food) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection('favorites')
        .doc('title') //TODO: food["label"]
        .delete();
    return true;
  }
}
