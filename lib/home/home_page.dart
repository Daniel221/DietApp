import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:diet_app/auth/bloc/auth_bloc.dart';
import 'package:diet_app/create/create_form.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page'),
          // add logout
          actions: [
            IconButton(
              onPressed: () {
                // agregar evento a bloc auth para desautenticar
                BlocProvider.of<AuthBloc>(context).add(SignOutAuthEvent());
              },
              icon: Icon(FontAwesomeIcons.signOutAlt),
            ),
          ]),
      body: BlocProvider(
        create: (context) => HomeBloc()..add(RequestDataEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is NoDataState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Yay! A SnackBar!'),
              ));
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              // estado cuando se estén cargando los users
              return Center(child: CircularProgressIndicator());
            } else if (state is ExistingDataState) {
              return ListView.builder(
                itemCount: state.usersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text('${state.usersList[index]["name"]}');
                },
              );
            }
            return Center(
              child: Text('No hay datos por mostrar aún'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.user),
        onPressed: () {
          // cuando de click, nos manda a otra página (nav. entre páginas)
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateForm()),
          );
        },
      ),
    );
  }
}
