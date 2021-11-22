import 'package:diet_app/auth/user_auth_repository.dart';
import 'package:diet_app/home_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'form_body.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final UserAuthRepository _auth = UserAuthRepository();
  // inicializar instacia de login bloc
  late LoginBloc _loginBloc;

  // para poder agregar eventos al bloc
  // al presionar los botones de login

  bool _showLoading = false;
  String email = '';
  String pwd = '';

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
    // agregar evento al login bloc
    _loginBloc.add(LoginWithGoogleEvent());
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
          color: '#cce3de'.toColor(),
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
            return _loginBloc;
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
                return HomeNavigation();
              }
              // si no es success, se muestra el form
              return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: '#cce3de'.toColor(),
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Ingresa a tu cuenta',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Container(
                                padding: EdgeInsets.only(top: 30, left: 3),
                                child: Column(
                                  children: <Widget>[
                                    // Form(
                                    //   autovalidateMode:
                                    //       AutovalidateMode.onUserInteraction,
                                    //   child: ListView(
                                    //     scrollDirection: Axis.vertical,
                                    //     shrinkWrap: true,
                                    //     padding: EdgeInsets.all(24),
                                    //     children: [
                                    //       TextFormField(
                                    //         decoration: InputDecoration(
                                    //           label: Text('Correo'),
                                    //           border: OutlineInputBorder(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(15),
                                    //           ),
                                    //           filled: true,
                                    //         ),
                                    //         validator: (value) {
                                    //           if (value == null ||
                                    //               value.isEmpty) {
                                    //             return 'Ingresa el correo';
                                    //           } else {
                                    //             email = value;
                                    //           }
                                    //           return null;
                                    //         },
                                    //       ),
                                    //       SizedBox(height: 24),
                                    //       TextFormField(
                                    //         obscureText: true,
                                    //         enableSuggestions: false,
                                    //         autocorrect: false,
                                    //         decoration: InputDecoration(
                                    //           label: Text('Contraseña'),
                                    //           border: OutlineInputBorder(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(15),
                                    //           ),
                                    //           filled: true,
                                    //         ),
                                    //         validator: (value) {
                                    //           if (value == null ||
                                    //               value.isEmpty) {
                                    //             return 'Ingresa la contraseña';
                                    //           } else {
                                    //             pwd = value;
                                    //           }
                                    //           return null;
                                    //         },
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    // MaterialButton(
                                    //   onPressed: () async {
                                    //     dynamic res =
                                    //         await _auth.anonymousSignIn();
                                    //     if (res.emailVerified == null) {
                                    //       print('Error');
                                    //     } else {
                                    //       print('res: ${res.emailVerified}');
                                    //       print('User signed in');
                                    //     }
                                    //   },
                                    //   minWidth: double.infinity,
                                    //   height: 60,
                                    //   color: '#6b9080'.toColor(),
                                    //   elevation: 0,
                                    //   shape: RoundedRectangleBorder(
                                    //     // side: BorderSide(color: Colors.black),
                                    //     borderRadius: BorderRadius.circular(50),
                                    //   ),
                                    //   child: Text(
                                    //     'Ingresar',
                                    //     style: TextStyle(
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 18,
                                    //       color: Colors.white,
                                    //     ),
                                    //   ),
                                    // ),
                                    FormBody(
                                      onGoogleLoginTap: _googleLogIn,
                                      onAnonymousLoginTap: _anonymousLogIn,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
