import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

getFavorite(String? label) async {
  print("getting the favorite");
  final query = await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
      .collection('favorites') // id del usuario autenticado
      .doc('$label')
      .get()
    ..data();

  print("got favorite data paps");
  return !(query.data() == null);
}

Future<bool> removeFavorite(String? label) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
      .collection('favorites')
      .doc(label)
      .delete();

  print("Remove favorite!");
  return true;
}
