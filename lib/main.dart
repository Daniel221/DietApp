import 'package:diet_app/auth/bloc/auth_bloc.dart';
import 'package:diet_app/splash_screen.dart';
import 'package:diet_app/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home_page.dart';

void main() async {
  // inicializar firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // auth bloc provider
  runApp(BlocProvider(
    create: (context) =>
        AuthBloc()..add(VerifyAuthEvent()), // le agrega el evento
    child: MyApp(), // todo myapp tiene acceso a la auth
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AlreadyAuthState) {
            // si ya está auth, vamos a homepage
            return HomePage();
          } else if (state is UnAuthState) {
            // si no, a welcome page -> de aquí a login o create
            return WelcomePage();
          }
          // por mientras...
          return SplashScreen();
        },
      ),
    );
  }
}
