import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/consts.dart';
import 'package:flutter_final_project/bubbleit/screens/settings/settings.dart';
import 'package:flutter_final_project/bubbleit/widgets/custom_bottombar.dart';
import 'package:flutter_final_project/bubbleit/widgets/product_description.dart';
import 'package:provider/provider.dart';


// Include necessary imports for ProductDescriptionWidget and its dependencies

class ProductDetailScreen extends StatelessWidget {
  static String routeName = '/product_detail';
  final dynamic product;

  ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name'] ?? 'Product Detail'),
        backgroundColor: isDarkMode ? Colors.grey[900] : kItesoBlueLight,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                      toppingOptions: const [
                        "Tapioca 1",
                        "Tapioca 2",
                        "Tapioca 3"
                      ],
                      sizeOptions: const ["Chico", "Mediano", "Grande"],
                      sugarOptions: const ["Sin azucar", "Moderado", "Azucar"],
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomBarWidget(),
        ],
      ),
    );
  }
}
