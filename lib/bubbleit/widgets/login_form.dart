import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:flutter_final_project/bubbleit/screens/sign_up/sign_up.dart';
import '../screens/consts/consts.dart';
import 'custom_textfield.dart';
import 'custom_button.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomTextField(
          labelText: 'Correo',
          controller: _emailController,
          obscureText: false,
        ),
        const SizedBox(height: 12.0),
        CustomTextField(
          labelText: 'Contraseña',
          controller: _passwordController,
          obscureText: true,
        ),
        const SizedBox(height: 20.0),
        CustomButton(
          text: 'Sign In',
          onPressed: () {
            if (_emailController.text.isEmpty ||
                _passwordController.text.isEmpty) {
              Flushbar(
                title: "Error",
                message: "Usuario o contraseña vacíos",
                duration: const Duration(seconds: 3),
                margin: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(8),
              ).show(context);
              return;
            }

            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text)
                .then((userCredential) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            }).catchError((error) {
              Flushbar(
                title: "Error",
                message: "Usuario y/o contraseña incorrectos",
                duration: const Duration(seconds: 3),
                margin: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(8),
              ).show(context);
            });
          },
          backgroundColor: kItesoBlueLight,
        ),
        const SizedBox(height: 16.0),
        CustomButton(
          text: 'Register',
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignupScreen()));
          },
          backgroundColor: kItesoGray,
        ),
      ],
    );
  }
}
