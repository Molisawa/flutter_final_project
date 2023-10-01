import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ProductDetailScreen extends StatefulWidget {
  static String routeName = '/product_detail';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedMilk = '';
  List<String> milkOptions = ['Leche 1', 'Leche 2', 'Leche 3'];
  bool isAppBarExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarWidget(isExpanded: isAppBarExpanded),
          SliverToBoxAdapter(
            child: ProductDescriptionWidget(
              selectedMilk: selectedMilk,
              milkOptions: milkOptions,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
