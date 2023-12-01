import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/home/Home.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  void initState() {
    super.initState();
    // Periodically check if the user has verified their email
    Future.delayed(const Duration(seconds: 3), checkEmailVerified);
  }

  Future<void> checkEmailVerified() async {
    // Assuming you have a Firebase Auth instance initialized
    User? user = FirebaseAuth.instance.currentUser;
    await user?.reload();
    if (user != null && user.emailVerified) {
      // If the email is verified, navigate to the HomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // If not verified, show a prompt or simply wait
      // You might want to include a button for the user to press to check again
      setState(() {}); // Call setState to refresh the UI if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar Email'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Por favor, revisa tu correo electrónico y confirma tu cuenta.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Manually check if the user has verified their email
                checkEmailVerified();
              },
              child: const Text('He confirmado mi correo'),
            ),
          ],
        ),
      ),
    );
  }
}
