import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet_app/home/home_page.dart';

import 'bloc/login_bloc.dart';
import 'form_body.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class _LoginFormState extends State<LoginForm> {
  // inicializar instacia de login bloc
  late LoginBloc _loginBloc;

  // para poder agregar eventos al bloc
  // al presionar los botones de login

  bool _showLoading = false;

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  void _anonymousLogIn(bool _) {
    print("anonimo");
    // agregar evento al login bloc de manera anónima
    _loginBloc.add(LoginWithAnonymousEvent());
  }

  void _googleLogIn(bool _) {
    // invocar al login de firebase con el bloc
    // recodar configurar pantallad Oauth en google Cloud
    print("google");
    // agregar evento al login bloc de google
    _loginBloc.add(
        LoginWithGoogleEvent()); // hasta ahorita sólo está implementado el sign in con google
  }

  void _facebookLogIn(bool _) {
    // invocar al login de firebase con el bloc
    print("facebook");
    // agregar evento al login bloc
    _loginBloc.add(LoginWithFacebookEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // stack background image
        Container(
          color: Colors.green,
          // color: '#a3b18a'.toColor(),
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Color(0xff0884cc),
          //       Color(0xff04476e),
          //     ],
          //   ),
          // ),
        ),
        // form content
        // agregar bloc login provider
        // agregar bloc login consumer
        // revisar estados y retornar error o home page o login page
        SafeArea(
            // como un padding/margin al rededor del widget
            child: BlocProvider(
          create: (context) {
            _loginBloc = LoginBloc();
            return LoginBloc();
          },
          // snippet: blocc
          child: BlocConsumer<LoginBloc, LoginState>(
            // sirve para todo MENOS para retornar widgets
            // consume al bloc provider
            listener: (context, state) {
              // si el estado emite error, se muestra
              if (state is LoginErrorState) {
                _showLoading = false; // ya no está cargando nada
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text(
                          'Error al hacer login',
                        ),
                        content: Text('${state.error}:\n${state.code}'));
                  },
                );
              }
            },
            builder: (context, state) {
              if (state is LoginSuccessState) {
                return HomePage();
              }
              // si no es success, se muestra el form
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 60, horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xa0FFffff),
                  ),
                  child: FormBody(
                    onFacebookLoginTap: _facebookLogIn,
                    onGoogleLoginTap: _googleLogIn,
                    onAnonymousLoginTap: _anonymousLogIn,
                  ),
                ),
              );
            },
          ),
        )),
        // mostrar como círculo de loading
        Align(
          alignment: Alignment.bottomCenter,
          child: _showLoading ? CircularProgressIndicator() : Container(),
        ),
      ],
    );
  }
}
