import 'package:flutter/material.dart';
import '../screens/currentLocation_screen.dart';
import '../screens/searchPlace_screen.dart';
import '../screens/simpleMap_screen.dart';

class page3 extends StatefulWidget {
  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SimpleMapScreen();
                  }));
                },
                child: const Text("Simple Map")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CurrentLocationScreen();
                  }));
                },
                child: const Text("Pets Currunt Location")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SearchPlaceScreen();
                  }));
                },
                child: const Text("Search Place")),
          ],
        ),
      ),
    );
  }
}
