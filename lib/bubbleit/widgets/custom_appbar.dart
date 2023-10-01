import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';

class AppBarWidget extends StatefulWidget {
  final bool isExpanded;

  const AppBarWidget({Key? key, required this.isExpanded}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {

    // Agrega un log para imprimir el valor de isExpanded
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      //si esta expandido el appbar se muestra el color de fondo sino que sea rojo
      backgroundColor: kItesoGrayLight,
      flexibleSpace: GestureDetector(
        onTap: () {
          // Acción cuando se toca el espacio flexible
        },
        child: FlexibleSpaceBar(
          
          background: FittedBox(
            child: Image.asset('assets/images/coffeeBubbleTea.png'),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
