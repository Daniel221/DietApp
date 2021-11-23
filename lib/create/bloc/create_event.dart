part of 'create_bloc.dart';

abstract class CreateEvent extends Equatable {
  const CreateEvent();

  @override
  List<Object> get props => [];
}

class SaveAllOnlineEvent extends CreateEvent {
  // info a pasarle
  final File? img;
  final Map<dynamic, dynamic> userData;

  // los hacemos requeridos
  SaveAllOnlineEvent({required this.img, required this.userData});

  @override
  // compara estados
  List<Object> get props => [userData];
}
