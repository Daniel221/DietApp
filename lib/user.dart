import 'package:diet_app/auth/bloc/auth_bloc.dart';
import 'package:diet_app/create/create_form.dart';
import 'package:diet_app/user_info/bloc/info_bloc.dart';
import 'package:diet_app/welcome_page.dart';
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
              "User info.",
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
                    return Container(
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 150.0,
                            backgroundImage: NetworkImage(state.info["img"] ==
                                    ""
                                ? "https://image.flaticon.com/icons/png/512/875/875503.png"
                                : state.info["img"]),
                            backgroundColor: Colors.transparent,
                          ),
                          Card(
                            child: ListTile(
                              leading: Text('Name: ${state.info["name"]}'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading:
                                  Text('Height: ${state.info["estatura"]} m.'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading:
                                  Text('Weight: ${state.info["peso"]} kg.'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Text(
                                  'Average fat: ${state.info["porcentaje"]} %'),
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
          SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Color(0xFF6b9080),
                child: Icon(FontAwesomeIcons.edit),
                onPressed: () {
                  // cuando de click, nos manda a otra página (nav. entre páginas)
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateForm()),
                  );
                },
              ),
              SizedBox(
                height: 25,
              ),
              FloatingActionButton(
                backgroundColor: Color(0xFF6b9080),
                child: Icon(FontAwesomeIcons.signOutAlt),
                heroTag: 'logOut',
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(SignOutAuthEvent());
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
