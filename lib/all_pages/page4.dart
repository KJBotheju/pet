// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pet/widgets/constant.dart';

class page4 extends StatefulWidget {
  @override
  State<page4> createState() => _page4State();
}

class _page4State extends State<page4> {
  // Create a list of items (you may add more items)
  List<String> items = [
    '',
  ];

  // Create a list of shop links corresponding to the items
  List<String> shop_link = [
    'https://www.onlinekade.lk/product-category/pet-care/pet-food/',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
        title: Text('Food Shop'),
      ),
      body: Container(
        color: Colors.grey[200], // Set the background color

        // Set padding for the container
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),

        child: SingleChildScrollView(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Set the number of columns
                mainAxisSpacing: 1.0,
                childAspectRatio:
                    1.4 // Set the vertical spacing between grid items
                ),

            // Make the GridView scrollable within the SingleChildScrollView
            shrinkWrap: true,

            // Disable GridView's own scrolling
            physics: NeverScrollableScrollPhysics(),

            // Define the number of items in the grid
            itemCount: items.length,

            // Build each grid item
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  // Set the background image for the grid item
                  image: DecorationImage(
                      image: AssetImage('assets/images/sh.jpeg'),
                      fit: BoxFit.cover),
                ),
                child: InkWell(
                  onTap: () {
                    // Open the link when the item is tapped
                    launch(shop_link[index]);
                  },
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        items[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.white.withOpacity(0.5),

                          // Set the text color and font size for the grid item
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
