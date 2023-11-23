import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:flutter_final_project/bubbleit/screens/sign_up/sign_up.dart';
import 'package:flutter_final_project/bubbleit/widgets/auth_wrapper.dart';
import '../screens/consts/consts.dart';
import 'custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'custom_button.dart'; // Importa el widget CustomButton

class SignupForm extends StatelessWidget {
  SignupForm({super.key});
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
      // Verificar si el usuario ya existe en la base de datos antes de registrar
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // El usuario ya existe, mostrar un mensaje de error
        return false;
      } else {
        // Crear un nuevo usuario en Firebase Authentication
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // El usuario no existe, registrar en la base de datos
        await FirebaseFirestore.instance.collection('users').add({
          'name': _nameController.text,
          'username': _usernameController.text,
          'email': email,
          'password': password,
        });
        return true;
      }
    } catch (e) {
      print(e);
      print("Error al registrar usuario " + email);
      return false;
    }
  }

  void _attemptRegistration(BuildContext context) async {
    //primero checamos si las contraseñas sin identicas, si no, ni tiene sentido hacer el reggistration
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
        MaterialPageRoute(
            builder: (context) =>
                const HomeScreen()), // Replace with your HomeScreen
      );
      // Puedes redirigir a la pantalla de inicio de sesión o a otra pantalla después del registro
    } else {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        Flushbar(
          title: "Error",
          message: "Usuario o contraseña vacíos",
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
        ).show(context);
        return;
      } else {
        Flushbar(
          title: "Error",
          message: "El usuario ya existe",
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
        const SizedBox(height: 50.0),
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


