// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:diet_app/create_account.dart';
import 'package:diet_app/home_navigation.dart';
import 'package:diet_app/providers/recipes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _pwd = '';
  Widget _buildEmailField() {
    return TextFormField(
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        labelText: 'Email',
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildPwdField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password is required';
        }
      },
      onSaved: (String? value) {
        _pwd = value!;
      },
    );
  }

  Widget _buildLoginHeading() {
    return SizedBox(
      // color: Colors.red,
      width: 150,
      height: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
                fontSize: 30),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DietApp'),
        backgroundColor: Colors.green[400],
      ),
      body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLoginHeading(),
                SizedBox(
                  height: 10,
                ),
                _buildEmailField(),
                SizedBox(
                  height: 10,
                ),
                _buildPwdField(),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  // para aumentar tamaño, lo wrappeo con sizedbox
                  height: 60,
                  child: ElevatedButton(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.green[300]),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                              create: (context) =>
                                  RecipesProvider()..getAllRecipes(),
                              child: HomeNavigation()),
                        ),
                      );
                      print('login');
                    },
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    'Create account',
                    style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateAccount()),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
