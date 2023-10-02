import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
import 'package:flutter_final_project/bubbleit/widgets/custom_expansiontile.dart';

class ProductDescriptionWidget extends StatefulWidget {
  final List<String> milkOptions;
  final List<String> toppingOptions;
  final List<String> sizeOptions;
  final List<String> sugarOptions;
  String selectedMilk; // Elimina la palabra clave 'final' aquí
  final String selectedTopping;
  final String selectedSize;
  final String selectedSugar;

  ProductDescriptionWidget({
    Key? key,
    required this.milkOptions,
    required this.selectedMilk,
    required this.selectedTopping,
    required this.selectedSize,
    required this.selectedSugar,
    required this.toppingOptions,
    required this.sizeOptions,
    required this.sugarOptions,
  }) : super(key: key);

  @override
  _ProductDescriptionWidgetState createState() =>
      _ProductDescriptionWidgetState();
}

class _ProductDescriptionWidgetState extends State<ProductDescriptionWidget> {
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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Bubble Tea',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: kItesoBlueStrong,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Descripción breve del producto.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '\$19.89',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomExpansionTile(
            titleText: 'Seleccione una leche',
            selectedValue: widget.selectedMilk,
            options: widget.milkOptions,
            onChanged: (String value) {
              setState(() {
                widget.selectedMilk = value;
              });
            },
          ),
          CustomExpansionTile(
            titleText: 'Seleccione tipo de tapioca',
            selectedValue: widget.selectedTopping,
            options: widget.toppingOptions,
            onChanged: (String value) {
              setState(() {
                widget.selectedMilk = value;
              });
            },
          ),
          CustomExpansionTile(
            titleText: 'Seleccione un tamaño',
            selectedValue: widget.selectedSize,
            options: widget.sizeOptions,
            onChanged: (String value) {
              setState(() {
                widget.selectedMilk = value;
              });
            },
          ),
          CustomExpansionTile(
            titleText: 'Seleccione un nivel de azúcar',
            selectedValue: widget.selectedSugar,
            options: widget.sugarOptions,
            onChanged: (String value) {
              setState(() {
                widget.selectedMilk = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
