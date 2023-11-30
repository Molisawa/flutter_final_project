// import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:flutter_final_project/bubbleit/widgets/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currIndex = 0;
  late PageController _pageController;
  final List<Widget> _screens = [];
  bool isDarkMode = false;

  @override
  void initState() {
    _pageController = PageController();
    _requestBasePermissions();

    // Initialize HomeContent with the product data
    _screens.addAll([
      const HomeContent(),
      const ShoppingCartScreen(),
      const MapScreen(),
      // const RewardsScreen(),
    ]);
    super.initState();
  }

  Future<PermissionStatus> _requestPermissionStorage() async {
    return await Permission.storage.request();
  }

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
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: kItesoBlue,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currIndex = index;
          });
        },
        physics: currIndex == 2
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        selectedItemColor: isDarkMode ? kItesoBlue : Colors.black,
        unselectedItemColor: isDarkMode ? Colors.white : Colors.grey,
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.redeem),
          //   label: 'Rewards',
          // ),
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
  bool isLoading = true;
  late Future<void> dataFuture;

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();

      setState(() {
        products = querySnapshot.docs.map((doc) => doc.data()).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> initData() async {
    await getData();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        // The listener will call setState whenever the scroll position changes.
      });
    });
    dataFuture = initData();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return FutureBuilder(
      future: dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: () {
                  double blendFactor = (scrollController.hasClients
                          ? scrollController.offset
                          : 0) /
                      100.0;
                  blendFactor = blendFactor.clamp(
                      0.0, 1.0); // Ensure it's between 0 and 1
                  // Interpolate between the two colors based on the blend factor.
                  return isDarkMode
                      ? Colors
                          .grey[900] // Replace with your color for dark mode
                      : Color.lerp(kItesoBlueLight, kItesoBlue, blendFactor)!;
                }(),
                elevation: 1,
                pinned: true,
                title: const Text(
                  'BubbleIT',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const ImageCarousel(imageList: [
                      'assets/images/welcome_banner.png',
                      'assets/images/welcome_banner1.png',
                      'assets/images/welcome_banner.png',
                      'assets/images/welcome_banner1.png',
                    ]),
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
                          CustomSlider(products: products),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key, required this.imageList});
  final List<String> imageList;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: imageList
            .map((e) =>
                Center(child: Image.asset(e, fit: BoxFit.cover, width: 1000)))
            .toList());
  }
}
