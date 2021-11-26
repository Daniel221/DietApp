import 'package:diet_app/create/create_form.dart';
import 'package:diet_app/user_info/bloc/info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class User extends StatefulWidget {
  User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 25, 0, 0),
      child: ListView(
        children: [
          Center(
            child: Text(
              "Información del usuario",
              style: TextStyle(fontSize: 28),
            ),
          ),
          Container(height: 25),
          Container(
            child: BlocProvider(
              create: (context) => InfoBloc()..add(UserInfoEvent()),
              child: BlocConsumer<InfoBloc, InfoState>(
                listener: (context, state) {
                  if (state is FailedUserInfoState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('No hay información'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingUserInfoState) {
                    return Text('Cargando...');
                  } else if (state is SuccessUserInfoState) {
                    // return Text(
                    //      Peso: ${state.info["peso"]} kg. state.info["porcentaje"]}%');

                    return Container(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 150.0,
                            backgroundImage: NetworkImage(state.info["img"]),
                            backgroundColor: Colors.transparent,
                          ),
                          Card(
                            child: ListTile(
                              leading: Text('Nombre: ${state.info["name"]}'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Text(
                                  'Estatura: ${state.info["estatura"]} m.'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Text('Peso: ${state.info["peso"]} kg.'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Text(
                                  'Porcentaje de grasa: ${state.info["porcentaje"]} %'),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Text('Ayuda');
                },
              ),
            ),
          ),
          FloatingActionButton(
            child: Icon(FontAwesomeIcons.edit),
            onPressed: () {
              // cuando de click, nos manda a otra página (nav. entre páginas)
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreateForm()),
              );
            },
          ),
        ],
      ),
    );
  }
}
