// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet/screens/petvetclinic.dart';

import '../widgets/constant.dart';

class page6 extends StatefulWidget {
  @override
  State<page6> createState() => _page6State();
}

class _page6State extends State<page6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('veterinary hospital'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
      ),
      body: GridView.count(
        crossAxisCount: 1, // Number of columns in the grid
        padding: EdgeInsets.all(6.0),
        children: <Widget>[
          // Define your buttons here
          MyGridButton(
            text: 'Petvet Clinic',
            imageAsset:
                'assets/images/petvetclinic.JPG', // Specify the image path for this button
            onPressed: () {
              // Call the method for Petvet Clinic button
              goToPetvetClinic();
            },
          ),
          MyGridButton(
            text: 'Button 2',
            imageAsset:
                'assets/images/dog1.jpg', // Specify the image path for this button
            onPressed: () {
              // Call the method for Button 2
              goToButton2();
            },
          ),
          MyGridButton(
            text: 'Button 3',
            imageAsset:
                'assets/images/dog2.jpg', // Specify the image path for this button
            onPressed: () {
              // Call the method for Button 3
              goToButton3();
            },
          ),
          // Add more buttons here with their respective image assets
        ],
      ),
    );
  }

  // Define your methods for each button here
  void goToPetvetClinic() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Petvetclinic();
    }));
  }

  void goToButton2() {
    // Implement the action for Button 2
  }

  void goToButton3() {
    // Implement the action for Button 3
  }

  // Add more methods for other buttons
}

class MyGridButton extends StatelessWidget {
  final String text;
  final String imageAsset;
  final VoidCallback onPressed;

  MyGridButton(
      {required this.text, required this.imageAsset, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: InkWell(
        onTap: onPressed, // Use the provided onPressed callback
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Background image
            Image.asset(
              imageAsset,
              fit: BoxFit.cover,
            ),
            // Button text with background color
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(8.0), // Adjust padding as needed
              color: Colors.black
                  .withOpacity(0.5), // Background color with opacity
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
