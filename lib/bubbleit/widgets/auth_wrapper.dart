import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
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
          // return MaterialApp(
          //   theme: ThemeData(
          //     primarySwatch: Colors.blue,
          //     inputDecorationTheme: InputDecorationTheme(
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //     ),
              
          //     outlinedButtonTheme: OutlinedButtonThemeData(
          //       style: ButtonStyle(
          //         padding: MaterialStateProperty.all<EdgeInsets>(
          //           const EdgeInsets.symmetric(
          //             vertical: 16,
          //             horizontal: 24,
          //           ),
          //         ),
          //         backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          //         foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          //       ),
          //     ),

          //     //Modificar el Text 
          //     textButtonTheme: TextButtonThemeData(
          //       style: ButtonStyle(
          //         padding: MaterialStateProperty.all<EdgeInsets>(
          //           const EdgeInsets.symmetric(
          //             vertical: 16,
          //             horizontal: 24,
          //           ),
          //         ),
          //         foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          //       ),
          //     ),
              
          //   ),

          // home: Scaffold(
          //   backgroundColor: Colors.blue,
          //   body: LoginScreen(),
          //   // body: LoginScreen(
          //   //   providers: [
          //   //     EmailAuthProvider(),
          //   //   ],
          //   //   headerBuilder: (context, constraints, shrinkOffset) {
          //   //     return 
          //   //     Padding(
          //   //       padding: const EdgeInsets.all(20),
          //   //       child: AspectRatio(
          //   //         aspectRatio: 1,
          //   //         child: Image.asset('assets/images/welcome.jpg'),
          //   //       ),
          //   //     );
          //   //   },
          //   // ),
          // ),
          // );
        }
        // Waiting for authentication state to be available
        return const HomeScreen();
      },
    );
  }
}
