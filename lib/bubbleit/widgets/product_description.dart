import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/settings/settings.dart';
import 'package:flutter_final_project/bubbleit/widgets/custom_expansiontile.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductDescriptionWidget extends StatefulWidget {
  final List<String> milkOptions;
  final List<String> toppingOptions;
  final List<String> sizeOptions;
  final List<String> sugarOptions;

  const ProductDescriptionWidget({
    Key? key,
    required this.milkOptions,
    required this.toppingOptions,
    required this.sizeOptions,
    required this.sugarOptions,
  }) : super(key: key);

  @override
  _ProductDescriptionWidgetState createState() =>
      _ProductDescriptionWidgetState();
}

class _ProductDescriptionWidgetState extends State<ProductDescriptionWidget> {
  String selectedMilk = "";
  String selectedTopping = "";
  String selectedSize = "";
  String selectedSugar = "";
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomExpansionTile(
            titleText: 'Seleccione el tamaño',
            selectedValue: selectedSize,
            options: widget.sizeOptions,
            onChanged: (String value) {
              setState(() {
                selectedSize = value;
              });
            },
          ),
          CustomExpansionTile(
            titleText: 'Seleccione una leche',
            selectedValue: selectedMilk,
            options: widget.milkOptions,
            onChanged: (String value) {
              setState(() {
                selectedMilk = value;
              });
            },
          ),
          CustomExpansionTile(
            titleText: 'Seleccione su topping',
            selectedValue: selectedTopping,
            options: widget.toppingOptions,
            onChanged: (String value) {
              setState(() {
                selectedTopping = value;
              });
            },
          ),
          CustomExpansionTile(
            titleText: 'Nivel de azucar',
            selectedValue: selectedSugar,
            options: widget.sugarOptions,
            onChanged: (String value) {
              setState(() {
                selectedSugar = value;
              });
            },
          ),
          //  BottomBarWidget(),
        ],

      ),
    );
  }
}