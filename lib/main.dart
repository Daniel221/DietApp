import 'package:diet_app/login_page.dart';
import 'package:diet_app/providers/recipes_provider.dart';
import 'package:diet_app/recipe_search.dart';
import 'package:diet_app/recipes/bloc/recipes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<RecipesBloc>(
            create: (context) => RecipesBloc()..add(AllRecipesEvent()),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(body: LoginPage()),
    );
  }
}
