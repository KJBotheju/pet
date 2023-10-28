import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Petnwattala extends StatefulWidget {
  @override
  State<Petnwattala> createState() => _PetnwattalaState();
}

class _PetnwattalaState extends State<Petnwattala> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {}; // Define a set of markers

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(6.981727517713923, 79.88865157126247),
    zoom: 14.0,
  );

  static const CameraPosition targetPosition = CameraPosition(
    target: LatLng(6.981727517713923, 79.88865157126247),
    zoom: 20.0,
    bearing: 192.0,
    tilt: 60,
  );

  @override
  void initState() {
    super.initState();
    // Add a marker to the set
    _markers.add(
      Marker(
        markerId: MarkerId("petWattalaMarker"), // A unique ID for the marker
        position:
            LatLng(6.981727517713923, 79.88865157126247), // Marker's position
        infoWindow:
            InfoWindow(title: "Pet n Doc Wattala"), // Info window when tapped
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet n Doc Wattala"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        markers: _markers, // Set the markers on the map
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToLake();
        },
        label: const Text("Direction"),
        icon: const Icon(Icons.gps_fixed),
      ),
    );
  }

  Future<void> goToLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
