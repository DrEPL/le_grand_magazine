import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  late GoogleMapController _controller;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-4.262644, 15.260375),
    zoom: 17.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers: {
          Marker(
      markerId: const MarkerId('Le Grand Magazine'),
      position: _kGooglePlex.target,
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'Le Grand Magazine',
        snippet: 'Lat: ${_kGooglePlex.target.latitude}, Lng: ${_kGooglePlex.target.longitude}',
      ),
    )
        },
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },child: const Icon(Icons.home),
      ),
    );
  }
}