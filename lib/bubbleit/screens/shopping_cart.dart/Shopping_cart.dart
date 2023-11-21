import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ShoppingCartScreen({Key? key});
  static String routeName = '/shopping_cart';

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    // scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
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
                  blendFactor = blendFactor.clamp(
                      0.0, 1.0); // Ensure it's between 0 and 1
                  // Interpolate between the two colors based on the blend factor.
                  return isDarkMode
                      ? Colors.grey[
                          900] // Reemplaza con tu color para el tema oscuro
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
                              'assets/images/coffeeBubbleTea.png',
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
                                  Text('Coffee BubbleTea',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                      )),
                                  Text('\$98.00',
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
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.delete_outline_rounded),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Text('1',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                      )),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 4, // Change this count as needed
                ),
              ),
            ],
          ),
        ),
        BottomBar(isDarkMode: isDarkMode),
      ],
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

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
                const Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    '\$98.00',
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
