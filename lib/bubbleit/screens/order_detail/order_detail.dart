import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({
    super.key,
  });
  static String routeName = '/order_detail';

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreen();
}

class _OrderDetailScreen extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Your Order',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            SizedBox(width: 15),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(15),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 20.0, left: 20, right: 10, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Payment Method',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18)),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Text("407561****0385",
                                      style: TextStyle(color: Colors.black)),
                                  Text("no se ni para que sirve este texto",
                                      style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
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
                            const Text('Order Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18)),
                            const SizedBox(height: 8),
                            Table(
                              columnWidths: const {
                                0: FlexColumnWidth(5),
                                1: FlexColumnWidth(1),
                              },
                              children: const [
                                TableRow(
                                  children: [
                                    Text("Products",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    Text("\$100.30",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                // TODO: Integrate the ListView.builder for products here. You can convert each list item to a TableRow.
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 4.0),
                                      child: Text("Coffe Bubble Tea",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 4.0),
                                      child: Text("x1",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 4.0),
                                      child: Text("Coffe Bubble Tea",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 4.0),
                                      child: Text("x1",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                // ... Add more product rows if needed
                                TableRow(
                                  children: [
                                    Text("Service Fee",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    Text("\$6.90",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Colors.black,
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
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Due',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(height: 5),
                          Padding(
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
                          minimumSize: MaterialStateProperty.all(Size(200, 60)),
                          backgroundColor:
                              MaterialStateProperty.all(kItesoBlueLight),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {},
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
