// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Petvetclinic extends StatefulWidget {
  @override
  State<Petvetclinic> createState() => _PetvetclinicState();
}

class _PetvetclinicState extends State<Petvetclinic> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialPosition = CameraPosition(
      target: LatLng(6.8931998591168995, 79.87375660068321), zoom: 14.0);

  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(6.8931998591168995, 79.87375660068321),
      zoom: 20.0,
      bearing: 192.0,
      tilt: 60);

  Set<Marker> _markers = {}; // Define a set of markers

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId("petvet_clinic"), // A unique ID for the marker
        position: LatLng(
            6.8931998591168995, 79.87375660068321), // The target location
        infoWindow: InfoWindow(title: "Petvet Clinic"), // Optional info window
        // You can customize the marker's icon here if needed
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Petvet Clinic"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        markers: _markers, // Add the markers here
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
