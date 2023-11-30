import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:flutter_final_project/bubbleit/screens/verification/verification_screen.dart';
import '../screens/consts/consts.dart';
import 'custom_textfield.dart';
import 'custom_button.dart'; // Importa el widget CustomButton

class SignupForm extends StatelessWidget {
  SignupForm({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

// o sea al chile si es medio inecesaria pero como ya me puse a haer que la otra sea promesa, ya ni pedo
  Future<bool> registerWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      // Create a new user with Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(_usernameController.text);
      }

      // Check if the user creation was successful
      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      // Handle different Firebase Auth errors, such as email already in use
      Flushbar(
        title: "Error de Autenticación",
        message: e.message ?? "Error desconocido",
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
      return false;
    } catch (e) {
      // Handle any other errors
      Flushbar(
        title: "Error",
        message: "Ha ocurrido un error: ${e.toString()}",
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
      return false;
    }
  }

  void _attemptRegistration(BuildContext context) async {
    // First check if the passwords match
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

    // Check if all fields are filled
    if (_nameController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      Flushbar(
        title: "Error",
        message: "Aún hay campos vacíos",
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
      return;
    }

    // Attempt to register the user
    bool registrationSuccessful = await registerWithEmailAndPassword(
        context, _emailController.text, _passwordController.text);

    if (registrationSuccessful) {
      // If registration is successful, send a verification email
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();

        // Notify the user to check their email
        Flushbar(
          title: "Verificación de Email",
          message:
              "Se ha enviado un correo de verificación. Por favor, verifica tu cuenta.",
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
        ).show(context);

        // Navigate to the home screen or a confirmation screen if you prefer
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const EmailVerificationScreen()),
        );
      }
    } else {
      // If registration was not successful, show an error message
      Flushbar(
        title: "Registro No Exitoso",
        message: "Hubo un problema con el registro",
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
