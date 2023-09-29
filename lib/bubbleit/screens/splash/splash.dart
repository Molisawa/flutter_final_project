import 'dart:async';
import 'package:flutter/material.dart';

import '../screens.dart';
import '../consts/consts.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Agrega un temporizador para mostrar el splash durante 3 segundos (ajusta según tus necesidades)
    Timer(const Duration(seconds: 5), () {
      // Navega a la pantalla de inicio de sesión
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo kItesoBlueLight
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo_bubbleit.png', // Reemplaza con la ruta de tu imagen de splash
              width: 200.0, // Tamaño personalizado
              height: 200.0, // Tamaño personalizado
            ),
            const SizedBox(height: 20.0), // Espacio entre la imagen y el texto
            const Text(
              'Welcome!', // Texto "Welcome!"
              style: TextStyle(
                fontSize: 24.0, // Tamaño de fuente personalizado
                color: Colors.black, // Color de texto blanco
                fontWeight: FontWeight.bold, // Texto en negrita
              ),
            ),
          ],
        ),
      ),
    );
  }
}
