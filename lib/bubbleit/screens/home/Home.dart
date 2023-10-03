import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:flutter_final_project/bubbleit/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currIndex = 0;
  late PageController _pageController;

  final List<Widget> _screens = [
    HomeContent(),
    ShoppingCartScreen(),
    MapScreen(),
    RewardsScreen()
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kItesoBlue,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
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
            icon: Icon(Icons.place_rounded),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.redeem),
            label: 'Rewards',
          ),
        ],
        currentIndex: currIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  double appBarHeight = 100.0;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        // The listener will call setState whenever the scroll position changes.
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: () {
            double blendFactor =
                (scrollController.hasClients ? scrollController.offset : 0) /
                    100.0;
            blendFactor =
                blendFactor.clamp(0.0, 1.0); // Ensure it's between 0 and 1
            // Interpolate between the two colors based on the blend factor.
            return Color.lerp(kItesoBlueLight, kItesoBlue, blendFactor)!;
          }(), // Color de fondo transparente inicial

          elevation: 0, // Sin sombra
          pinned:
              true, // La AppBar se fija en la parte superior al hacer scroll
          title: const Text('BubbleIT'),
          centerTitle: true, // Título del AppBar
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Agrega la funcionalidad del carrito aquí
              },
            ),
          ],
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
                  width: double
                      .infinity, // Ancho de la tarjeta al ancho completo de la pantalla
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/images/welcome_banner.png', // Reemplaza 'tu_imagen.jpg' con la ruta correcta de tu imagen en los activos
                      fit: BoxFit
                          .cover, // Ajusta la imagen al tamaño de la tarjeta
                    ),
                  ),
                ),
              ),
              // Secciones con Sliders
              for (var sectionTitle in [
                'Top Sales',
                'Seasonals',
                'Specials',
                'Favorites'
              ])
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
    );
  }
}
