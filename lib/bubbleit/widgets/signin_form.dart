import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:flutter_final_project/bubbleit/widgets/custom_textfield.dart';
import 'package:flutter_final_project/bubbleit/widgets/custom_button.dart';
import '../screens/consts/consts.dart';

class SigninForm extends StatelessWidget {
  SigninForm({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<bool> registerWithEmailAndPassword(
      String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      return false;
    }
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return false;
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await FirebaseFirestore.instance.collection('users').add({
          'name': _nameController.text,
          'username': _usernameController.text,
          'email': email,
          'password': password,
        });

        return true;
      }
    } catch (e) {
      print("Error al registrar usuario $email: $e");
      return false;
    }
  }

  void _attemptRegistration(BuildContext context) async {
    if (_passwordController.text != _confirmPasswordController.text) {
      Flushbar(
        title: "Error",
        message: "Las contraseñas no coinciden",
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
      return;
    }

    bool registrationSuccessful = await registerWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
        _confirmPasswordController.text);

    if (registrationSuccessful) {
      Flushbar(
        title: "Registro Exitoso",
        message: "Usuario registrado correctamente",
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Flushbar(
        title: "Error",
        message: "No se pudo registrar el usuario",
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: CustomTextField(
                labelText: 'Nombre',
                controller: _nameController,
                obscureText: false,
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: CustomTextField(
                labelText: 'Nombre de usuario',
                controller: _usernameController,
                obscureText: false,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        CustomTextField(
          labelText: 'Correo electrónico',
          controller: _emailController,
          obscureText: false,
        ),
        const SizedBox(height: 12.0),
        CustomTextField(
          labelText: 'Contraseña',
          controller: _passwordController,
          obscureText: true,
        ),
        const SizedBox(height: 12.0),
        CustomTextField(
          labelText: 'Confirmar contraseña',
          controller: _confirmPasswordController,
          obscureText: true,
        ),
        const SizedBox(height: 20.0),
        CustomButton(
          text: 'Registrar',
          onPressed: () {
            _attemptRegistration(context);
          },
          backgroundColor: kItesoBlueLight,
        ),
      ],
    );
  }
}
