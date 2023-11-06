import 'package:flutter/material.dart';
import 'package:flutter_final_project/bubbleit/screens/settings/settings.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_final_project/bubbleit/screens/consts/color_palette.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
  static String routeName = '/map';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    while (status != PermissionStatus.granted) {
      if (status.isPermanentlyDenied) {
        print("Location permissions permanently denied.");
        return; // Break the loop if the user has permanently denied location permission.
      }
      status = await Permission.location.request();
    }

    if (status.isGranted) {
      // Location permissions are granted, you can perform location-related actions here.
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use Provider to determine if dark mode is enabled
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    // Set the appropriate background color based on the theme

    return Scaffold(
      backgroundColor: kItesoBlue, // Apply the background color here
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Image.asset(
                'assets/images/mapa1.png'), // Replace with your actual map image in assets
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
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          locationName,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
