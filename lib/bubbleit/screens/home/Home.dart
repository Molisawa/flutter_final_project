import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
import 'package:flutter_final_project/bubbleit/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double appBarHeight = 100.0; // Altura de la AppBar inicial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kItesoBlue,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent, // Color de fondo transparente inicial
            expandedHeight: appBarHeight, // Altura expandida de la AppBar
            elevation: 0, // Sin sombra
            pinned: true, // La AppBar se fija en la parte superior al hacer scroll
            title: const Text('BubbleIT'), // Título del AppBar
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Agrega la funcionalidad del carrito aquí
                },
              ),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Calcula el valor de la altura máxima para la transición
                appBarHeight = constraints.maxHeight;
                // Calcula el color de fondo en función de la altura actual
                final backgroundColor = appBarHeight < 100.0 ? kItesoBlueLight : Colors.transparent; // Cambia este color al que desees
                return Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: SizedBox(
                    width: double.infinity, // Ancho de la tarjeta al ancho completo de la pantalla
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        'assets/images/welcome_banner.png', // Reemplaza 'tu_imagen.jpg' con la ruta correcta de tu imagen en los activos
                        fit: BoxFit.cover, // Ajusta la imagen al tamaño de la tarjeta
                      ),
                    ),
                  ),
                ),
                // Secciones con Sliders
                for (var sectionTitle in ['Top Sales', 'Seasonals', 'Specials', 'Favorites'])
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sectionTitle,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      const CustomSlider(),
                    ],
                  ),
              ],
            ),
          ),
        ],
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
    );
  }
}
