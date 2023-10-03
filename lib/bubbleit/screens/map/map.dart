import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);
  static String routeName = '/map';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Image.asset('assets/images/mapa1.png'), // Reemplaza 'tu_mapa.png' con la ubicación correcta de tu mapa en assets
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildLocationCard("Ubicación 1"),
                _buildLocationCard("Ubicación 2"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationCard(String locationName) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          locationName,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}