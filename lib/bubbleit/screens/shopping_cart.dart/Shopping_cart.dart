import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key});
  static String routeName = '/shopping_cart';

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  int itemCount = 1;
  ScrollController scrollController = ScrollController();
  late Box<dynamic> cartBox;
  late List<Map<String, dynamic>> productsData;

  @override
  void initState() {
    super.initState();
    loadCartData();
  }

  Future<void> loadCartData() async {
    await Hive.openBox('cart');
    cartBox = Hive.box('cart');
    print(cartBox.values);
    productsData = [];

    for (var cartItem in cartBox.values) {
      if (cartItem != null && cartItem['product'] != null) {
        final productDetails = await getProductDetails(cartItem['product']);
        if (productDetails != null) {
          setState(() {
            productsData.add(productDetails);
          });
        }
      }
    }
  }

  Future<Map<String, dynamic>?> getProductDetails(String productId) async {
    try {
      final DocumentSnapshot product =
          await FirebaseFirestore.instance.collection('products').doc(productId).get();

      if (product.exists) {
        return product.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching product details: $e");
      return null;
    }
  }

  double calculateSubtotal() {
    double total = 0.0;
    for (int i = 0; i < productsData.length; i++) {
      total += double.parse(productsData[i]['price']) * cartBox.getAt(i)['quantity'];
    }
    return total;
  }


  @override
  void dispose() {
    scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return FutureBuilder(
      future: Hive.openBox('cart'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if(productsData.isEmpty){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: () {
                        double blendFactor = (scrollController.hasClients
                                ? scrollController.offset
                                : 0) /
                            100.0;
                        blendFactor = blendFactor.clamp(0.0, 1.0);
                        return isDarkMode
                            ? Colors.grey[900]
                            : Color.lerp(kItesoBlueLight, kItesoBlue, blendFactor)!;
                      }(),
                      pinned: true,
                      elevation: 1,
                      title: const Text(
                        'Your basket',
                        style: TextStyle(color: Colors.white),
                      ),
                      centerTitle: true,
                      actions: const <Widget>[
                        Column(
                          children: [
                            SizedBox(height: 20),
                          ],
                        ),
                        SizedBox(width: 15),
                      ],
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          Map<String, dynamic> productDetails = productsData[index];
                          int itemCount = cartBox.getAt(index)['quantity'];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Image.asset(
                                    productDetails['imageUrl'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 20, right: 10, bottom: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(productDetails['name'] ?? 'Unknown Product',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: isDarkMode
                                                  ? Colors.white
                                                  : Colors.black,
                                            )),
                                        Text('\$ ${productDetails['price']}',
                                            style: TextStyle(
                                              color: isDarkMode
                                                  ? Colors.white
                                                  : Colors.black,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 100, right: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          // Delete item from cart
                                          cartBox.deleteAt(index);
                                          setState(() {
                                            productsData.removeAt(index);
                                          });
                                        },
                                        icon: const Icon(
                                            Icons.delete_outline_rounded),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Text('$itemCount',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: isDarkMode
                                                  ? Colors.white
                                                  : Colors.black,
                                            )),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          // Add item to cart
                                          cartBox.putAt(
                                              index, {'product': productDetails['id'], 'quantity': itemCount + 1});
                                          setState(() {
                                            itemCount++;
                                          });
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: productsData.length,
                      ),
                    ),
                  ],
                ),
              ),
              BottomBar(isDarkMode: isDarkMode, calculateSubtotal: calculateSubtotal),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.isDarkMode, required this.calculateSubtotal,
  }) : super(key: key);

  final bool isDarkMode;
  final double Function() calculateSubtotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    '\$${calculateSubtotal().toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Add your logic here for what you want to do when tapping this area.
              // You can navigate to a new screen or perform any other action.
            },
            child: ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(200, 60)),
                backgroundColor: MaterialStateProperty.all(
                    isDarkMode ? Colors.grey[800] : kItesoBlueLight),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                // Perform any action you want when the button is pressed.
                // You can navigate to a new screen here if needed.
                Navigator.pushNamed(context, '/order_detail');
              },
              child: const Text('Go to pay',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
