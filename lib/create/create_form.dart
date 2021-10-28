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

class _CreateFormState extends State<CreateForm> {
  var _formKey = GlobalKey<FormState>();
  late CreateBloc _createBloc;
  String name = '';
  String email = '';
  File? _img;

  // image picker
  Future<File?> _getImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      // limitar ancho y alto
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    if (pickedImage != null) {
      return File(pickedImage.path);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo usuario'),
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
              padding: EdgeInsets.all(24),
              children: [
                Container(
                  child: Stack(
                    // para alinear al centro los elementos del stack
                    alignment: Alignment.topCenter,
                    children: [
                      CircleAvatar(
                        maxRadius: 84,
                        child: _img != null ? Image.file(_img!) : Container(),
                        backgroundColor: Colors.blue[200],
                      ),
                      // para acomodar el ícono de la cámara
                      Positioned(
                        bottom: 0,
                        right: 0,
                        // recorrer la pantalla 1 / 4 hacia la derecha
                        left: MediaQuery.of(context).size.width / 4,
                        child: CircleAvatar(
                          maxRadius: 24,
                          backgroundColor: Colors.grey[200],
                          child: IconButton(
                            tooltip: 'Tomar foto',
                            color: Colors.black87,
                            icon: Icon(FontAwesomeIcons.cameraRetro),
                            onPressed: () async {
                              _img = await _getImage();
                              setState(() {});
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Nombre'),
                    border: OutlineInputBorder(),
                  ),
                  // The validator receives the text that the user has entered.
                  // value = texto actual dentro del text field
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa el nombre';
                    } else {
                      name = value;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa el correo';
                    } else {
                      name = value;
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // evento que tenemos en el bloc
                      _createBloc.add(
                        SaveAllOnlineEvent(
                          img: _img,
                          userData: {
                            'email': email,
                            'name': name,
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
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
