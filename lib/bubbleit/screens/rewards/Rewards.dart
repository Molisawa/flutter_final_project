import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({Key? key});
  static String routeName = '/rewards';

  @override
  State<RewardsScreen> createState() => _RewardsState();
}

class _RewardsState extends State<RewardsScreen> {
  int counterPoints = 0;
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: () {
            double blendFactor =
                (scrollController.hasClients ? scrollController.offset : 0) /
                    100.0;
            blendFactor = blendFactor.clamp(0.0, 1.0);
            return Color.lerp(kItesoBlueLight, kItesoBlue, blendFactor)!;
          }(),
          elevation: 0,
          pinned: true,
          title: const Text('Rewards',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/multipleDrinks_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: kItesoBlue,
            child: Column(
              children: [
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
                      const Text('Your Points',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent)),
                      Text(
                        '$counterPoints',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
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
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text('Buy two Coffee Bubble Tea',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlueAccent)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/coffeeBubbleTea.png',
                                  height: 100, width: 93),
                              Image.asset('assets/images/coffeeBubbleTea.png',
                                  height: 100, width: 93),
                              const Text('=',
                                  style: TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.bold)),
                              Image.asset(
                                'assets/images/keychain.png',
                                height: 120,
                                width: 100,
                              ),
                            ],
                          ),
                          const Align(
                              alignment: Alignment.bottomRight,
                              child: Text('Get a keychain!',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
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
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Text('1000 Points?',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlueAccent))),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/images/plushie.png',
                              height: 150, width: 150),
                          const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text('Come get your plushie!!',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
