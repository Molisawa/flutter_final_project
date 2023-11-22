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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<bool> registerWithEmailAndPassword(String email, String password, String confirmPassword) async {
    if(password != confirmPassword){
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
          'email': email,
          'password': password,
          // Otros campos de usuario si es necesario
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
    bool registrationSuccessful = await registerWithEmailAndPassword(
        _emailController.text, _passwordController.text, _confirmPasswordController.text);

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
            builder: (context) => const HomeScreen()), // Replace with your HomeScreen
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
        CustomTextField(labelText: 'Usuario', controller: _emailController, obscureText: false),
        const SizedBox(height: 12.0),
        CustomTextField(
            labelText: 'Contraseña', controller: _passwordController, obscureText: true),
        const SizedBox(height: 12.0),
        CustomTextField(
            labelText: 'Confirm Contraseña', controller: _confirmPasswordController, obscureText: true),
        const SizedBox(height: 20.0),
        CustomButton(
          text: 'Register',
          onPressed: () {
            _attemptRegistration(context);
          },
          backgroundColor: kItesoBlueLight,
        ),
        const SizedBox(height: 16.0),
        CustomButton(
          text: 'Sign In',
          onPressed: () {
            const duration = Duration(milliseconds: 500);
            //este para que peudan ver la app, pero despues si quieren ahcer un pedido se debe ejecutar auth
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const LoginScreen(),
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