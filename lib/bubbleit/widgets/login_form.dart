import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import '../screens/consts/consts.dart';
import 'custom_textfield.dart';
import 'custom_button.dart'; // Importa el widget CustomButton

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required List providers, required Padding Function(dynamic context, dynamic constraints, dynamic shrinkOffset) headerBuilder});

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
            //por ahora ponemos la ruta así, porque no hemos visto la parte de auth
            //no se deben factorizar porque en el futuro haran cosas distintas
            const duration = Duration(milliseconds: 500);
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: duration,
              ),
            );

          },
          backgroundColor: kItesoBlueLight,
        ),
        const SizedBox(height: 16.0),
        CustomButton(
          text: 'Continue as a guest',
          onPressed: () {
            const duration = Duration(milliseconds: 500);
            //este para que peudan ver la app, pero despues si quieren ahcer un pedido se debe ejecutar auth
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return ScaleTransition(scale: animation, child: child);
                },
                transitionDuration: duration,
              ),
            );
          },
          backgroundColor: kItesoGray,
        ),
      ],
    );
  }
}
