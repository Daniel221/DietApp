import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(InfoInitial()) {
    on<InfoEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<UserInfoEvent>((event, emitState) async {
      try {
        emitState(LoadingUserInfoState());
        var info = await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid
                .toString()) // id del usuario autenticado
            .get()
          ..data();
        emitState(SuccessUserInfoState(info: info));
      } catch (e) {
        emitState(FailedUserInfoState(
          errorMsg: e.toString(),
        ));
      }
    });
  }
}
