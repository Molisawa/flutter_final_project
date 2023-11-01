import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';

import '../../widgets/widgets.dart';

class ProductDetailScreen extends StatefulWidget {
  static String routeName = '/product_detail';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedMilk = '';
  String selectedTopping = '';
  String selectedSize = '';
  String selectedSugar = '';
  List<String> milkOptions = ['Leche 1', 'Leche 2', 'Leche 3'];
  List<String> toppingOptions = ['Topping 1', 'Topping 2', 'Topping 3'];
  List<String> sizeOptions = ['Tamaño 1', 'Tamaño 2', 'Tamaño 3'];
  List<String> sugarOptions = ['Azúcar 1', 'Azúcar 2', 'Azúcar 3'];
  bool isAppBarExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kItesoGrayLight,
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarWidget(isExpanded: isAppBarExpanded),
          SliverToBoxAdapter(
            child: ProductDescriptionWidget(
              selectedMilk: selectedMilk,
              selectedTopping: selectedTopping,
              selectedSize: selectedSize,
              selectedSugar: selectedSugar,
              milkOptions: milkOptions,
              toppingOptions: toppingOptions,
              sizeOptions: sizeOptions,
              sugarOptions: sugarOptions,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
