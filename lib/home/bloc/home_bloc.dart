import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // instancia de firestore
  final _cFirestore = FirebaseFirestore.instance;
  HomeBloc() : super(HomeInitial()) {
    on<RequestDataEvent>(_onRequestData);
  }
  // on data request
  void _onRequestData(HomeEvent event, Emitter emitState) async {
    // mientras el req se ejecuta, se debe de emitir el estado de loading
    emitState(LoadingState());
    var usersList = await _getUsers();
    if (usersList == null) {
      emitState(NoDataState());
    } else {
      emitState(ExistingDataState(usersList: usersList));
    }
  }

  Future<List<Map<String, dynamic>>?> _getUsers() async {
    try {
      // conexión a la colección --- .get() para que traiga info del user
      var users = await _cFirestore.collection('test').get();
      return users.docs
          .map(
            (u) => {"email": u['email'], "name": u['name']},
          )
          .toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
