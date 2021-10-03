// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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

  Widget _buildNameField() {
    return TextFormField(
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        labelText: 'Name',
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
          return 'Name is required';
        }
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildConfirmPwdField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Confirm password',
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
          return 'Passwords should be the same';
        }
      },
      onSaved: (String? value) {
        _pwd = value!;
      },
    );
  }

  Widget _buildLoginHeading() {
    return Container(
      // color: Colors.red,
      width: 150,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Create account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
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
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),
                _buildNameField(),
                // ignore: prefer_const_constructors
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
                  height: 10,
                ),
                _buildConfirmPwdField(),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  // para aumentar tamaño, lo wrappeo con sizedbox
                  height: 60,
                  child: ElevatedButton(
                    child: Text(
                      'Create account',
                      style: TextStyle(fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[300],
                    ),
                    onPressed: () {
                      print('login');
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
