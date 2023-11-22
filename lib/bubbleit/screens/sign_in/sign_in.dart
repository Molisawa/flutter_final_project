import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/widgets/signin_form.dart';
import '../../widgets/login_form.dart';
import '../consts/consts.dart';

class SigninScreen extends StatefulWidget {
  static String routeName = '/login';
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: kItesoBlue,
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
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Card(
                    elevation: 0.0,
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
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: kItesoBlueStrong,
                  ),
                ),
                const SizedBox(height: 20.0),
                SigninForm(),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
