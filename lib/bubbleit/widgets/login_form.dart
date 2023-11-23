import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:flutter_final_project/bubbleit/screens/sign_up/sign_up.dart';
import '../screens/consts/consts.dart';
import 'custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'custom_button.dart'; // Importa el widget CustomButton

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  void _attemptLogin(BuildContext context) async {
    bool credentialsValid = await signInWithEmailAndPassword(
        _emailController.text, _passwordController.text);

    if (credentialsValid) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                const HomeScreen()), // Replace with your HomeScreen
      );
    } else {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        Flushbar(
          title: "Error",
          message: "Usuario o contraseña vacios",
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
        ).show(context);
        return;
      } else {
        Flushbar(
          title: "Error",
          message: "Usuario o contraseña incorrectos",
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
        ).show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomTextField(
            labelText: 'Correo',
            controller: _emailController,
            obscureText: false),
        const SizedBox(height: 12.0),
        CustomTextField(
            labelText: 'Contraseña',
            controller: _passwordController,
            obscureText: true),
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
            //este para que peudan ver la app, pero despues si quieren ahcer un pedido se debe ejecutar auth
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignupScreen()));
          },
          backgroundColor: kItesoGray,
        ),
      ],
    );
  }
}
