import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';
import 'package:flutter_final_project/bubbleit/widgets/custom_expansiontile.dart';

class ProductDescriptionWidget extends StatefulWidget {
  final List<String> milkOptions;

  const ProductDescriptionWidget({
    Key? key,
    required this.milkOptions, required String selectedMilk,
  }) : super(key: key);

  @override
  _ProductDescriptionWidgetState createState() =>
      _ProductDescriptionWidgetState();
}

class _ProductDescriptionWidgetState extends State<ProductDescriptionWidget> {
  String selectedMilk = ''; // Mueve la variable al estado

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
            selectedValue: selectedMilk,
            options: widget.milkOptions,
            onChanged: (String value) {
              setState(() {
                selectedMilk = value; // Actualiza el estado con la leche seleccionada
              });
            },
          ),
          CustomExpansionTile(
            selectedValue: selectedMilk,
            options: widget.milkOptions,
            onChanged: (String value) {
              setState(() {
                selectedMilk = value; // Actualiza el estado con la leche seleccionada
              });
            },
          ),
          CustomExpansionTile(
            selectedValue: selectedMilk,
            options: widget.milkOptions,
            onChanged: (String value) {
              setState(() {
                selectedMilk = value; // Actualiza el estado con la leche seleccionada
              });
            },
          ),
        ],
      ),
    );
  }
}
