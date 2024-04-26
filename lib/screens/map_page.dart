import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "My location",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(0.0, 0.0),
          zoom: 15,
        ),
        markers: {
          const Marker(
            markerId: MarkerId("InitialPosition"),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(0.0, 0.0),
          )
        },
      ),
    );
  }
}
