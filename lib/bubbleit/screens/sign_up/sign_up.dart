import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/widgets/signup_form.dart';
import '../consts/consts.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = '/login';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: kItesoBlue,
      appBar: AppBar(backgroundColor: kItesoBlue),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Column(
              children: <Widget>[
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: kItesoBlueStrong,
                  ),
                ),
                const SizedBox(height: 60.0),
                SignupForm(),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
