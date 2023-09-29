import 'package:flutter/material.dart';
import '../screens/consts/consts.dart';
import 'custom_textfield.dart';
import 'custom_button.dart'; // Importa el widget CustomButton

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CustomTextField(labelText: 'Usuario'),
        const SizedBox(height: 12.0),
        const CustomTextField(labelText: 'Contraseña'),
        const SizedBox(height: 20.0),
        CustomButton(
          text: 'Sign In',
          onPressed: () {
            // Aquí puedes agregar la lógica para el inicio de sesión
          },
          backgroundColor: kItesoBlueLight,
        ),
        const SizedBox(height: 16.0),
        CustomButton(
          text: 'Continue as a guest',
          onPressed: () {
            // Aquí puedes agregar la lógica para continuar como invitado
          },
          backgroundColor: kItesoGray,
        ),
      ],
    );
  }
}
