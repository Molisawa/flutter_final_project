import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/consts.dart';
import 'package:flutter_final_project/bubbleit/screens/settings/settings.dart';
import 'package:flutter_final_project/bubbleit/widgets/custom_bottombar.dart';
import 'package:flutter_final_project/bubbleit/widgets/product_description.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static String routeName = '/product_detail';
  final dynamic product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late String _selectedMilk = "";
  late String _selectedTopping = "";
  late String _selectedSize = "";
  late String _selectedSugar = "";

  bool _valuesComplete = false;

  void _updateSelectedValues(
    String selectedMilk,
    String selectedTopping,
    String selectedSize,
    String selectedSugar,
  ) {
    setState(() {
      _selectedMilk = selectedMilk;
      _selectedTopping = selectedTopping;
      _selectedSize = selectedSize;
      _selectedSugar = selectedSugar;
      _checkValuesCompleteness();
    });
  }

  void _checkValuesCompleteness() async {
  // Verificar si los valores necesarios están completos
    _valuesComplete = _selectedMilk.isNotEmpty &&
         _selectedTopping.isNotEmpty &&
         _selectedSize.isNotEmpty &&
         _selectedSugar.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name'] ?? 'Product Detail', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                        widget.product['imageUrl'],
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.product['name'] ?? 'Unknown Product',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '\$' +
                      widget.product['price'] ?? 'No price available.',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.product['description'] ?? 'No description available.',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ProductDescriptionWidget(
                      milkOptions: const ["Almendra", "Entera", "Light"],
                      toppingOptions: const ["Tapioca 1", "Tapioca 2", "Tapioca 3"],
                      sizeOptions: const ["Chico", "Mediano", "Grande"],
                      sugarOptions: const ["Sin azucar", "Moderado", "Azucar"],
                      onValuesSelected: _updateSelectedValues,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_valuesComplete)
            BottomBarWidget(
              product: widget.product,
              selectedValues: [_selectedMilk, _selectedTopping, _selectedSize, _selectedSugar],
          )
          else
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Seleccione sus opciones', style: TextStyle(fontSize: 15)),
            ),
        ],
      ),
    );
  }
}
