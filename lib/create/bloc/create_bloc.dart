import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'create_event.dart';
part 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  CreateBloc() : super(CreateInitial()) {
    on<SaveAllOnlineEvent>((event, emit) async {
      emit(LoadingState());
      bool saved = await _saveUsers(event.userData, event.img);
      emit(
        saved ? CreatedUserState() : ErrorUserState(errorMsg: ''),
      );
    });
  }

  // guardar en firebase
  Future<bool> _saveUsers(Map<String, dynamic> user, File? img) async {
    try {
      // Save data to firebase
      // subir imagen a un bucket de firebase storage
      if (img != null) {
        // subir img al bucket
        String _imageUrl = await _uploadFile(img);
        // actualizar la info con la url/link de la img
        if (_imageUrl.isNotEmpty) user['foto'] = _imageUrl;
      }
      // para subir a firestore la info (name, email y foto)
      await FirebaseFirestore.instance.collection('users').add(user);
      return true;
    } catch (e) {
      return false;
    }
  }

  // método para subir img al bucket y retornar la url
  Future<String> _uploadFile(File? selectedFile) async {
    try {
      var stamp = DateTime.now();
      // no se subió -> no hay link de img
      if (selectedFile == null) return '';
      // definir upload task
      UploadTask task = FirebaseStorage.instance
          .ref('users/imagen_${stamp}.png')
          .putFile(selectedFile);
      // ejecutar task de upload
      await task;
      // recuperar url del file
      return await task.storage
          .ref('users/imagen_${stamp}.png')
          .getDownloadURL();
    } catch (e) {
      print(e.toString());
      return '';
    }
  }
}
