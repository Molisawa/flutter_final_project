<<<<<<< HEAD
=======
// import 'package:flutter/material.dart';
import 'dart:convert';
>>>>>>> 261f3648167e2245b34da1f1ead36315c154f570
import 'package:flutter_final_project/bubbleit/data/data.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:flutter_final_project/bubbleit/widgets/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currIndex = 0;
  late PageController _pageController;
  

<<<<<<< HEAD
  final List<Widget> _screens = [
    const HomeContent(),
    const ShoppingCartScreen(),
    const MapScreen(),
    const RewardsScreen()
  ];
=======
  final List<Widget> _screens = [];
>>>>>>> 261f3648167e2245b34da1f1ead36315c154f570

  @override
  void initState() {
    
   
    
    _pageController = PageController();
    _requestBasePermissions();

    // Initialize HomeContent with the product data
    _screens.addAll([
      const HomeContent(),
      const ShoppingCartScreen(),
      const MapScreen(),
      const RewardsScreen(),
    ]);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<PermissionStatus> _requestPermissionStorage() async {
    return await Permission.storage.request();
  }

  // Future<PermissionStatus> _requestPermissionNotifications() async {
  //   return await Permission.notification.request();
  // }

  Future<void> _requestBasePermissions() async {
    PermissionStatus storage = await _requestPermissionStorage();

    while (storage != PermissionStatus.granted) {
      if (storage.isPermanentlyDenied) {
        print("Permissions permanently denied.");
        return; // Break the loop if any permission is permanently denied.
      }
      // Request permissions again.
      storage = await _requestPermissionStorage();
    }

    if (storage.isGranted) {
      // Permissions are granted.
    }
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
            label: 'Map',
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
            duration: const Duration(milliseconds: 200),
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
  List<dynamic> products = [];
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
    products = jsonDecode(BubbleIT);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context)
        .isDarkMode; // Asegúrate de importar ThemeProvider

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
            return isDarkMode
                ? Colors.grey[900] // Reemplaza con tu color para el tema oscuro
                : Color.lerp(kItesoBlueLight, kItesoBlue, blendFactor)!;
          }(), // Color de fondo transparente inicial

          elevation: 0, // Sin sombra
<<<<<<< HEAD
          pinned:
              true, // La AppBar se fija en la parte superior al hacer scroll
          title: const Text('BubbleIT',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
=======
          pinned: true, // La AppBar se fija en la parte superior al hacer scroll
          title: const Text('BubbleIT',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
>>>>>>> 261f3648167e2245b34da1f1ead36315c154f570
          centerTitle: true, // Título del AppBar
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // go to //settings
              Navigator.pushNamed(context, '/settings');
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
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/images/welcome_banner.png',
                      fit: BoxFit.cover,
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/product_detail');
                  },
                  child: Column(
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
                      CustomSlider(products: products), // Use all products
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
