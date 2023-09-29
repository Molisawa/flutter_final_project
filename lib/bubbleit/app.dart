
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Oculta el banner de debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(), // Agrega SplashScreen como ruta

      },
    );
  }
}
