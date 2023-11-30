import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  
  static String routeName = '/map';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Set<Marker> markers = {}; // Conjunto de marcadores

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();

    markers.add(
       Marker(
        markerId: const MarkerId('branchCentral'),
        position: const LatLng(20.606872500000016, -103.4168543),
        infoWindow: const InfoWindow(
          title: 'Sucursal Central Iteso',
          snippet: 'Esta es la sucursal central de BubbleIT',
        ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure), // Puedes personalizar el color del marcador por defecto
      ),
    );

    // Agregar otro marcador
    markers.add(
      const Marker(
        markerId: MarkerId('branchQ'),
        position: LatLng(20.606386799999996, -103.41501590000001),
        infoWindow: InfoWindow(
          title: 'Sucursal Q',
          snippet: 'Esta es la sucursal Q de BubbleIT',
        ),
      ),
    );
  }

  Future<void> _requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    while (status != PermissionStatus.granted) {
      if (status.isPermanentlyDenied) {
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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(20.606885713632032, -103.41505788774599),
                zoom: 15.0,
              ),
              markers: markers,
            ),
          ),
        ],
      ),
    );
  }
}
