import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/data/payment.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({
    super.key,
  });
  static String routeName = '/order_detail';

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreen();
}

class _OrderDetailScreen extends State<OrderDetailScreen> {
  List<dynamic> payment = [];
  bool _isOrderPlaced = false;

  @override
  void initState() {
    super.initState();
    payment = jsonDecode(PaymentBubble);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.grey[900] : kItesoBlue,
          title: const Text(
            'Your Order',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: const <Widget>[
            Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Empty',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            SizedBox(width: 15),
          ],
        ),
        body: Stack(
          children: [
            Container(
              color: kItesoBlue,
              width: MediaQuery.of(context)
                  .size
                  .width, // Ancho igual al ancho de la pantalla
              height: MediaQuery.of(context)
                  .size
                  .height, // Alto igual al alto de la pantalla
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Card(
                    color: isDarkMode ? Colors.grey[800] : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20, right: 10, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Payment Method',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 18)),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(payment[0]['card'] ?? 'No Card',
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    )),
                                Text(payment[0]['name'],
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: isDarkMode ? Colors.grey[800] : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20, right: 10, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: 18)),
                          const SizedBox(height: 8),
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(5),
                              1: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Text("Products",
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Text("\$100.30",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              // TODO: Integrate the ListView.builder for products here. You can convert each list item to a TableRow.
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 4.0),
                                    child: Text("Coffe Bubble Tea",
                                        style: TextStyle(
                                            color: isDarkMode
                                                ? const Color.fromARGB(
                                                    255, 220, 253, 250)
                                                : Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 4.0),
                                    child: Text("x1",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: isDarkMode
                                                ? const Color.fromARGB(
                                                    255, 220, 253, 250)
                                                : Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 4.0),
                                    child: Text("Coffe Bubble Tea",
                                        style: TextStyle(
                                            color: isDarkMode
                                                ? const Color.fromARGB(
                                                    255, 220, 253, 250)
                                                : Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 4.0),
                                    child: Text("x1",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: isDarkMode
                                                ? const Color.fromARGB(
                                                    255, 220, 253, 250)
                                                : Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              // ... Add more product rows if needed
                              TableRow(
                                children: [
                                  Text("Service Fee",
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Text("\$6.90",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
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
                            'Total Due',
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
                        // Agrega aquí la lógica para lo que deseas hacer al tocar este área.
                      },
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(200, 60)),
                          backgroundColor: MaterialStateProperty.all(
                            isDarkMode ? Colors.grey[800] : kItesoBlueLight,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _isOrderPlaced
                              ? null
                              : Flushbar(
                                  title: 'Order puesta',
                                  message: 'Tu orden ha sido puesta',
                                  duration: const Duration(seconds: 3),
                                  backgroundColor: kItesoBlue,
                                  margin: const EdgeInsets.all(8),
                                  borderRadius: BorderRadius.circular(8),
                                ).show(context);
                          setState(() {
                            _isOrderPlaced = true;
                          });
                        },
                        child: const Text('Place order',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
