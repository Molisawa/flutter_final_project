import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/home/Home.dart';
import 'package:flutter_final_project/bubbleit/screens/login/Login.dart';


class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoginScreen();
          // return SignInScreen(
          //   providers: [
          //     EmailAuthProvider(),
          //   ],
          //   headerBuilder: (context, constraints, shrinkOffset) {
          //     return Padding(
          //       padding: const EdgeInsets.all(20),
          //       child: AspectRatio(
          //         aspectRatio: 1,
          //         child: Image.asset('assets/welcome_banner.png'),
          //       ),
          //     );
          //   },
          // );
        }
        // Waiting for authentication state to be available
        return const HomeScreen();
      },
    );
  }
}
