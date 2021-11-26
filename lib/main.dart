import 'package:diet_app/breakfast/bloc/breakfast_recipes_bloc.dart';
import 'package:diet_app/dinner/bloc/dinner_recipes_bloc.dart';
import 'package:diet_app/lunch/bloc/lunch_recipes_bloc.dart';
import 'package:diet_app/recipes/bloc/recipes_bloc.dart';
import 'package:diet_app/auth/bloc/auth_bloc.dart';
import 'package:diet_app/home_navigation.dart';
import 'package:diet_app/splash_screen.dart';
import 'package:diet_app/user_info/bloc/info_bloc.dart';
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
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<RecipesBloc>(
          create: (context) => RecipesBloc()..add(AllRecipesEvent()),
        ),
        BlocProvider<BreakfastRecipesBloc>(
          create: (context) =>
              BreakfastRecipesBloc()..add(AllBreakfastRecipesEvent()),
        ),
        BlocProvider<LunchRecipesBloc>(
          create: (context) => LunchRecipesBloc()..add(AllLunchRecipesEvent()),
        ),
        BlocProvider<DinnerRecipesBloc>(
          create: (context) =>
              DinnerRecipesBloc()..add(AllDinnerRecipesEvent()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(VerifyAuthEvent()),
        ),
        BlocProvider<InfoBloc>(
          create: (context) => InfoBloc()..add(UserInfoEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
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
            return HomeNavigation();
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
