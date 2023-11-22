import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:flutter_final_project/bubbleit/screens/sign_in/sign_in.dart';
import 'package:flutter_final_project/bubbleit/widgets/auth_wrapper.dart';
import '../screens/consts/consts.dart';
import 'custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'custom_button.dart'; // Importa el widget CustomButton

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _email = 'testing';
  final String _password = '';

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();
      print(querySnapshot);
      if (querySnapshot.docs.isNotEmpty) {
        print("yay");
        return true;
      } else {
        print("nay");
        return false;
      }
    } catch (e) {
      print(e);
      print("usuario " + email + ' y contraseña ' + password);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomTextField(labelText: 'Usuario', controller: _emailController),
        const SizedBox(height: 12.0),
        CustomTextField(
            labelText: 'Contraseña', controller: _passwordController, obscureText: true),
        const SizedBox(height: 20.0),
        CustomButton(
          text: 'Sign In',
          onPressed: () => _attemptLogin(context),
          backgroundColor: kItesoBlueLight,
        ),
        const SizedBox(height: 16.0),
        CustomButton(
          text: 'Register',
          onPressed: () {
            const duration = Duration(milliseconds: 500);
            //este para que peudan ver la app, pero despues si quieren ahcer un pedido se debe ejecutar auth
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SigninScreen(),
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