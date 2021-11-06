import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';

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

class FormBody extends StatelessWidget {
  // cambiar a un solo value changed que reciba enum de login
  final ValueChanged<bool> onAnonymousLoginTap;
  final ValueChanged<bool> onGoogleLoginTap;
  String email = '';
  String pwd = '';
  // final ValueChanged<bool> onFacebookLoginTap;

  FormBody({
    Key? key,
    required this.onAnonymousLoginTap,
    required this.onGoogleLoginTap,
    // required this.onFacebookLoginTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Form(
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   child: ListView(
              //     scrollDirection: Axis.vertical,
              //     shrinkWrap: true,
              //     padding: EdgeInsets.all(24),
              //     children: [
              //       TextFormField(
              //         decoration: InputDecoration(
              //           label: Text('Correo'),
              //           border: OutlineInputBorder(),
              //         ),
              //         validator: (value) {
              //           if (value == null || value.isEmpty) {
              //             return 'Ingresa el correo';
              //           } else {
              //             email = value;
              //           }
              //           return null;
              //         },
              //       )
              //     ],
              //   ),
              // ),
              Expanded(
                child: GoogleAuthButton(
                  onPressed: () => onGoogleLoginTap(true),
                  text: "Iniciar con Google",
                  style: AuthButtonStyle(borderRadius: 18),
                  darkMode: false,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
