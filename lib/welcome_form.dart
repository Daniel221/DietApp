import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:diet_app/create/create_form.dart';
import 'package:diet_app/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet_app/home/home_page.dart';
import 'login/bloc/login_bloc.dart';
import 'login/form_body.dart';

class WelcomeForm extends StatefulWidget {
  WelcomeForm({Key? key}) : super(key: key);

  @override
  _WelcomeFormState createState() => _WelcomeFormState();
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

class _WelcomeFormState extends State<WelcomeForm> {
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
          // color: '#a4c3b2'.toColor(),
          color: Colors.green,
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
                // si se loggeó bien, se debe de hacer query a FB para sacar info
                // meterse a la página principal
                print('state $state');
                return HomePage();
              }
              // si no es success, se muestra el form
              return Scaffold(
                body: SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFcce3de),
                      // color: Colors.green,
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              'Bienvenido',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'DietApp es la aplicación perfecta para ti que quieres cuidar de tu salud.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/welcome.png'),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            MaterialButton(
                              color: Color(0xFF6b9080),
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                'Ingresar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            // MaterialButton(
                            //   color: Color(0xFF6b9080),
                            //   // color: Colors.green,
                            //   minWidth: double.infinity,
                            //   height: 60,
                            //   onPressed: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => CreateForm(),
                            //       ),
                            //     );
                            //   },
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(50),
                            //   ),
                            //   child: Text(
                            //     'Crear cuenta',
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ],
                    ),
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
