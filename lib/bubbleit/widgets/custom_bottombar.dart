import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
import 'package:flutter_final_project/bubbleit/screens/screens.dart';

import 'package:provider/provider.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int itemCount = 1;
  bool isButtonActivated = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return BottomAppBar(
      elevation: 0.0,
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: isDarkMode ? Colors.grey[900] : Colors.white,
                    ),
                    onPressed: () {
                      if (itemCount > 1) {
                        setState(() {
                          itemCount--;
                        });
                      }
                    },
                  ),
                  Text(
                    '$itemCount',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (itemCount < 10) {
                        setState(() {
                          itemCount++;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(160, 60)),
                backgroundColor: MaterialStateProperty.all(
                  isDarkMode ? Colors.grey : kItesoBlueLight,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                // Acción cuando se presiona el botón azul
                isButtonActivated
                    ? null
                    : Flushbar(
                        title: 'Añadido al carrito',
                        message: 'Se ha añadido el producto al carrito',
                        duration: const Duration(seconds: 3),
                        backgroundColor: kItesoBlue,
                        margin: const EdgeInsets.all(8),
                        borderRadius: BorderRadius.circular(8),
                      ).show(context);
                setState(() {
                  isButtonActivated = true;
                });
              },
              child: const Text(
                'Add \$19.89',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
