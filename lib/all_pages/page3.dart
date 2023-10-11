// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens/currentLocation_screen.dart';
import '../screens/searchPlace_screen.dart';
import '../screens/simpleMap_screen.dart';
import '../widgets/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatefulWidget {
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black, // Customize the app bar color
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/tracking_background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        // Customize the background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SimpleMapScreen();
                  },
                ));
              },
              child: Text(
                "Simple Map",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Customize the button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return CurrentLocationScreen();
                  },
                ));
              },
              child: Text(
                "Current Location",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Customize the button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SearchPlaceScreen();
                  },
                ));
              },
              child: Text(
                "Search Place",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, // Customize the button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),*/

            ElevatedButton(
              onPressed: () {
                _openMessagingAppToBind();
              },
              child: Text(
                "Bind with pet tracker",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Customize the button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openMessagingApp();
              },
              child: Text(
                "Pet Location",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, // Customize the button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _openMessagingApp() async {
  final recipient = "0723057778"; // Replace with the recipient's phone number
  final message = "777"; // Replace with your message

  final url = "sms:$recipient?body=$message";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _openMessagingAppToBind() async {
  final recipient = "0723057778"; // Replace with the recipient's phone number
  final message = "000"; // Replace with your message

  final url = "sms:$recipient?body=$message";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
