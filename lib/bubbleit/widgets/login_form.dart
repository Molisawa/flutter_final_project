import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import '../screens/consts/consts.dart';
import 'custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'custom_button.dart'; // Importa el widget CustomButton

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _email = '';
  String _password = '';

  Future<void> signInWithEmailAndPassword(String email, String password)async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      User? user = FirebaseAuth.instance.currentUser;
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      print('User: ${snapshot.data()}');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomTextField(labelText: 'Usuario', controller: _emailController),
        const SizedBox(height: 12.0),
        CustomTextField(labelText: 'Contraseña', controller: _passwordController),
        const SizedBox(height: 20.0),
        CustomButton(
          text: 'Sign In',
          onPressed: () {
            setState(){
              _emailController.text = _email;
              _passwordController.text = _password;
            }
            signInWithEmailAndPassword(_emailController.text, _passwordController.text);
            if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
              return;
            }
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
          text: 'Register',
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
