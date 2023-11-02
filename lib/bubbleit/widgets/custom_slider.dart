import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final List<dynamic> products;

  const CustomSlider({Key? key, required this.products}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          var product = widget.products[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              '/product_detail',
              arguments: product,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: SizedBox(
                    width: 120.0,
                    height: 150.0,
                    child: Stack(
                      children: [
                        // Background Image (Smaller)
                        Image.asset(
                          product['image'],
                          width: 120.0,
                          height: 150.0, // Adjust the height to make the image smaller
                          fit: BoxFit.cover,
                        ),
                        // White Overlay with Text at the Bottom
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 120.0,
                            height: 50.0, // Adjust the height for the text container
                            color: Colors.white.withOpacity(0.6),
                            child: Center(
                              child: Text(
                                '${product['name']}',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
