import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0, // Altura del slider
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4, // Número de cards en el slider
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SizedBox(
                width: 120.0, // Ancho de cada card en el slider
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.image, // Puedes reemplazar esto con tu imagen
                      size: 50.0,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Título $index', // Reemplaza con tu título real
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
