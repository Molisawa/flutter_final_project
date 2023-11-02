import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
import 'package:flutter_final_project/bubbleit/widgets/custom_expansiontile.dart';

// ignore: must_be_immutable
class ProductDescriptionWidget extends StatefulWidget {
  final List<String> milkOptions;
  final List<String> toppingOptions;
  final List<String> sizeOptions;
  final List<String> sugarOptions;

  ProductDescriptionWidget({
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
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            titleText: 'Seleccione una leche',
            selectedValue: selectedMilk,
            options: widget.milkOptions,
            onChanged: (String value) {
              setState(() {
                selectedMilk = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
