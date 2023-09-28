import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0x00050038), // Utiliza el color definido en tus constantes
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset('assets/images/logo_bubbleit.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity, // Ancho máximo
                    child: ElevatedButton(
                      onPressed: () {
                        // Aquí puedes agregar la lógica para el inicio de sesión
                      },
                      child: const Text('Ingresar'),
                    ),
                  ),
                  const SizedBox(height: 16.0), // Espacio adicional para evitar el desbordamiento inferior
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
