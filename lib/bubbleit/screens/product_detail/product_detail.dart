import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/widgets/product_description.dart';
// Include necessary imports for ProductDescriptionWidget and its dependencies

class ProductDetailScreen extends StatelessWidget {
  static String routeName = '/product_detail';
  final dynamic product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name'] ?? 'Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  product['image'],
                  width: 200, // You can adjust the size as needed.
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product['name'] ?? 'Unknown Product',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product['price'] ?? 'No price available.',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product['description'] ?? 'No description available.',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              ProductDescriptionWidget(
                milkOptions: const ["Almendra", "Entera", "Light"],
                toppingOptions: const ["ALmendra", "Entera", "Light"],
                sizeOptions: const ["ALmendra", "Entera", "Light"],
                sugarOptions: const ["ALmendra", "Entera", "Light"],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
