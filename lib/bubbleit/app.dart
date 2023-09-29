
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:flutter_final_project/bubbleit/screens/shopping_cart.dart/Shopping_cart.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RewardsScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        RewardsScreen.routeName: (_) => const RewardsScreen(),
        ShoppingCartScreen.routeName : (_) => const ShoppingCartScreen(),
      },
    );
  }
}
