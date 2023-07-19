// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapScreen extends StatefulWidget {
  @override
  State<SimpleMapScreen> createState() => _SimpleMapScreenState();
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialPosition = CameraPosition(
      target: LatLng(6.970193220667125, 79.9051577177291), zoom: 14.0);

  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(6.970193220667125, 79.9051577177291),
      zoom: 20.0,
      bearing: 192.0,
      tilt: 60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToLake();
        },
        label: const Text("Find My Pet"),
        icon: const Icon(Icons.gps_fixed),
      ),
    );
  }

  Future<void> goToLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
