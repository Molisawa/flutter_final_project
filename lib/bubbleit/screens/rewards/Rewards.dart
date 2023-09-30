import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});
  static String routeName = '/rewards';

  @override
  State<RewardsScreen> createState() => _RewardsState();
}

class _RewardsState extends State<RewardsScreen> {
  int counterPoints = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kItesoBlueLight,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/rewardsIcon.png'),
                iconSize: 60,
              ),
              const Text('Rewards', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              iconSize: 25,
              onPressed: () {
                Navigator.pushNamed(context, '/shopping_cart');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: kItesoBlue,
            child: Column(
              children: [
                Image.asset('assets/images/multipleDrinks_background.png'),
                const SizedBox(height: 20),
        
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Your Points', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent)),
                      Text('$counterPoints', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                    ],
                  ),
                ),
        
                const SizedBox(height: 20),
        
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // Text('Buy two Cofee Bubble Tea', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Buy two Cofee Bubble Tea', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/coffeeBubbleTea.png', height: 100, width: 100), // Reducir el ancho de la imagen
                              Image.asset('assets/images/coffeeBubbleTea.png', height: 100, width: 100), // Reducir el ancho de la imagen
        
                              const Text('=', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold)), // Reducir el ancho de la imagen
                              Image.asset(
                                'assets/images/keychain.png', // Ruta de la otra imagen
                                height: 120, // Altura de la otra imagen
                                width: 100,   // Ancho de la otra imagen
                              ),
                            ],
                          ),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Text('Get a keychain!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        
                const SizedBox(height: 20),
        
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // Text('Buy two Cofee Bubble Tea', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text('1000 Points?', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent))
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/images/plushie.png', height: 150, width: 150),
                          const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Come get your plushie!!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Fondo azul
        selectedItemColor: Colors.black, // Iconos seleccionados en blanco
        unselectedItemColor: Colors.grey, // Iconos no seleccionados en blanco
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.redeem),
            label: 'Rewards',
          ),
        ],
      ),
      ),
    );
  }
}
