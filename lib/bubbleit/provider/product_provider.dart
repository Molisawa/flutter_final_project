import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  dynamic _selectedProduct;

  dynamic get selectedProduct => _selectedProduct;

  void setSelectedProduct(dynamic product) {
    _selectedProduct = product;
    notifyListeners();
  }
}
