import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BubbleIt',
            theme:
                themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            initialRoute: LoginScreen.routeName,
            routes: {
              HomeScreen.routeName: (_) => const HomeScreen(),
              LoginScreen.routeName: (_) => const LoginScreen(),
              RewardsScreen.routeName: (_) => const RewardsScreen(),
              ShoppingCartScreen.routeName: (_) => const ShoppingCartScreen(),
              OrderDetailScreen.routeName: (_) => const OrderDetailScreen(),
              MapScreen.routeName: (_) => const MapScreen(),
              SettingsScreen.routeName: (_) => const SettingsScreen()
            },
            onGenerateRoute: (settings) {
              if (settings.name == ProductDetailScreen.routeName) {
                final product = settings.arguments as dynamic;
                return MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                );
              }
              // Handle other dynamic routes if needed
              return null;
            },
          );
        },
      ),
    );
  }
}
