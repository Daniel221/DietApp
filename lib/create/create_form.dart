import 'dart:io';

import 'package:diet_app/auth/bloc/auth_bloc.dart';
import 'package:diet_app/create/bloc/create_bloc.dart';
import 'package:diet_app/home_navigation.dart';
import 'package:diet_app/user.dart';
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
  double peso = 0.0;
  double estatura = 0.0;
  double porcentaje = 0.0;
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
      backgroundColor: Color(0xFFcce3de),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        title: Text('Personal info.'),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     // agregar evento a bloc auth para desautenticar
          //     BlocProvider.of<AuthBloc>(context).add(SignOutAuthEvent());
          //     print('bye');
          //   },
          //   icon: Icon(FontAwesomeIcons.signOutAlt),
          // ),
        ],
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
            if (state is CreatedUserState) {
              // Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeNavigation(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Info. saved')),
              );
            }
          },
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
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
                          backgroundColor: Color(0xFF95d5b2)),
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
                            tooltip: 'Take picture',
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
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Type in your name';
                    } else {
                      name = value;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Height'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Type in your height';
                    } else {
                      estatura = double.parse(value);
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Weight'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Type in your weight';
                    } else {
                      peso = double.parse(value);
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Average fat'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Type in your average fat';
                    } else {
                      porcentaje = double.parse(value);
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                MaterialButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // evento que tenemos en el bloc
                      _createBloc.add(
                        SaveAllOnlineEvent(
                          img: _img,
                          userData: {
                            'porcentaje': porcentaje,
                            'name': name,
                            'peso': peso,
                            'estatura': estatura,
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
                    'Save info.',
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
