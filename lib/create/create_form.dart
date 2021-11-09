import 'dart:io';

import 'package:diet_app/create/bloc/create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CreateForm extends StatefulWidget {
  CreateForm({Key? key}) : super(key: key);

  @override
  _CreateFormState createState() => _CreateFormState();
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

class _CreateFormState extends State<CreateForm> {
  var _formKey = GlobalKey<FormState>();
  late CreateBloc _createBloc;
  String name = '';
  String lastName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcce3de),
      appBar: AppBar(
        title: Text('Ingresar información'),
        // backgroundColor: Color(0xFFcce3de),
        backgroundColor: Color(0xFF6b9080),
        // backgroundColor: Colors.red,
      ),
      body: BlocProvider(
        create: (context) {
          _createBloc = CreateBloc();
          return _createBloc;
        },
        child: BlocListener<CreateBloc, CreateState>(
          listener: (context, state) {
            // si se creó,
            if (state is CreatedUserState) Navigator.of(context).pop();
            // TODO hacer los demás estados posibles
          },
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(24),
              children: [
                Text(
                  'Ingresa tus datos',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Nombre'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu nombre';
                    } else {
                      email = value;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Apellido'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu apellido';
                    } else {
                      lastName = value;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Correo'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu correo';
                    } else {
                      email = value;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    label: Text('Estatura'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu estatura';
                    } else {
                      password = value;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/create.png'),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                MaterialButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // evento que tenemos en el bloc
                      _createBloc.add(
                        SaveAllOnlineEvent(
                          userData: {
                            'email': email,
                            'name': name,
                            'lastName': lastName,
                            'password': password,
                          },
                        ),
                      );
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      // para resetear el form
                      _formKey.currentState!.reset();
                      // cerrar teclado en caso de que quede abierto
                      FocusScope.of(context).unfocus();
                    }
                  },
                  minWidth: double.infinity,
                  height: 60,
                  color: '#6b9080'.toColor(),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Guardar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
